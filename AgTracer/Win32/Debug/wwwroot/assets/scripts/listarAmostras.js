var ListarAmostras = function () {
	

    return {
	
		handleFormatInputs: function () {

			//Add class to elements
			$("form").addClass("form-horizontal");
			$("select").addClass("select2me form-control");//select2_category
			$("input").addClass("form-control");
			$("textarea").addClass("form-control");
			
			//Spinner
			//$("[id^='QTDE']").addClass("spinner-input"); //maxlength="3" readonly
			//$("[id^='QTDE']").attr('type', 'number');
			//$("[id^='QTDE']").spinner({min: 0, max: 10});

			
			//Botstrap Switch
			$.fn.bootstrapSwitch.defaults.onText = 'Sim';
			$.fn.bootstrapSwitch.defaults.offText = 'Não';
			$("[id^='CHK']").attr('type', 'checkbox');
			$("[id^='CHK'][value='on']").prop("checked", true); //Exibir ON como checked
			$("[id^='CHK']").addClass("toggle");
			$("[id^='CHK']").bootstrapSwitch();
			
			//Tamanho dos input
			$("[id^='UF']").addClass("input-small");
			$("[id^='QTDE']").addClass("input-small");
			$("[id^='DECIMAL']").addClass("input-small");
			$("[id^='AREA']").addClass("input-small");
			$("[id^='PERC']").addClass("input-small");
			$("[id^='CEP']").addClass("input-small");
			$("[id^='TEMPER']").addClass("input-small");
			$("[id^='SAFRA']").addClass("input-small");
			$("[id^='DATA']").addClass("input-small");
			$("[id^='CAPACIDADE']").addClass("input-small");
			$("[id^='TEMPO']").addClass("input-small");
			$("[id^='SMALL']").addClass("input-small");
			$("[id^='VALOR']").addClass("input-small");
			
			//DatePicker
			$("[id^='DATA']").addClass("date-picker");
			$("[id^='DATA']").prop("format", 'dd/mm/yyyy');
			
			//Combo com Multiplos Valores
			//$("select [id^='MULTICOMBO']").prop("multiple", "multiple");
			//$("select [id^='MULTICOMBO'] option[value='-1']").remove(); //Remover o item '-- Selecione --'
			//$("[id^='MULTICOMBO']").val(["3", "5"]);
			
			//Slider
			/*$("[id^='PERC']").ionRangeSlider({
				min: 0,
				max: 100,
				type: 'single',
				step: 1,
				postfix: " %",
				prettify: false,
				hasGrid: true,
				force_edges: true
			});*/
			
			//Masks
			/*$("[id^='CNPJ']").inputmask("99.999.999/9999-99", {
			//placeholder: "99.999.999/9999-99",
			clearMaskOnLostFocus: true
			});*/
			$("[id^='CPF']").inputmask("999.999.999-99", {
			//placeholder: "999.999.999-99",
			clearMaskOnLostFocus: true
			});
			/*$("[id^='CEP']").inputmask("99999-999", {
			//placeholder: "99999-999",
			clearMaskOnLostFocus: true,
			 "oncomplete": function(){ alert('inputmask complete'); }
			});*/
			$("[id^='CELULAR']").inputmask('(99) 9999[9]-9999', {
			//placeholder: '(99) 9999[9]-9999',
			clearMaskOnLostFocus: true
			});
			$("[id^='FONE']").inputmask('(99) 9999[9]-9999', {
			//placeholder: '(99) 9999[9]-9999',
			clearMaskOnLostFocus: true
			});
			$("[id^='HORA']").inputmask("d/m/y", {
			//placeholder: "dd/mm/yyyy",
			clearMaskOnLostFocus: true
			});
			$("[id^='VALOR']").inputmask('R$ 999.999.999,99', {
			numericInput: true,
			rightAlignNumerics: true,
			greedy: false
			});
			$("[id^='INT']").inputmask({
			"mask": "9",
			"repeat": 15,
			"greedy": false
			});
			$("[id^='QTDE']").inputmask({
			"mask": "9",
			"repeat": 4,
			"greedy": false,
			rightAlignNumerics: true
			});
			$("[id^='CAPACIDADE']").inputmask({
			"mask": "9",
			"repeat": 4,
			"greedy": false
			});
			$("[id^='DECIMAL']").inputmask('decimal', {
			rightAlignNumerics: true
			});
			$("[id^='TEMPER']").inputmask('decimal', {
			rightAlignNumerics: true
			});
			$("[id^='TEMPO']").inputmask("[9]9:99", {
			//placeholder: "99:99h",
			clearMaskOnLostFocus: true
			});	
		
		},
		
		handleDatePickers: function () {

			if (jQuery().datepicker) {
				$('.date-picker').datepicker({
					rtl: App.isRTL(),
					autoclose: true
				});
				$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
			}
		},
		
		handleCombos: function () {
		
			$("[id^='COMBO'].formEvento").each(function(){
				
				//Desacoplamento da camada de Controle - Itens definidos na propriedade do componente
				var options = $(this).attr("names");
				options = options.replace(/'/g, '"'); 
				options = jQuery.parseJSON(options);
				
				$(this).select2({
					data: options
				});
				
            });
		
		},
		
		formatTimeline: function(el, e){
			var div1 = $('<div/>', {class: 'row'}).appendTo(el);
			var div2 = $('<div/>', {class: 'col-md-12'}).appendTo(div1);
			var timeline = $('<ul/>', {id: 'timeline_'+e.id, class: 'timeline'}).appendTo(div2);
			var fasesRestantes = $fasesCultura ; //arquivo gerado na criação do form
			
			//Monta timeline a partir do JSON
			if (e.json.hasOwnProperty('FasesProducao')){
				$.each(e.json.FasesProducao, function() {
					var li0 = $('<li>', {class: 'timeline-'+this.cor})
						.append($('<div>', {class: 'timeline-icon'})
							.append($('<i>', {class: 'icon-time'}))
						);
					//var evento = this;	
					var divb = $('<div>', {class: 'timeline-body'})
							.append($('<h2>', {text: this.nomeFaseProducao})
							.append($('<a>', {class: 'btn '+this.cor, style: 'margin-top: 0px;', id: 'editarEventoLink_'+this.idFaseProducao})
								.click(function () {ListarAmostras.editarEvento(this);})
								.prepend($('<span>', {class: 'glyphicon glyphicon-pencil'})))
							
							
							);
						
					var divc = $('<div>', {class: 'timeline-content'});
					//imagem
					if (this.hasOwnProperty('imagem')){
						 divc.append($('<img>', {class:'timeline-img pull-left', src:'assets/img/fasesProducao/'+this.imagem}));
					};
					
					
					var p1 = $('<p>');
					
					//Verificar se a fase de produção pode ser repetida ou se deve ser excluída
					var FaseAProcurar = this.idFaseProducao; 
					fasesRestantes = jQuery.grep(fasesRestantes, function( n, i ) {
						if (n.idFaseProducao == FaseAProcurar && n.permiteRepeticao == false){
							return false; //Remove fase
						}else{	
							return true; //Mantem fase
						};	
					});

					//Preencher timeline com as informações da fase
					$.each(this.info, function() {
						if (this.nomeInfo == 'DataInicio') { //Data da Fase producao que aparece no timeline
							li0.prepend($('<div>', {class: 'timeline-time'})
							.append($('<span>', {class: 'time', text: this.valor, style:'font-size: 24px;'})));
						};
						p1.append($('<strong>', {text: this.descricao+': '}));
						p1.append(this.valor+this.sufixo);
						p1.append($('<br>'));
					});
					//p1.text().replace(/^<br\s*\/?>|<br\s*\/?>$/g,'');
					//p1.last().remove();//remove last <br>
					
					
					divc.append(p1);
					divb.append(divc);
					li0.append(divb);
					timeline.append(li0);
				}); //fim loop fases
			};
			
			//Botão para adicionar nova fase
			var li0 = $('<li>', {class: 'timeline-green'})
				.append($('<div>', {class: 'timeline-icon'})
						.append($('<i>', {class: 'icon-plus'}))
					)
				.append($('<div>', {class: 'timeline-body'})
						.append($('<a>', {class: 'btn green', style: 'margin-top: 0px;', id: 'novoEventoBtn_'+e.id, text: 'Novo Evento'})
							.click(function () {ListarAmostras.novoEvento(e.id, fasesRestantes);})
							.prepend($('<i>', {class: 'icon-plus'})))
					);
			
			timeline.append(li0);		
					
			  		

			return div1;
					
		},
		
		novoEvento: function(id, e){
			//Preencher combo de eventos
			var data = [];
			var i = 0;
			$.each(e, function() {
				i++;
				var item = {};
					item["id"] = i;
					item["text"] = this.nomeFaseProducao;
				data.push(item);
			});
			//Limpar Combo
			$('#comboEvento').val(null).trigger("change");
			//Opções do Combo
			$('#comboEvento').select2({
			  data: data
			});
			//Remove outros listeners anteriores.
			$("#comboEvento").unbind( "click" );
			//listener do combo de eventos para montagem do formulário
			$('#comboEvento').click(function () {
				//Envia como parametro o Evento Selecionado
				ListarAmostras.montarFormEvento( e[$(this).val() - 1] );
			});
			//Exibir modal
			$("#modalEditarEventoLabel").text = 'Novo Evento';
            $('#modalEditarEvento').modal('show');
		},
		
		editarEvento: function(e){
			//Exibir modal
			$("#modalEditarEventoLabel").text = 'Editar Evento';
            $('#modalEditarEvento').modal('show');
		},
		
		montarFormEvento: function(e){
			//Montar Form para cadastrar o evento
			var form1 = $("#editarEventoForm");
			$.each(e.infoJson, function() {
					
					//criar o controle conforme o tipo
					var formInput = $('<input>', {type: 'text', class: 'form-control formEvento', id: this.nomeInfo.toUpperCase(), name: this.idInfo});
					form1.append($('<div>', {class: 'form-group'})
								.append($('<label>',{for: this.nomeInfo, class: 'col-sm-4 control-label', text: this.descricao + this.sufixo}))
								.append($('<div>',{class: 'col-sm-8'})
										.append(formInput)
								)
					);
					
					//Formatar combo
					if (this.tipoInfo === 'combo') {
						formInput.select2({
						  data: this.opcoesInfo
						});
					};
					

			});
			
			ListarAmostras.handleFormatInputs();
			ListarAmostras.handleDatePickers();
			//ListarAmostras.handleCombos();
		}
		

    };

}();