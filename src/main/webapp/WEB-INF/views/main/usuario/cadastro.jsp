<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="pt-br">
<head>
    <title>Incentivados - Cadastro de Usuários</title>
    <!--     FONTAWESOME     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <!--     BOOTSTRAP     -->
    <link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <!--     CUSTOM     -->
<%--    <link href="${path}/assets/css/paper-dashboard.css?v=2.0.0" rel="stylesheet"/>--%>
    <link href="${path}/assets/css/style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${path}/main/css/normalize.css">
</head>
<body>
<div class="container">
    <div class="row pt-5">
        <div class="col-12">
            <h1 class="text-primary font-4"><i class="far fa-user-circle fa-2x mr-3"></i> Cadastro de Usuário</h1>
            <hr>
            <div class="row justify-content-start">
                <div class="col-12">
                    <form action="${path}/usuarios/cadastro" method="post" acceptcharset="UTF-8">
                        <fieldset class="mt-3 mt-3">
                            <legend>Tipo Usuário:</legend>
                            <div class="row">
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Tipo:</label>
                                        <select class="form-control" name="tipoUsuario">
                                            <c:forEach var="tipoUsuario" items="${tiposUsuario}">
                                                <option value="${tipoUsuario}">${tipoUsuario.descricao}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset class="mt-3 mt-3">
                            <legend>Informações Gerais:</legend>
                            <div class="row">
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Nome:</label>
                                        <input type="text" class="form-control" name="nome">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Sobrenome:</label>
                                        <input type="text" class="form-control" name="sobrenome" ">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>CPF:</label>
                                        <input type="text" class="form-control" id="cpf" name="cpf"
                                               onchange="if(!validarCPF(this.value)){$('#modal-cpf-invalido').modal('show'); this.value='';}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>E-mail:</label>
                                        <input type="email" class="form-control" name="email">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Senha:</label>
                                        <input type="password" class="form-control" name="senha">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Telefone:</label>
                                        <input type="text" class="form-control" id="telefone" name="telefone">
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset class="mt-3 mt-3">
                            <legend>Endereço:</legend>
                            <div class="row">
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>CEP:</label>
                                        <input type="text" class="form-control" id="cep" name="endereco.cep">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-7">
                                    <div class="form-group">
                                        <label>Logradouro:</label>
                                        <input type="text" class="form-control" id="logradouro"
                                               name="endereco.logradouro">
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group">
                                        <label>Nº:</label>
                                        <input type="text" class="form-control" name="endereco.numero">
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-group">
                                        <label>Complemento:</label>
                                        <input type="text" class="form-control" name="endereco.complemento">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Bairro:</label>
                                        <input type="text" class="form-control" id="bairro" name="endereco.bairro">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Cidade</label>
                                        <input type="text" class="form-control" id="cidade" name="endereco.cidade">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Estado:</label>
                                        <input type="text" class="form-control" id="estado" name="endereco.estado">
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <hr class="bg-primary">
                        <button type="submit" class="btn btn-success float-right">Enviar <i
                                class="far fa-share-square"></i></button>
                        <a href="${path}/login" class="btn btn-info float-right">Login <i
                                class="fas fa-sign-in-alt"></i></a>
                        <a href="${path}/login?redirect=painel/pedidos/Claro/cadastro"
                           class="btn btn-info float-right">Pedidos Claro</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- MODALS -->
<c:import url="/WEB-INF/views/componentes/modal/modal-cpf-invalido.jsp"/>

<!--   JQUERY   -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!--   POPPER   -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--   BOOTSTRAP   -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script type="text/javascript" src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0"></script>
<!-- API'S -->
<script type="text/javascript" src="${path}/api/via-cep.js"></script>
<!-- VALIDATOR -->
<script type="text/javascript" src="${path}/assets/js/cpf-validator.js"></script>
<!-- MASK -->
<script type="text/javascript" src="${path}/assets/js/core/jquery.maskedinput.js"></script>
<script type="text/javascript">
    $("#cpf").mask("999.999.999-99");
    $("#cep").mask("99999-999");
    $('#telefone').focusout(function () {
        var phone, element;
        element = $(this);
        element.unmask();
        phone = element.val().replace(/\D/g, '');
        if (phone.length > 10) {
            element.mask("(99) 99999-999?9");
        } else {
            element.mask("(99) 9999-9999?9");
        }
    }).trigger('focusout');
</script>
</body>


</html>