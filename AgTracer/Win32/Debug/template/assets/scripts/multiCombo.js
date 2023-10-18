var multiCombo = function () {


    return {
        //main function to initiate the module
        init: function () {
		
			//Exemplo de definição de opções do combo:
			//names = [{"id":"Sacaria","text":"Sacaria"},{"id":"Bigbag","text":"Bigbag"},{"id":"Granel","text":"Granel"}];
			
			$("[id^='MULTICOMBO']").each(function(){
				
				//Desacoplamento da camada de Controle - Itens definidos na propriedade do componente
				var options = $(this).attr("names");
				options = options.replace(/'/g, '"'); 
				options = jQuery.parseJSON(options);
				
				var allowTags = false;
				if ($(this).attr("tags") == "true"){
					allowTags = true;
				};
				
				$(this).select2({
					//placeholder: "Selecione os Sabores",
					multiple: true,
					data:{ results: options, text: 'text', id: 'id'},
					allowClear: true,
					tags: allowTags
				});
				
            });
			
			
        }

    };

}();