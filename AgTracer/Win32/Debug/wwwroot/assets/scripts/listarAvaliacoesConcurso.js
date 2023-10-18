var listarAvaliacoes = function () {


    return {
        //main function to initiate the module
		
		//Abre o form de avaliação ao clicar no botão
		avalia: function(id, avaliada){
		   var editar="false";
		   if (avaliada == '1')
		    editar='true';
		   executeAjaxEvent("&id="+id+"&editar="+editar, null,"avaliarAmostra",false, null, false);
		},
		
        /*init: function () {
		 //"input:button .btn-xs"
			$(".btn-xs").on("click", function(){
				executeAjaxEvent("&id="+$(this).attr('amostra'), "AVALIARAMOSTRA", "AVALIARAMOSTRAIWCL.DoAsyncClick", false, null, true);
			});
			
			
        }*/

    };

}();