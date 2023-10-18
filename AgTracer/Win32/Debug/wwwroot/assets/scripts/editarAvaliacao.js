var Avaliacao = function () {


    return {
        //main function to initiate the module
        init: function () {
			
				//Polar Chart
					$("#polarChart").highcharts({

				chart: {
					polar: true,
					type: 'line',
					height: 300
					//widht: 300
				},

				title: {
					floating: true,
					text: null
				},

				pane: {
				   //size: '80%'
				},

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
					data: [],
					pointPlacement: 'on'
				}]

			});

			
			//Inicializar Sliders das Notas
			
			//Ocultar Inputs das Notas
			$("input[id^='NOTA']").hide();
			
			//Criar Sliders
			$('.sliderNota').slider({
				min: 6,
				max: 10,
				step: 0.25
			}).slider("pips", {
				rest: "label",
				step: 2
			}).slider("float", {
				pips: false
			});
			
			$('.sliderDry, .sliderBreak').slider({
				min: 0,
				max: 5,
				step: 0.5,
				//orientation: "vertical"
			}).slider("pips", {
				first: "pips",
				last: "pips",
				rest: "pips"
			}).slider("float", {
				handle: false,
				pips: false
			});
			
			$('.sliderXicaras, .sliderDefeitos').slider({
				min: 0,
				max: 5,
				range: "min" //Criar um slider do tipo range com o minimo fixo. 
				//orientation: "vertical"
			}).slider("pips", {
				labels: ['0','\u2615','\u2615','\u2615','\u2615','\u2615'],
				rest: "label"
			}).slider("float", {
				pips: false
			});
			
			$('.sliderIntensidade').slider({
				min: 0,
				max: 5,
				step: 0.5,
				//orientation: "vertical"
			}).slider("pips", {
				first: "label",
				last: "label",
				labels: ['high','','','','','','','','','','low'],
				rest: "pips"
			}).slider("float", {
				handle: false,
				//pips: false
			});
			
			$('.sliderLevel').slider({
				min: 0,
				max: 5,
				step: 0.5,
				//orientation: "vertical"
			}).slider("pips", {
				first: "label",
				last: "label",
				labels: ['heavy','','','','','','','','','','thin'],
				rest: "pips"
			}).slider("float", {
				handle: false,
				pips: false
			});
			
			$('.sliderCor').slider({
				min: 1,
				max: 10
			})
			.slider("pips", {
				first: "label",
				last: "label",
				rest: "label",
				labels: ['25','30','35','40','45','50','55','70','80','N/A'],
			});
				
			
			function updatePontuacao() {
				var pontos = 0;
				$("[peso]").each(function() {
					pontos += $(this).slider("value") * $(this).attr("peso");
				});
				pontos = pontos.toFixed(2);
				pontos = pontos.replace('.', ',');
				$("#PONTUACAOFINAL").val(pontos);
				
				//Atualizar Gráfico
				var data = [$("#slider-NOTAAROMA").slider("value"), $("#slider-NOTASABOR").slider("value"), $("#slider-NOTARETROGOSTO").slider("value"),
						   $("#slider-NOTAACIDEZ").slider("value"), $("#slider-NOTACORPO").slider("value"), $("#slider-NOTABALANCO").slider("value"),
						   $("#slider-NOTAGERAL").slider("value")];
				$('#polarChart').highcharts().series[0].setData (data);		   
			}

			
			//Inicializar Sliders e Buttons com valores das Notas
			$("input[id^='NOTA']").each(function() {
				var nota = $(this).val();
				var peso = $("#slider-"+$(this).attr("id")).attr("peso");
				$("#slider-"+$(this).attr("id")).slider({
					value: nota.replace(/,/g, '.'), //slider só aceita valores com .
					stop: function( event, ui ) {
					//Atualizar notas ao mover slider
						var nomeCampo = $(this).attr("id");
						nomeCampo = nomeCampo.substring(7, 50);
						var valor = $(this).slider("value").toFixed(2); //coloca duas casas decimais
						valor = valor.replace('.', ',');
						$("#"+nomeCampo).val(valor);
					//Atualizar pontuação exibida das Notas
						valor = valor.replace(',', '.');
						valor = parseFloat(valor * peso).toFixed(2); //coloca duas casas decimais
						valor = valor.replace('.', ',');
						$("#btn-"+nomeCampo).html(valor);
					//Atualizar pontuação exibida dos defeitos
						if (Number($(this).attr("peso")) < 0) {
						var defeitos = $("#slider-NOTAXICARASDEFEITOSLEVES").slider("value") * $("#slider-NOTAXICARASDEFEITOSLEVES").attr("peso")+
							$("#slider-NOTAXICARASDEFEITOSGRAVES").slider("value") * $("#slider-NOTAXICARASDEFEITOSGRAVES").attr("peso");
							defeitos = defeitos.toFixed(2);
							defeitos = defeitos.replace('.', ',');
							$("#btn-DEFEITOS").html(defeitos);
						};
					//Atualizar Pontuação Final
						updatePontuacao();
					}
				});
			//Inicializa os Buttons com o valor das notas
				nota = nota.replace(',', '.');
				nota = parseFloat(nota * peso).toFixed(2); //coloca duas casas decimais
				nota = nota.replace('.', ',');
				$("#btn-"+$(this).attr("id")).html(nota);  
			//Inicializa o Button do defeito com seu valor
				var defeitos = $("#slider-NOTAXICARASDEFEITOSLEVES").slider("value") * $("#slider-NOTAXICARASDEFEITOSLEVES").attr("peso")+
				$("#slider-NOTAXICARASDEFEITOSGRAVES").slider("value") * $("#slider-NOTAXICARASDEFEITOSGRAVES").attr("peso");
				defeitos = defeitos.toFixed(2);
				defeitos = defeitos.replace('.', ',');
				$("#btn-DEFEITOS").html(defeitos);
			});
			//Atualizar Pontuação Final
			updatePontuacao();
			
			
			
			
			//Inicializar da Rosa de Sabores
			
			//Zerar o combo de sabores
			$('#saborescombo').val(null);
		
			//var data = [];

			var borderWidth = 4;
		
			$('#rosa').highcharts({

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
					endAngle: 360
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
						borderWidth: borderWidth
					},
				},

				series: [{
					showInLegend: false,
					type: 'column',
					name: 'Predominancia',
					data: data
				}],

				credits: {
				
					enabled: true,
								  text: 'Copyright: McAndrews',
								  href: 'http://www.mcandrews.com.br'
				}
			});

		
			
				var data =[];

			  function updateChart() {
				data = [];
				$(".slider").each(function() {
					item = {};
					item["id"] = $(this).attr("id");
					item["name"] = $(this).attr("name");
					item["y"] = $(this).slider( "value" );
					item["color"] = $(this).css('background-color');
					data.push(item);
				});
				 //alert(JSON.stringify(data));
				//Retornar resultado dos sliders
				$('#HIDDEN_SLIDERRESULTS').val(JSON.stringify(data));
				//Atualizar Gráfico
				$('#rosa').highcharts().series[0].setData (data);
			   };

			   function addSlider(e){
				  //alert(JSON.stringify(e));
				  //alert("selecting val=" + e.val + " choice=" + e.object.text);
				  if($.isArray(e.added))
				    { //Adicionado pelo sistema
					  var div1 = $('<div/>', {id: 'slider_'+e.added[0].id, class: 'form-group',}).appendTo('#predominancia');
					  $('<label/>', {class: 'col-md-3 control-label', text: e.added[0].text}).appendTo(div1);
					  var div2 = $('<div/>', {class: 'col-md-8',}).appendTo(div1); 
					  var slider = $('<div/>', {id: 'slider_'+e.added[0].id, class: 'slider slider-basic flavorColor-'+e.added[0].id, name: e.added[0].text}).appendTo(div2);
					  slider.slider({
						min:0,
						max: 100,
						value: e.added[0].value,
						stop: function( event, ui ) {updateChart();}
					  });
					}
					else //Adicionado Manualmente
					{
					var div1 = $('<div/>', {id: 'slider_'+e.added.id, class: 'form-group',}).appendTo('#predominancia');
					  $('<label/>', {class: 'col-md-3 control-label', text: e.added.text}).appendTo(div1);
					  var div2 = $('<div/>', {class: 'col-md-8',}).appendTo(div1); 
					  var slider = $('<div/>', {id: 'slider_'+e.added.id, class: 'slider slider-basic flavorColor-'+e.added.id, name: e.added.text}).appendTo(div2);
					  slider.slider({
						min:0,
						max: 100,
						stop: function( event, ui ) {updateChart();}
					  });
					};
				  
				 updateChart();
				};

				var names = [{"text":"Gostos","children":[{"id":"12","text":"Adocicado"},{"id":"11","text":"Agridoce"},{"id":"15","text":"Amargo"},{"id":"1","text":"Azedo"},{"id":"14","text":"Meio-Amargo"},{"id":"13","text":"Salgado"},{"id":"10","text":"Tanino"}]},{"text":"Aromas","children":[{"id":"23","text":"Baunilha"},{"id":"21","text":"Caramelo"},{"id":"27","text":"Carbonizado"},{"id":"22","text":"Chocolate"},{"id":"17","text":"Cítrico"},{"id":"26","text":"Defumado"},{"id":"25","text":"Especiarias"},{"id":"16","text":"Floral"},{"id":"18","text":"Frutas Vermelhas"},{"id":"19","text":"Herbal"},{"id":"20","text":"Nozes"},{"id":"24","text":"Resinoso"}]}];
				
			  $("#saborescombo").select2({
					placeholder: "Selecione os Sabores",
					multiple: true,
					data:{ results: names, text: 'text', id: 'id' },
					allowClear: true
				  })
				  .on("change", function(e) { addSlider(e);
					})
				  .on("select2-removed", function(e) {
						 //alert("removed val=" + e.val + " choice=" + e.choice.text);
						 $("#slider_"+e.val).remove();
						 updateChart();
					});
			  
			   //Inicializa os sabores já armazenados no BD
				executeAjaxEvent("", null,"InicializarSliders",false, null, false);
				
				//var obj1={"id":"10","text":"Tanino","value":30};
				//var obj2={"id":"11","text":"Agridoce","value":40};
				//$("#saborescombo").select2("data", $("#saborescombo").select2("data").concat(obj1), true);
				//$("#saborescombo").select2("data", $("#saborescombo").select2("data").concat(obj2), true);
			
   
        }

    };

}();




