var resultados = function () {


    return {

	
		//Emite o Relatorio final da Amostra
		rptResultado: function(codAmostra){
		   var concurso = $("#HIDDEN_IDTOEDIT").val(); 
		   executeAjaxEvent("&id="+concurso+"&idamostra="+codAmostra, null, "RelatorioFinalAmostra", false, null, false);
		},
		
			

		

        
		encherComboCategorias: function(){
		
			//Desacoplamento da camada de Controle - Itens definidos na propriedade do componente
			var el=$("#COMBOCATEGORIAS");
			var options = el.attr("names");
			options = options.replace(/'/g, '"'); 
			options = jQuery.parseJSON(options);
			
			el.select2("destroy");
			el.val(null);
			
			el.select2({
				data:{ results: options, text: 'text', id: 'id'},
			});
			
		},
		
		//main function to initiate the module
        init: function () {
		
						
			//Habilitar botão OK ao selecionar Categoria
			$("#COMBOCATEGORIAS").on("change", function(){
				executeAjaxEvent("&id="+$("#HIDDEN_IDTOEDIT").val()+"&categoria="+$("#COMBOCATEGORIAS").val(), null, "ListarResultados", false, null, false);
			});
			
			//Imprimir Listagem Pré-Seleção
			$("#IMPRIMIRPRESELECAO").on("click", function(){
				executeAjaxEvent("&id="+$("#HIDDEN_IDTOEDIT").val()+"&categoria="+$("#COMBOCATEGORIAS").val()+"&fase=1", null, "ListagemAmostras", false, null, false);
			});
			
			//Imprimir Listagem Seleção
			$("#IMPRIMIRSELECAO").on("click", function(){
				executeAjaxEvent("&id="+$("#HIDDEN_IDTOEDIT").val()+"&categoria="+$("#COMBOCATEGORIAS").val()+"&fase=2", null, "ListagemAmostras", false, null, false);
			});
			
	
        }

    };

}();