var multiCombo = function () {


    return {
        //main function to initiate the module
        init: function () {
		
			//Exemplo de definição de opções do combo:
			//names = [{"id":"Sacaria","text":"Sacaria"},{"id":"Bigbag","text":"Bigbag"},{"id":"Granel","text":"Granel"}];
			
			//Remover o item '-- Selecione --'
			$("select [id^='MULTICOMBO'] option[value='-1']").remove(); 
			
			//Desacoplamento da camada de Controle - Itens definidos na propriedade do componente
			var options = $("[id^='MULTICOMBO']").attr("names");
			options = options.replace(/'/g, '"'); 
			options = jQuery.parseJSON(options);
			 
			var allowTags = false;
			if ($("[id^='MULTICOMBO']").attr("tags") == "true")
				allowTags = true;
		
			$("[id^='MULTICOMBO']").select2({
					//placeholder: "Selecione os Sabores",
					multiple: true,
					data:{ results: options, text: 'text', id: 'id'},
					allowClear: true,
					tags: allowTags
				  });
        }

    };

}();