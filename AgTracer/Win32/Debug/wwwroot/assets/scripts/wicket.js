/**
Script to handle WKT Polygons
**/
var mapp = (function () {
    
    return {
	    
        features: [],
        /**
         * Clears the map contents.
         */
        clearMap: function () {
            var i;

            // Reset the remembered last string (so that we can clear the map,
            //  paste the same string, and see it again)
            document.getElementById('WKT').last = '';

            for (i in this.features) {
                if (this.features.hasOwnProperty(i)) {
                    this.features[i].setMap(null);
                }
            }
            this.features.length = 0;
        },
        /**
         * Clears the current contents of the textarea.
         */
        clearText: function () {
            document.getElementById('WKT').value = '';
        },
        /**
         * Maps the current contents of the textarea.
         * @return  {Object}    Some sort of geometry object
         */
        mapIt: function () {
            var el, obj, wkt;

            el = document.getElementById('WKT');
            wkt = new Wkt.Wkt();

            if (el.last === el.value) { // Remember the last string
                return; // Do nothing if the WKT string hasn't changed
            } else {
                el.last = el.value;
            }

            try { // Catch any malformed WKT strings
                wkt.read(el.value);
            } catch (e1) {
                try {
                    wkt.read(el.value.replace('\n', '').replace('\r', '').replace('\t', ''));
                } catch (e2) {
                    if (e2.name === 'WKTError') {
                        alert('Wicket could not understand the WKT string you entered. Check that you have parentheses balanced, and try removing tabs and newline characters.');
                        return;
                    }
                }
            }

            obj = wkt.toObject(this.gmap.defaults); // Make an object

            // Add listeners for overlay editing events
            if (!Wkt.isArray(obj) && wkt.type !== 'point') {
                // New vertex is inserted
                google.maps.event.addListener(obj.getPath(), 'insert_at', function (n) {
                    mapp.updateText();
                });
                // Existing vertex is removed (insertion is undone)
                google.maps.event.addListener(obj.getPath(), 'remove_at', function (n) {
                    mapp.updateText();
                });
                // Existing vertex is moved (set elsewhere)
                google.maps.event.addListener(obj.getPath(), 'set_at', function (n) {
                    mapp.updateText();
                });
            } else {
                if (obj.setEditable) {obj.setEditable(false);}
            }

			var bounds = new google.maps.LatLngBounds();

            if (Wkt.isArray(obj)) { // Distinguish multigeometries (Arrays) from objects
                for (i in obj) {
                    if (obj.hasOwnProperty(i) && !Wkt.isArray(obj[i])) {
                        obj[i].setMap(this.gmap);
                        this.features.push(obj[i]);

                        if(wkt.type === 'point' || wkt.type === 'multipoint')
                        	bounds.extend(obj[i].getPosition());
                        else
                        	obj[i].getPath().forEach(function(element,index){bounds.extend(element)});
                    }
                }

                this.features = this.features.concat(obj);
            } else {
                obj.setMap(this.gmap); // Add it to the map
                this.features.push(obj);

                if(wkt.type === 'point' || wkt.type === 'multipoint')
                	bounds.extend(obj.getPosition());
                else
                	obj.getPath().forEach(function(element,index){bounds.extend(element)});
            }

            // Pan the map to the feature
            this.gmap.fitBounds(bounds);

            return obj;
        },
        /**
         * Updates the textarea based on the first available feature.
         */
        updateText: function () {
            var wkt = new Wkt.Wkt();
            wkt.fromObject(this.features[0]);
            document.getElementById('WKT').value = wkt.write();
        },
        updateTextPart: function () {
            var i, w, v;

            w = new Wkt.Wkt(this.features[0]);

            i = 1;
            while (i < this.features.length) {
                v = new Wkt.Wkt(this.features[i]);
                w.merge(v);
                i += 1;
            }

            document.getElementById('WKT').value = w.write();
        },
        /**
         * Formats the textarea contents for a URL.
         * @param   checked {Boolean}   The check state of the associated checkbox
         */
        urlify: function (checked) {
            var wkt = new Wkt.Wkt();
            wkt.read(document.getElementById('WKT').value);
            wkt.delimiter = (checked) ? '+' : ' ';
            document.getElementById('WKT').value = wkt.write();
            return wkt;
        },
		
		
		geocode: function () {
		    var geocoder;
			geocoder = new google.maps.Geocoder();
			var address = document.getElementById('address').value;
			geocoder.geocode( { 'address': address}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				this.mapp.gmap.setOptions({
				center: results[0].geometry.location,
				zoom: 15
				});
			} else {
				alert('Geocode was not successful for the following reason: ' + status);
			}
		});
		},
		
		
        /**
         * Application entry point.
         * @return  {<google.maps.Map>} The Google Maps API instance
         */
        init: function () {
            
			var gmap;
			
            gmap = new google.maps.Map(document.getElementById('canvas'), {
                center: new google.maps.LatLng(-20.538889, -47.400833),
                defaults: {
                    icon: 'red_dot.png',
                    shadow: 'dot_shadow.png',
                    editable: true,
                    strokeColor: '#990000',
                    fillColor: '#EEFFCC',
                    fillOpacity: 0.6
                },
                disableDefaultUI: true,
                mapTypeControl: true,
                mapTypeId: google.maps.MapTypeId.HYBRID,
                mapTypeControlOptions: {
                    position: google.maps.ControlPosition.TOP_LEFT,
                    style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
                },
                panControl: true,
                streetViewControl: false,
                zoom: 15,
                zoomControl: true,
                zoomControlOptions: {
                    position: google.maps.ControlPosition.LEFT_TOP,
                    style: google.maps.ZoomControlStyle.SMALL
                }
            });
			
			
            google.maps.event.addListener(gmap, 'tilesloaded', function () {
                if (!this.loaded) {
                    this.loaded = true;
                    // NOTE: We start with a MULTIPOLYGON; these aren't easily deconstructed, so we won't set this object to be editable in this example
                    //document.getElementById('WKT').value = 'MULTIPOLYGON (((40 40, 20 45, 45 30, 40 40)), ((20 35, 45 20, 30 5, 10 10, 10 30, 20 35), (30 20, 20 25, 20 15, 30 20)))';
					if (document.getElementById('WKT').value !== '') {
                     mapp.mapIt();
					};
                }
            });

            gmap.drawingManager = new google.maps.drawing.DrawingManager({
                drawingControlOptions: {
                    position: google.maps.ControlPosition.TOP_CENTER,
                    drawingModes: [
                        //google.maps.drawing.OverlayType.MARKER,
                        //google.maps.drawing.OverlayType.POLYLINE,
						//google.maps.drawing.OverlayType.RECTANGLE,
                        google.maps.drawing.OverlayType.POLYGON
                        
                    ]
                },
                //markerOptions: gmap.defaults,
                //rectangleOptions: gmap.defaults,
                //polylineOptions: gmap.defaults,
                polygonOptions: gmap.defaults
            });
            gmap.drawingManager.setMap(gmap);
			
			// add a listener for the drawing mode change event, delete any existing polygons
			google.maps.event.addListener(gmap.drawingManager, "drawingmode_changed", function () {
				if (gmap.drawingManager.getDrawingMode() != null) {
					mapp.clearMap();
				}
			});

            google.maps.event.addListener(gmap.drawingManager, 'overlaycomplete', function (event) {
                var wkt;

                mapp.clearText();
                mapp.clearMap();

                // Set the drawing mode to "pan" (the hand) so users can immediately edit
                this.setDrawingMode(null);

                // Polygon drawn
                if (event.type === google.maps.drawing.OverlayType.POLYGON || event.type === google.maps.drawing.OverlayType.POLYLINE) {
                    // New vertex is inserted
                    google.maps.event.addListener(event.overlay.getPath(), 'insert_at', function (n) {
                        mapp.updateText();
                    });

                    // Existing vertex is removed (insertion is undone)
                    google.maps.event.addListener(event.overlay.getPath(), 'remove_at', function (n) {
                        mapp.updateText();
                    });

                    // Existing vertex is moved (set elsewhere)
                    google.maps.event.addListener(event.overlay.getPath(), 'set_at', function (n) {
                        mapp.updateText();
                    });
                } else if (event.type === google.maps.drawing.OverlayType.RECTANGLE) { // Rectangle drawn
                    // Listen for the 'bounds_changed' event and update the geometry
                    google.maps.event.addListener(event.overlay, 'bounds_changed', function () {
                        mapp.updateText();
                    });
                }

                mapp.features.push(event.overlay);
                wkt = new Wkt.Wkt();
                wkt.fromObject(event.overlay);
                document.getElementById('WKT').value = wkt.write();
                });

            return gmap;
        }
    };
}());
