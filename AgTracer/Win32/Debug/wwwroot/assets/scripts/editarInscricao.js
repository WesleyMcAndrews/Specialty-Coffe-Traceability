var combo = function () {


    return {
        //main function to initiate the module
        init: function () {
		
			//Exemplo de defini��o de op��es do combo:
			//names = [{"id":"Sacaria","text":"Sacaria"},{"id":"Bigbag","text":"Bigbag"},{"id":"Granel","text":"Granel"}];
			
			$("[id^='COMBO']").each(function(){
				
				//Desacoplamento da camada de Controle - Itens definidos na propriedade do componente
				var options = $(this).attr("names");
				options = options.replace(/'/g, '"'); 
				options = jQuery.parseJSON(options);
				
			
				$(this).select2({
					//placeholder: "Selecione os Sabores",
					multiple: false,
					data:{ results: options, text: 'text', id: 'id'},
					//allowClear: true
				});
				
            });
			
			
        }

    };

}();