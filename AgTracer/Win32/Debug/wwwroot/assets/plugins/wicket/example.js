        var drawingManager;
        var selectedShape;
        var colors = [getRandomColor(), getRandomColor(), getRandomColor(), getRandomColor(), getRandomColor(), getRandomColor()];
        var selectedColor;
        var colorButtons = {};
        var chekmode = false;

        function clearSelection() {
            if (selectedShape) {
                selectedShape.setEditable(false);
                //selectedShape = null;
            }
        }

        function getRandomColor() {
            var letters = '0123456789ABCDEF'.split('');
            var color = '#';
            for (var i = 0; i < 6; i++) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }

        function setSelection(shape) {
            clearSelection();
            selectedShape = shape;
            shape.setEditable(true);
            selectColor(shape.get('fillColor') || shape.get('strokeColor'));
        }

        function deleteSelectedShape() {
            if (selectedShape) {
                selectedShape.setMap(null);
                document.getElementById('info').innerHTML = "";
            }
        }


        function getCoodinates() {
                                
                if (selectedShape) {
                    var len = selectedShape.getPath().getLength();
                    var htmlStr = "";
                    for (var i = 0; i < len; i++) {
                        htmlStr += selectedShape.getPath().getAt(i).toUrlValue(5) + "\n";
                    }
                    document.getElementById('info').innerHTML = htmlStr;
                }
                else
                    alert("Select A Polygon First.");
        }

        function selectColor(color) {
            selectedColor = color;

            // Retrieves the current options from the drawing manager and replaces the
            // stroke or fill color as appropriate.
            var polylineOptions = drawingManager.get('polylineOptions');
            polylineOptions.strokeColor = color;
            drawingManager.set('polylineOptions', polylineOptions);

            var polygonOptions = drawingManager.get('polygonOptions');
            polygonOptions.fillColor = color;
            drawingManager.set('polygonOptions', polygonOptions);
        }

        function setSelectedShapeColor(color) {
            if (selectedShape) {
                if (selectedShape.type == google.maps.drawing.OverlayType.POLYLINE) {
                    selectedShape.set('strokeColor', color);
                } else {
                    selectedShape.set('fillColor', color);
                }
            }
        }

        function makeColorButton(color) {
            var button = document.createElement('span');
            button.className = 'color-button';
            button.style.backgroundColor = color;
            google.maps.event.addDomListener(button, 'click', function () {
                selectColor(color);
                setSelectedShapeColor(color);
            });

            return button;
        }

        function buildColorPalette() {
            var colorPalette = document.getElementById('color-palette');
            for (var i = 0; i < colors.length; ++i) {
                var currColor = colors[i];
                var colorButton = makeColorButton(currColor);
                colorPalette.appendChild(colorButton);
                colorButtons[currColor] = colorButton;
            }
            selectColor(colors[0]);
        }

        function initialize() {
           
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 11,
                center: new google.maps.LatLng(33.5362475, -111.9267386),
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                disableDefaultUI: false,
                zoomControl: true
            });

            var polyOptions = {
                strokeWeight: 0,
                fillOpacity: 0.45,
                editable: true
            };
            // Creates a drawing manager attached to the map that allows the user to draw
            // markers, lines, and shapes.
            drawingManager = new google.maps.drawing.DrawingManager({
                drawingMode: google.maps.drawing.OverlayType.POLYGON,
                drawingControlOptions: {
                    position: google.maps.ControlPosition.TOP_CENTER,
                    drawingModes: [
                      google.maps.drawing.OverlayType.POLYGON
                    ]
                },
                markerOptions: {
                    draggable: true
                },
                polylineOptions: {
                    editable: true
                },
                polygonOptions: polyOptions,
                map: map
            });


            google.maps.event.addListener(drawingManager, 'overlaycomplete', function (e) {
                      drawingManager.setDrawingMode(null);

                    // Add an event listener that selects the newly-drawn shape when the user
                    // mouses down on it.
              if (e.type != google.maps.drawing.OverlayType.MARKER) {
                    // Switch back to non-drawing mode after drawing a shape.
                    var newShape = e.overlay;
                    newShape.type = e.type;
                    google.maps.event.addListener(newShape, 'click', function () {
                        setSelection(newShape);
                    });
                    setSelection(newShape);
              }
            });
		

            //google.maps.event.addListener(map, 'click', function (e) {
            //    var result;
            //    if (google.maps.geometry.poly.containsLocation(e.latLng, selectedShape)) {
            //        alert("Inside");
            //        result = 'green';
            //    } else {
            //        alert("Outside");
            //        result = 'red';

            //    }

            //    var circle = {
            //        path: google.maps.SymbolPath.CIRCLE,
            //        fillColor: result,
            //        fillOpacity: .2,
            //        strokeColor: 'white',
            //        strokeWeight: .5,
            //        scale: 10
            //    };

            //    new google.maps.Marker({
            //        position: e.latLng,
            //        map: map,
            //        icon: circle
            //    })
            //});
  var triangleCoords = [
    new google.maps.LatLng(33.5362475, -111.9267386),
    new google.maps.LatLng(33.5104882, -111.9627875),
    new google.maps.LatLng(33.5004686, -111.9027061)
  ];
  // Styling & Controls
  myPolygon = new google.maps.Polygon({
    paths: triangleCoords,
    draggable: true, // turn off if it gets annoying
    editable: true,
    strokeColor: '#FF0000',
    strokeOpacity: 0.8,
    strokeWeight: 2,
    fillColor: '#FF0000',
    fillOpacity: 0.35
  });

  myPolygon.setMap(map);
            
            // Clear the current selection when the drawing mode is changed, or when the
            // map is clicked.
            google.maps.event.addListener(drawingManager, 'drawingmode_changed', clearSelection);
            google.maps.event.addListener(map, 'click', clearSelection);

            google.maps.event.addDomListener(document.getElementById('delete-button'), 'click', deleteSelectedShape);
            google.maps.event.addDomListener(document.getElementById('get-coods-button'), 'click', getCoodinates);
            
            buildColorPalette();
        }
        google.maps.event.addDomListener(window, 'load', initialize);