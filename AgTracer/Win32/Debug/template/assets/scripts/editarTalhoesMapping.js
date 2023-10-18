/**
Script to handle WKT Polygons
**/
var mapp = (function () {

	var selectedShape;
	var pathsBeforeEdit;
	var selectedColor;
    var opened_info = new google.maps.InfoWindow();
	
    return {
		
        features: [],
		
        /**
         * Clears the map contents.
         */
        clearMap: function () {
            var i;

            for (i in this.features) {
                if (this.features.hasOwnProperty(i)) {
                    this.features[i].setMap(null);
                }
            }
            this.features.length = 0;
        },
		
		onHideDiv: function(){
			$("#MULTICOMBOVARIEDAES").select2("destroy"); //Back to a normal edit
			$("#CHKIRRIGADO").bootstrapSwitch("destroy");//Back to a normal edit
			$("#CHKIRRIGADO").attr('type', 'input');
		},
		
		onShowDiv: function(){
			multiCombo.init(); //Construct MultiCombo
			$("#CHKIRRIGADO").bootstrapSwitch("destroy");//Back to a normal edit
			$("[id^='CHK']").attr('type', 'checkbox');
			$("[id^='CHK'][value='on']").prop("checked", true); //Exibir ON como checked
			$("[id^='CHK'][value='off']").prop("checked", false); //Exibir OFF como unchecked
			$("[id^='CHK']").addClass("toggle");
			$("[id^='CHK']").bootstrapSwitch();
		},
		
		
		getRandomColor: function () {
            var letters = '0123456789ABCDEF'.split('');
            var color = '#';
            for (var i = 0; i < 6; i++) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        },
		
		selectColor: function (color) {
            selectedColor = color;

            // Retrieves the current options from the drawing manager and replaces the
            // stroke or fill color as appropriate.
            var polylineOptions = this.gmap.drawingManager.get('polylineOptions');
            polylineOptions.strokeColor = color;
            this.gmap.drawingManager.set('polylineOptions', polylineOptions);

            var polygonOptions = this.gmap.drawingManager.get('polygonOptions');
            polygonOptions.fillColor = color;
            this.gmap.drawingManager.set('polygonOptions', polygonOptions);
        },
		
		//Clear selected Shape
        clearSelection: function () {
			if ($("#EDITORDIV").is(":visible")){
				alert('Finalize a edição para voltar');
				return;
			};
			opened_info.close();
            if (selectedShape) {
                selectedShape.setEditable(false);
                selectedShape = null;
            }
			//Select a new color
			mapp.selectColor(mapp.getRandomColor());
        },
           
        //Set selected shape 
        setSelection: function (shape, isNew) {
            mapp.clearSelection();
            selectedShape = shape;
			mapp.updateText(shape);
			if (!isNew){
				//store polygon paths in case of edit cancel
				var vertices = shape.getPath();
				// Iterate over the vertices.
				pathsBeforeEdit = [];
				for (var i =0; i < vertices.getLength(); i++) {
					var xy = vertices.getAt(i);
					item = {};
					item["lat"] = xy.lat();
					item["lng"] = xy.lng();
					pathsBeforeEdit.push(item);
				};
			};
            shape.setEditable(true);
			//Show Intraweb "loading animation"
			ShowBusy(true); 
			//Show Inputs
			if(isNew)//New Shape
				executeAjaxEvent("&ID=", null, "editarShape", false, null, false);
			else //Edit Shape Data
				executeAjaxEvent("&ID="+shape.infowindow.name, null, "editarShape", false, null, false);
				
        },
		
		cancelEdition: function(isNew){
			if (isNew){
				selectedShape.setMap(null); //delete shape
				document.getElementById('WKTEDIT').value = '';
			}else{
				selectedShape.setPath(pathsBeforeEdit); //undo shaoe changes
			};
			mapp.clearSelection();
		},
		
		saveEdition: function(jsonFile){
			if (jsonFile){ //is new shape
				//map new shape and destroy the model
				selectedShape.setMap(null); //delete shape
				mapp.drawShapes(jsonFile); //map shape from DB
			}else{ //shape already exists
				mapp.clearSelection();
			};	
		},
		
		showInfo: function (event) {
			//verify if it isn't a selected shape
			if (selectedShape)
			 return;
			opened_info.close();
			if (opened_info.name != this.infowindow.name) {
				this.infowindow.setPosition(event.latLng);
				this.infowindow.open(mapp.gmap);
				opened_info = this.infowindow;
			}
		},
		
		drawShapes: function(jsonFile){
			//map the global variable talhoes
			$(jQuery.parseJSON(JSON.stringify(jsonFile))).each(function() {  
						 mapp.clearSelection;
						 var html =   '<div id="iw-container">' +
										'<div class="iw-title">'+this.Nome+'</div>' +
										'<div class="iw-content">' +
											'<div class="iw-subTitle">Detalhes</div>' +
											'<p><b>Área:</b> '+this.Area+'&nbsp;&nbsp;&nbsp;<b>Irrigado:</b> '+this.Irrigado+'<br>'+
											'<b>Dt. Plantio:</b> '+this.DataPlantio+'<br>'+
											'<b>Idade:</b> '+this.Idade+'</p>'+
											//'<div class"iw-subTitle">Ações</div>' +
												'<button name="edit-overlay" class="btn btn-xs blue edit-overlay" title="Editar"><i class="icon-pencil"></i> Editar</button>&nbsp;&nbsp;'+
												'<button name="edit-overlay" class="btn btn-xs red delete-overlay" title="Editar"><i class="icon-trash"></i> Excluir</button>'+
											//'</div>'+
										'</div>' +
										'<div class="iw-bottom-gradient"></div>' +
									'</div>';
						 mapp.mapIt(this.Poligono, this.id, html);
					});
			
			// Fit bounds to all shapes
			mapp.zoomToFit();
			/*var bounds = new google.maps.LatLngBounds();
			
			if(wkt.type === 'point' || wkt.type === 'multipoint')
				bounds.extend(obj.getPosition());
			else
				obj.getPath().forEach(function(element,index){bounds.extend(element)});

            // Pan the map to the feature
            this.gmap.fitBounds(bounds);*/
					
		
		},
		
		
		zoomToFit: function(){

			var bounds = new google.maps.LatLngBounds();
			var points = new Array();
			for(var counter = 0; counter < this.features.length; counter++)
			{
				//if (this.features[counter] === google.maps.drawing.OverlayType.POLYGON){
					this.features[counter].getPath().forEach(function(element,index){bounds.extend(element)});
				/*}	
				 else if (this.features[counter].type === google.maps.drawing.OverlayType.RECTANGLE  || this.features[counter] === google.maps.drawing.OverlayType.CIRCLE){
					points = new google.maps.LatLng(this.features[counter].getBounds().getNorthEast().lat(), this.features[counter].getBounds().getNorthEast().lng());
					bounds.extend(points);

					points = new google.maps.LatLng(this.features[counter].getBounds().getSouthWest().lat(), this.features[counter].getBounds().getSouthWest().lng());
					bounds.extend(points);
				}else if (this.features[counter].type === google.maps.drawing.OverlayType.MARKER){
					bounds.extend( this.features[counter].getPosition() );
				};*/
			}               
			
			this.gmap.fitBounds(bounds);
		},
		
		
        /**
         * Maps the current contents of the textarea.
         * @return  {Object}    Some sort of geometry object
         */
        mapIt: function (el, id, html) {
            var obj, wkt;

            wkt = new Wkt.Wkt();

            try { // Catch any malformed WKT strings
                wkt.read(el);
            } catch (e1) {
                try {
                    wkt.read(el.replace('\n', '').replace('\r', '').replace('\t', ''));
                } catch (e2) {
                    if (e2.name === 'WKTError') {
                        alert('Wicket could not understand the WKT string you entered. Check that you have parentheses balanced, and try removing tabs and newline characters.');
                        return;
                    }
                }
            }
			
			
			//Create the overlay
			var MapItOptions = {
                strokeWeight: 0,
				fillColor: mapp.getRandomColor(),
                fillOpacity: 0.45,
                editable: false
            };
			//obj = wkt.toObject(this.gmap.drawingManager.get('polygonOptions')); 
			obj = wkt.toObject(MapItOptions);
			
			//Create InfoWindow
			var contentString = $(html);
			
			obj.infowindow = new google.maps.InfoWindow();
			
			obj.infowindow.setContent(contentString[0]);
			
			obj.infowindow.name = id;
			
			var editBtn = contentString.find('button.edit-overlay')[0];
			
			//Add listener to overlay click
			google.maps.event.addListener(obj, 'click', mapp.showInfo);
			
			//add click listner to edit button
			google.maps.event.addDomListener(editBtn, "click", function(event) {
				mapp.setSelection(obj, false);
			});
			

            // Add listeners for overlay editing events
            if (!Wkt.isArray(obj) && wkt.type !== 'point') {
                // New vertex is inserted
                google.maps.event.addListener(obj.getPath(), 'insert_at', function (n) {
                    mapp.updateText(obj);
                });
                // Existing vertex is removed (insertion is undone)
                google.maps.event.addListener(obj.getPath(), 'remove_at', function (n) {
                    mapp.updateText(obj);
                });
                // Existing vertex is moved (set elsewhere)
                google.maps.event.addListener(obj.getPath(), 'set_at', function (n) {
                    mapp.updateText(obj);
                });
            } else {
                if (obj.setEditable) {obj.setEditable(false);}
            }
			
			obj.setMap(this.gmap); // Add it to the map
			
			this.features.push(obj);
			
            return obj;
        
		},//end mapIt
		
        /**
         * Updates the textarea based on the first available feature.
        updateText: function () {
            var wkt = new Wkt.Wkt();
            wkt.fromObject(this.features[0]);
            document.getElementById('WKTEDIT').value = wkt.write();
        },*/
		
		updateText: function(shape) {
            var wkt = new Wkt.Wkt();
            wkt.fromObject(shape);
			$("#WKTEDIT").val(wkt.write()).trigger("change");
        },
		
		
        /**
         * Formats the textarea contents for a URL.
         * @param   checked {Boolean}   The check state of the associated checkbox
         */
        urlify: function (checked) {
            var wkt = new Wkt.Wkt();
            wkt.read(document.getElementById('WKTEDIT').value);
            wkt.delimiter = (checked) ? '+' : ' ';
            document.getElementById('WKTEDIT').value = wkt.write();
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
					
					//Load All shapes from the DB thru the file in $shapes
					mapp.drawShapes($shapes);
                }
            });
			
			var polyOptions = {
                strokeWeight: 0,
				fillColor: '#EEFFCC',
                fillOpacity: 0.45,
                editable: true
            };

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
				markerOptions: {
                    draggable: true
                },
                polylineOptions: {
                    editable: true
                },
                polygonOptions: polyOptions
				

            });
            gmap.drawingManager.setMap(gmap);
			
			// add a listener for the drawing mode change event. Unselect overlay
			google.maps.event.addListener(gmap.drawingManager, "drawingmode_changed", function () {
				if (gmap.drawingManager.getDrawingMode() != null) {
					mapp.clearSelection;
				}
			});
			
			
			//Add a listener for clear selection on Map Click
			google.maps.event.addListener(gmap, 'click', mapp.clearSelection);
			
			//Add a listener for overlay complete
            google.maps.event.addListener(gmap.drawingManager, 'overlaycomplete', function (event) {
                var wkt;

                // Set the drawing mode to "pan" (the hand) so users can immediately edit
                this.setDrawingMode(null);
				
				 // Add an event listener that selects the newly-drawn shape when the user mouses down on it.
				if (event.type != google.maps.drawing.OverlayType.MARKER) {
					// Switch back to non-drawing mode after drawing a shape.
					var newShape = event.overlay;
					newShape.type = event.type;
					
					/*google.maps.event.addListener(newShape, 'click', function () {
						mapp.showInfo;
					   //mapp.setSelection(newShape);
					});*/
					
				}

                // Polygon drawn
                if (event.type === google.maps.drawing.OverlayType.POLYGON || event.type === google.maps.drawing.OverlayType.POLYLINE) {
                    // New vertex is inserted
                    google.maps.event.addListener(event.overlay.getPath(), 'insert_at', function (n) {
                        mapp.updateText(event.overlay);
                    });

                    // Existing vertex is removed (insertion is undone)
                    google.maps.event.addListener(event.overlay.getPath(), 'remove_at', function (n) {
                        mapp.updateText(event.overlay);
                    });

                    // Existing vertex is moved (set elsewhere)
                    google.maps.event.addListener(event.overlay.getPath(), 'set_at', function (n) {
                        mapp.updateText(event.overlay);
                    });
                } else if (event.type === google.maps.drawing.OverlayType.RECTANGLE) { // Rectangle drawn
                    // Listen for the 'bounds_changed' event and update the geometry
                    google.maps.event.addListener(event.overlay, 'bounds_changed', function () {
                        mapp.updateText(event.overlay);
                    });
                }
				
				
				//Set new shape as Selected
                mapp.setSelection(newShape, true);
                //mapp.features.push(event.overlay);
                /*wkt = new Wkt.Wkt();
                wkt.fromObject(event.overlay);
                document.getElementById('WKTEDIT').value = wkt.write();*/
            
			}); //end overlay complete

            return gmap;
        }
    };
}());
