var imprimir = function () {


    return {
        //main function to initiate the module
        init: function () {
		
			//popular Combo Jurados
			$("#IMPRIMIRFICHA").on("click", function(){
				if ($('#HIDDEN_IDAMOSTRATOEDIT').val() != null) {
					executeAjaxEvent("&concurso="+$('#HIDDEN_IDTOEDIT').val()+
					"&amostra="+$('#HIDDEN_IDAMOSTRATOEDIT').val(), null,"ImprimirInscricao",false, null, false);
				}else{
					alert('Selecione uma amostra para imprimir');
				}
					
			});
			
        }

    };

}();