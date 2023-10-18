var App = function () {

	var exportUrl = 'http://export.highcharts.com/';
	return {

			gerarPolarChart: function(values) {
				var optionsStr = JSON.stringify({

					chart: {
						polar: true,
						type: 'line',
						backgroundColor: 'transparent'
						//height: 300
						//widht: 300
					},

					title: {
						floating: true,
						text: null
					},

					/*pane: {
					   size: '80%'
					},*/

					xAxis: {
						categories: ['Aroma', 'Sabor', 'Retrogosto', 'Acidez', 'Corpo', 'Balanço', 'Geral'],
						tickmarkPlacement: 'on',
						lineWidth: 0
					},

					yAxis: {
						alternateGridColor: '#dddddd',
						lineWidth: 0,
						tickPositions: [6, 7,8,9,10,11],
						showLastLabel: false
					},

					tooltip: {
						//shared: true,
						//pointFormat: '<span style="color:{series.color}">{series.name}: <b>{point.y:,.0f}</b><br/>'
					},
					credits: {
						enabled: false
					},

					legend: {
					   enabled: false
					},

					series: [{
						name: 'Nota',
						data: values,
						pointPlacement: 'on'
					}]

				});
				dataString = encodeURI('async=true&type=png&width=400&options=' + optionsStr);
				if (window.XDomainRequest) {
					var xdr = new XDomainRequest();
					xdr.open("post", exportUrl+ '?' + dataString);
					xdr.onload = function () {
						//console.log(xdr.responseText);
						$("#polarChart").attr("src",exporturl + xdr.responseText);
					};
					xdr.send();
				} else {
					$.ajax({
						type: 'POST',
						data: dataString,
						url: exportUrl,
						success: function (data) {
							//console.log('get the file from relative url: ', data);
							//$('#POLARCHARTIMAGE').html('<img src="' + exportUrl + data + '"/>');
							$("#polarChart").attr("src", exportUrl + data);
						},
						error: function (err) {
							console.log('error', err.statusText)
							//polarChart = null;
						}
					});
				};

			},
			
			gerarRosaChart: function (values) {
				values.sort(function(a, b){
					  var aName = a.name.toLowerCase();
					  var bName = b.name.toLowerCase(); 
					  return ((aName < bName) ? -1 : ((aName > bName) ? 1 : 0));
				});
				var optionsStr = JSON.stringify({
					chart: {
						polar: true,
						backgroundColor: 'transparent',
						plotBorderWidth: null,
						margin: [0, 0, 0, 0],
						spacingTop: 0,
						spacingBottom: 0,
						spacingLeft: 0,
						spacingRight: 0
					},

					title:{
						text:''
					},

					subTitle:{
						text:''
					},

					pane: {
						startAngle: 0,
						endAngle: 360,
						size: '110%'
					},

					legend: {
						enabled: false
					},

					xAxis: {
						tickInterval: 45,
						//min: 0, //Aqui se ajusta se vai completar a volta
						//max: 360,
						lineWidth: 0,
						minorGridLineWidth: 0,
						gridLineColor: 'transparent',
						labels: {
						   enabled: false
						},
					},

					yAxis: {
						min: 0,
						lineWidth: 0,
						minorGridLineWidth: 0,
						gridLineColor: 'transparent',
						labels: {
						   enabled: false
						},
					},

					plotOptions: {
						series: {
							pointStart: 0,
							pointInterval: 45,
							pointPlacement: 'between',
							states: {
								hover: {
									enabled: true
								}
							},
							dataLabels: {
								enabled: true,
								format: '<span class="wheel-label" style="color: {point.color}">{point.name}</span>',
								style: {
									textShadow: false,
									width: 150,
									//fontSize: "12px"
								},
							}
						},
						column: {
							pointPadding: 0,
							groupPadding: 0,
							borderWidth: 4
						},
					},

					series: [{
						showInLegend: false,
						type: 'column',
						name: 'Predominancia',
						data: values
					}],

					credits: {
					
						enabled: true,
						text: 'Copyright: McAndrews',
						href: 'http://www.mcandrews.com.br'
						
					}
				});
				dataString = encodeURI('async=true&type=png&height=600&width=600&options=' + optionsStr);
				if (window.XDomainRequest) {
					var xdr = new XDomainRequest();
					xdr.open("post", exportUrl+ '?' + dataString);
					xdr.onload = function () {
						//console.log(xdr.responseText);
						$("#rosaChart").attr("src",exporturl + xdr.responseText);
					};
					xdr.send();
				} else {
					$.ajax({
						type: 'POST',
						data: dataString,
						url: exportUrl,
						success: function (data) {
							//console.log('get the file from relative url: ', data);
							//$('#POLARCHARTIMAGE').html('<img src="' + exportUrl + data + '"/>');
							$("#rosaChart").attr("src", exportUrl + data);
						},
						error: function (err) {
							console.log('error', err.statusText)
							//polarChart = null;
						}
					});
				};

			}
	

    };

}();