var resultados = function () {

	var exportUrl = 'http://export.highcharts.com/';

    return {

	
		//Emite o Relatorio final da Amostra
		rptResultado: function(idAmostra, polarValues){
		   var concurso = $("#HIDDEN_IDTOEDIT").val(); 
		   var polarChart = resultados.gerarPolarChart(polarValues);
		   executeAjaxEvent("&id="+concurso+"&amostra="+idAmostra +"&polarChart="+polarChart, null, "RelatorioFinalAmostra", false, null, false);
		},
		
			

		gerarPolarChart: function (values) {
			var optionsStr = JSON.stringify({

				chart: {
					polar: true,
					type: 'line',
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
					$("#POLARCHARTIMAGE").attr("src",exporturl + xdr.responseText);
					return exporturl + xdr.responseText;
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
						$("#POLARCHARTIMAGE").attr("src", exportUrl + data);
						return exportUrl + data;
					},
					error: function (err) {
						console.log('error', err.statusText)
						//polarChart = null;
					}
				});
			};
			
			
		

		},

        
		encherComboCategorias: function(){
		
			//Desacoplamento da camada de Controle - Itens definidos na propriedade do componente
			var el=$("#COMBOCATEGORIAS");
			var options = el.attr("names");
			options = options.replace(/'/g, '"'); 
			options = jQuery.parseJSON(options);
			
			el.select2("destroy");
			
			el.select2({
				data:{ results: options, text: 'text', id: 'id'},
			});
			
		},
		
		//main function to initiate the module
        init: function () {
		
						
			//Habilitar botão OK ao selecionar Categoria
			$("#COMBOCATEGORIAS").on("change", function(){
			    ShowBusy(true);
				executeAjaxEvent("&id="+$("#HIDDEN_IDTOEDIT").val()+"&categoria="+$("#COMBOCATEGORIAS").val(), null, "ListarResultados", false, null, false);
			});
			
	
        }

    };

}();