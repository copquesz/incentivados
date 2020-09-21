$(document).ready(function () {

    function limpa_formulário_cep() {
        // Limpa valores do formulário de cep.
        $("#cep").val("");
        $("#logradouro").val("");
        $("#bairro").val("");
        $("#cidade").val("");
        $("#estado").val("");
    }

    //Quando o campo cep perde o foco.
    $("#cep").blur(function () {

        //Nova variável "cep" somente com dígitos.
        var cep = $(this).val().replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if (validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                $("#logradouro").val("...");
                $("#bairro").val("...");
                $("#cidade").val("...");
                $("#estado").val("...");

                //Consulta o webservice viacep.com.br/
                $.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                    if (!("erro" in dados)) {
                        //Atualiza os campos com os valores da consulta.
                        $("#logradouro").val(dados.logradouro);
                        $("#bairro").val(dados.bairro);
                        $("#cidade").val(dados.localidade);
                        switch (dados.uf) {
                            case 'AC':
                                $("#estado").val('Acre');
                            case 'AL':
                                $("#estado").val('Alagoas');
                            case 'AP':
                                $("#estado").val('Amapá');
                                break;
                            case 'AM':
                                $("#estado").val('Amazonas');
                                break;
                            case 'BA':
                                $("#estado").val('Bahia');
                                break;
                            case 'CE':
                                $("#estado").val('Ceará');
                                break;
                            case 'DF':
                                $("#estado").val('Distrito Federal');
                                break;
                            case 'ES':
                                $("#estado").val('Espírito Santo');
                                break;
                            case 'GO':
                                $("#estado").val('Goiás');
                                break;
                            case 'MA':
                                $("#estado").val('Maranhão');
                                break;
                            case 'MT':
                                $("#estado").val('Mato Grosso');
                                break;
                            case 'MS':
                                $("#estado").val('Mato Grosso do Sul');
                                break;
                            case 'MG':
                                $("#estado").val('Minas Gerais');
                                break;
                            case 'PA':
                                $("#estado").val('Pará');
                                break;
                            case 'PB':
                                $("#estado").val('Paraíba');
                                break;
                            case 'PR':
                                $("#estado").val('Paraná');
                                break;
                            case 'PE':
                                $("#estado").val('Pernambuco');
                                break;
                            case 'PI':
                                $("#estado").val('Piauí');
                                break;
                            case 'RJ':
                                $("#estado").val('Rio de Janeiro');
                                break;
                            case 'RN':
                                $("#estado").val('Rio Grande do Norte');
                                break;
                            case 'RS':
                                $("#estado").val('Rio Grande do Sul');
                                break;
                            case 'RO':
                                $("#estado").val('Rondônia');
                                break;
                            case 'RR':
                                $("#estado").val('Roraima');
                                break;
                            case 'SC':
                                $("#estado").val('Santa Catarina');
                                break;
                            case 'SP':
                                $("#estado").val('São Paulo');
                                break;
                            case 'SE':
                                $("#estado").val('Sergipe');
                                break;
                            case 'TO':
                                $("#estado").val('Tocantins');
                                break;
                            default:
                                'Não Informado'
                        }
                    } //end if.
                    else {
                        //CEP pesquisado não foi encontrado.
                        limpa_formulário_cep();
                        $('#modal-cep-nao-encontrado').modal('show');
                    }
                });
            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();
                $('#modal-cep-invalido').modal('show');
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
        }
    });
});