var modalconcurso = function () {


    return {
        
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
		
			//popular Combo Jurados
			$("#SELECIONARJURADO").on("click", function(){
				executeAjaxEvent("&id="+$('#HIDDEN_IDTOEDIT').val(), null,"popularComboJurados",false, null, false);
			});
			
			//Habilitar botão ao selecionar Jurado
			$("#COMBOJURADOS").on("change", function(){
				$("#ADICIONARJURADO").toggleClass( "disabled", $(this).val() == null);
			});
			
			
			//Habilitar CHKJURADOOFICIAL se JURADOSELECAO
			$("#CHKJURADOOFICIAL").bootstrapSwitch("disabled", true);
			$("#CHKSELECAO").on('switchChange.bootstrapSwitch', function(event, state) {
				if (!state)
					$("#CHKJURADOOFICIAL").bootstrapSwitch("state", state);
				$("#CHKJURADOOFICIAL").bootstrapSwitch("disabled", !state);
			});
			
			
			//Associar Jurado ao Concurso
			$("#ADICIONARJURADO").on("click", function(){
			
				var preselecao = '0';
				if ($("#CHKPRESELECAO").bootstrapSwitch("state") == true)
					preselecao='1';
					
				var selecao = '0';
				if ($("#CHKSELECAO").bootstrapSwitch("state") == true)
					selecao='1';	
					
			    var oficial = '0';
				if ($("#CHKJURADOOFICIAL").bootstrapSwitch("state") == true)
					oficial='1';
					
				executeAjaxEvent("&id="+$("#HIDDEN_IDTOEDIT").val()+"&idJurado="+$("#COMBOJURADOS").val()+
				"&preselecao="+preselecao+"&selecao="+selecao+"&oficial="+oficial, null, "adicionarJurado", false, null, false);
				//Resetar imputs
				$("[id^='CHK']").bootstrapSwitch("state", false);
				$("#COMBOJURADOS").val(null).trigger("change");
				$("#CHKJURADOOFICIAL").bootstrapSwitch("disabled", true);
				
			});
			
			//Excluir Jurado
			$("#EXCLUIRJURADO").on("click", function(){
			
				var DirectSend = false; // Async, browser call js SetTimeoout
				var Append = true;
				
				if ($("HIDDEN_IDJURADOTOEDIT").val() != '')
					executeAjaxEvent("&id="+$("#HIDDEN_IDTOEDIT").val()+"&idJurado="+$("#HIDDEN_IDJURADOTOEDIT").val(), "EXCLUIRJURADO", "EXCLUIRJURADOIWCL.DoAsyncClick", DirectSend, null, Append);
				else
					alert('Selecione um Jurado para Ecluir.');
 				
			});
			
			//Resetar Senha
			$("#RESETARSENHA").on("click", function(){
			
				var DirectSend = false; // Async, browser call js SetTimeoout
				var Append = true;
				
				if ($("HIDDEN_IDJURADOTOEDIT").val() != '')
					executeAjaxEvent("&id="+$("#HIDDEN_IDTOEDIT").val()+"&idJurado="+$("#HIDDEN_IDJURADOTOEDIT").val(), null, "resetarSenha", false, null, false);
				else
					alert('Selecione um Jurado para alterar a senha.');
 				
			});
			
			// Abrir Categoria para Avaliação
			
						
			//Habilitar botão OK ao selecionar Categoria
			$("#COMBOCATEGORIAS").on("change", function(){
				$("#ABRIRCATEGORIABTN").toggleClass( "disabled", $(this).val() == null);
			});
			
			//Abrir Categoria para Avaliação
			$("#ABRIRCATEGORIABTN").on("click", function(){
			
				executeAjaxEvent("&id="+$("#HIDDEN_IDTOEDIT").val()+"&categoria="+$("#COMBOCATEGORIAS").val(), null, "abrirCategoria", false, null, false);
				$("#FECHARMODALCATEGORIAS").trigger("click");				
				
			});
	
        }

    };

}();