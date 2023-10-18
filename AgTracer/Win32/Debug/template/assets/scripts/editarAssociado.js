var editarAssociado = function () {


    return {
        //main function to initiate the module
        init: function () {
			
			//Busca CEP Associado
			$('#CEPASSOCIADO').inputmask("99999-999", {
            //placeholder: "99999-999",
            clearMaskOnLostFocus: true,
			 "oncomplete": function(){ 
			 
					cep = $(this).val();
					cep = cep.replace(/-/g, '');
					$.getJSON( "http://viacep.com.br/ws/"+cep+"/json/", function( data ) {
						$('#ENDERECOASSOCIADO').val(data.logradouro);
						$('#BAIRROASSOCIADO').val(data.bairro);
						$('#UFASSOCIADO').val(data.uf);
						$('#MUNICASSOCIADO').val(data.localidade);
						$('#CODIGOMUNICASSOCIADO').val(data.ibge);
					})
					.always(function(data) {
						if (data.erro == true)
						{
						alert('Digite um CEP válido');
						}else{
						//alert('CEP consutado com sucesso');
						}
					});
				}
			});
			
			
			
			
			//Busca CEP Responsável
			$('#CEPRESPONSAVEL').inputmask("99999-999", {
            //placeholder: "99999-999",
            clearMaskOnLostFocus: true,
			 "oncomplete": function(){ 
			 
					cep = $(this).val();
					cep = cep.replace(/-/g, '');
					$.getJSON( "http://viacep.com.br/ws/"+cep+"/json/", function( data ) {
						$('#ENDERECORESPONSAVEL').val(data.logradouro);
						$('#BAIRRORESPONSAVEL').val(data.bairro);
						$('#UFRESPONSAVEL').val(data.uf);
						$('#MUNICRESPONSAVEL').val(data.localidade);
						$('#CODIGOMUNICRESPONSAVEL').val(data.ibge);
					})
					.always(function(data) {
						if (data.erro == true)
						{
						alert('Digite um CEP válido');
						}else{
						//alert('CEP consutado com sucesso');
						}
					});
				}
			});
			
			
        }

    };

}();