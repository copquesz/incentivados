$(function () {

    $("#cpf").mask("999.999.999-99");
    $("#cnpj").mask("99.999.999/9999-99");
    $("#cep").mask("99999-999");

    $('#telefone').focusout(function(){
        var phone, element;
        element = $(this);
        element.unmask();
        phone = element.val().replace(/\D/g, '');
        if(phone.length > 10) {
            element.mask("(99) 99999-999?9");
        } else {
            element.mask("(99) 9999-9999?9");
        }
    }).trigger('focusout');
    
   competencia.change(function () {
	   
	   	let competencia = $('#competencia');
	   	let campo_localidade = $('#campo-localidade'); 
	    
    	if(competencia.val() == "FEDERAL"){
	    	campo_localidade.hide();
	    }
	    else{
	    	campo_localidade.show();
	    }
    });

});