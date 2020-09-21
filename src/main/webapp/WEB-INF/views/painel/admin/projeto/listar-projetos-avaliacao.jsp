<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="pt-br">

<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        Dashboard
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <!-- CSS Files -->
    <link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${path}/assets/css/paper-dashboard.css?v=2.0.0" rel="stylesheet"/>
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="${path}/assets/css/style.css" rel="stylesheet"/>
</head>

<body class="">
<div class="wrapper ">
    <!-- Sidebar -->
    <div class="sidebar" data-color="verde" data-active-color="white">
        <div class="logo">
            <a href="http://www.creative-tim.com" class="simple-text logo-mini">
                <div class="logo-image-small">
                    <i class="far fa-user"></i>
                </div>
            </a>
            <a href="${path}/painel/perfil" class="text-white logo-normal">Bem vindo, ${usuario.nome}.</a>
        </div>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <li>
                    <a href="${path}/painel/dashboard">
                        <i class="nc-icon nc-bank"></i>Painel Principal</a>
                </li>
                <li>
                    <a href="${path}/painel/empresas">
                        <i class="fas fa-city"></i>Empresas</a>
                </li>
                <li>
                    <a href="${path}/painel/entidades">
                        <i class="fas fa-users"></i>Entidades</a>
                </li>
                <li>
                    <a href="${path}/painel/projetos">
                        <i class="fas fa-project-diagram"></i>Projetos</a>
                </li>
                <li>
                    <a href="${path}/painel/incentivos-fiscais">
                        <i class="fas fa-gavel"></i>Incentivos Fiscais</a>
                </li>
                <li class="active">
                    <a href="${path}/painel/pedidos?filtro=TODOS&key=">
                        <i class="fas fa-praying-hands"></i>Pedidos</a>
                </li>
                <li>
                    <a href="${path}/painel/ranking">
                        <i class="far fa-chart-bar"></i>Ranking</a>
                </li>
                <li>
                    <a data-toggle="collapse" href="#graficos"><i class="fas fa-chart-line"></i>Gráficos<b
                            class="caret"></b></a>
                    <div class="collapse" id="graficos">
                        <ul class="nav">
                            <li>
                                <a data-toggle="collapse" href="#graficos-entidade" style="margin-left: 30px;"><i
                                        class="fas fa-users"></i>Entidades <b class="caret"></b></a>
                                <div class="collapse" id="graficos-entidade">
                                    <ul class="nav">
                                        <li>
                                            <a href="${path}/painel/graficos/entidades/linha-do-tempo"
                                               style="margin-left: 50px;"><i class="fas fa-chart-area"></i>Linha do
                                                Tempo</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a data-toggle="collapse" href="#graficos-projetos" style="margin-left: 30px;"><i
                                        class="fas fa-project-diagram"></i>Projetos <b class="caret"></b></a>
                                <div class="collapse" id="graficos-projetos">
                                    <ul class="nav">
                                        <li>
                                            <a href="${path}/painel/graficos/projetos/categoria"
                                               style="margin-left: 50px;"><i class="far fa-chart-bar"></i>Categoria</a>
                                        </li>
                                        <li>
                                            <a href="${path}/painel/graficos/projetos/mapa"
                                               style="margin-left: 50px;"><i class="fas fa-globe-americas"></i>Mapa</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a data-toggle="collapse" href="#graficos-pedidos" style="margin-left: 30px;"><i
                                        class="fas fa-praying-hands"></i>Pedidos <b class="caret"></b></a>
                                <div class="collapse" id="graficos-pedidos">
                                    <ul class="nav">
                                        <li>
                                            <a href="${path}/painel/graficos/pedidos/status" style="margin-left: 50px;"><i
                                                    class="fas fa-chart-pie"></i>Status</a>
                                        </li>
                                        <li>
                                            <a href="${path}/painel/graficos/pedidos/mapa" style="margin-left: 50px;"><i
                                                    class="fas fa-globe-americas"></i>Mapa</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
            <div class="container-fluid">
                <div class="navbar-wrapper">
                    <div class="navbar-toggle">
                        <button type="button" class="navbar-toggler">
                            <span class="navbar-toggler-bar bar1"></span>
                            <span class="navbar-toggler-bar bar2"></span>
                            <span class="navbar-toggler-bar bar3"></span>
                        </button>
                    </div>
                    <b><a class="navbar-brand" href="#">Pedidos</a></b>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation"
                        aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-bar navbar-kebab"></span>
                    <span class="navbar-toggler-bar navbar-kebab"></span>
                    <span class="navbar-toggler-bar navbar-kebab"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navigation">
                    <ul class="navbar-nav">
                        <li class="nav-item btn-rotate dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-power-off"></i>
                                <p>
                                    <span class="d-lg-none d-md-block">Ações</span>
                                </p>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="${path}/painel/perfil">Meus Dados</a>
                                <a class="dropdown-item" href="#" data-toggle="modal"
                                   data-target="#modal-alterar-senha">Alterar Senha</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${path}/sair">Sair</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="content">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header ">
                            <h5 class="card-title">Pedidos(s): ${qtdPedidos}</h5>
                            <div class="d-flex justify-content-start">
                                <div class="row">
                                    <div class="col-12">
                                        <label>Filtrar por: </label>
                                        <form class="form-inline">
                                            <div class="form-group mb-2">
                                                <select class="form-control" name="filtro" id="filtro-admin">
                                                    <c:forEach var="filtroPedido" items="${filtroPedidos}">
                                                        <option value="${filtroPedido}">${filtroPedido.descricao}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group mx-sm-3 mb-2">
                                                <input class="form-control" type="text" name="key" id="key-admin"
                                                       placeholder="palavra-chave"/>
                                            </div>
                                            <div class="form-group mb-2">
                                                <button type="submit" class="btn btn-primary mb-2"><i
                                                        class="fas fa-search"></i></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row mt-2">
                                <div class="col-12">
                                    <!-- MSG DE VAZIO -->
                                    <c:if test="${empty pedidos.content}">
                                        <div class="alert alert-danger mt-3" role="alert">
                                            <p class="text-bold">Não há registro(s) ou não há resultados para esta
                                                palavra-chave.</p>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty pedidos.content}">
                                        <nav class="float-right" aria-label="Paginação de Pedidos">
                                            <ul class="pagination">
                                                <c:choose>
                                                    <c:when test="${pedidos.totalPages == 1}">
                                                        <li class="page-item">
                                                            <button class="page-link text-primary" disabled>Primeira
                                                            </button>
                                                        </li>
                                                        <li class="page-item active"><a class="page-link text-white"
                                                                                        href="${path}/painel/pedidos?page=${pedidos.number}&filtro=${filtro}&key=${key}">${pedidos.number + 1}</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <button class="page-link text-primary" disabled>Última
                                                            </button>
                                                        </li>
                                                    </c:when>
                                                    <c:when test="${(pedidos.totalPages == 2) && (pedidos.number + 1 < pedidos.totalPages)}">
                                                        <li class="page-item">
                                                            <button class="page-link text-primary" disabled>Primeira
                                                            </button>
                                                        </li>
                                                        <li class="page-item active"><a
                                                                class="page-link text-primary text-white"
                                                                href="${path}/painel/pedidos?page=${pedidos.number}&filtro=${filtro}&key=${key}">${pedidos.number + 1}</a>
                                                        </li>
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?page=${pedidos.number + 1}&filtro=${filtro}&key=${key}">${pedidos.number + 2}</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <button class="page-link text-primary" disabled>Última
                                                            </button>
                                                        </li>
                                                    </c:when>
                                                    <c:when test="${(pedidos.totalPages == 2) && (pedidos.number + 1 == pedidos.totalPages)}">
                                                        <li class="page-item">
                                                            <button class="page-link text-primary" disabled>Primeira
                                                            </button>
                                                        </li>
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?page=${pedidos.number - 1}&filtro=${filtro}&key=${key}">${pedidos.number}</a>
                                                        </li>
                                                        <li class="page-item active"><a
                                                                class="page-link text-primary text-white"
                                                                href="${path}/painel/pedidos?page=${pedidos.number}&filtro=${filtro}&key=${key}">${pedidos.number + 1}</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <button class="page-link text-primary" disabled>Última
                                                            </button>
                                                        </li>
                                                    </c:when>
                                                    <c:when test="${(pedidos.totalPages >= 3) && (pedidos.number == 0)}">
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?filtro=${filtro}&key=${key}">Primeira</a>
                                                        </li>
                                                        <li class="page-item active"><a class="page-link text-white"
                                                                                        href="${path}/painel/pedidos?page=${pedidos.number}&filtro=${filtro}&key=${key}">${pedidos.number + 1}</a>
                                                        </li>
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?page=${pedidos.number + 1}&filtro=${filtro}&key=${key}">${pedidos.number + 2}</a>
                                                        </li>
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?page=${pedidos.number + 2}&filtro=${filtro}&key=${key}">${pedidos.number + 3}</a>
                                                        </li>
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?page=${pedidos.totalPages - 1}&filtro=${filtro}&key=${key}">Última</a>
                                                        </li>
                                                    </c:when>
                                                    <c:when test="${(pedidos.totalPages >= 3) && (pedidos.number > 0) && (pedidos.number + 1 < pedidos.totalPages)}">
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?filtro=${filtro}&key=${key}">Primeira</a>
                                                        </li>
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?page=${pedidos.number - 1}&filtro=${filtro}&key=${key}">${pedidos.number}</a>
                                                        </li>
                                                        <li class="page-item active"><a class="page-link text-white"
                                                                                        href="${path}/painel/pedidos?page=${pedidos.number}&filtro=${filtro}&key=${key}">${pedidos.number + 1}</a>
                                                        </li>
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?page=${pedidos.number + 1}&filtro=${filtro}&key=${key}">${pedidos.number + 2}</a>
                                                        </li>
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?page=${pedidos.totalPages - 1}&filtro=${filtro}&key=${key}">Última</a>
                                                        </li>
                                                    </c:when>
                                                    <c:when test="${(pedidos.totalPages >= 3) && (pedidos.number + 1 == pedidos.totalPages)}">
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?filtro=${filtro}&key=${key}">Primeira</a>
                                                        </li>
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?page=${pedidos.number - 2}&filtro=${filtro}&key=${key}">${pedidos.number - 1}</a>
                                                        </li>
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?page=${pedidos.number - 1}&filtro=${filtro}&key=${key}">${pedidos.number}</a>
                                                        </li>
                                                        <li class="page-item active"><a class="page-link text-white"
                                                                                        href="${path}/painel/pedidos?page=${pedidos.number}&filtro=${filtro}&key=${key}">${pedidos.number + 1}</a>
                                                        </li>
                                                        <li class="page-item"><a class="page-link text-primary"
                                                                                 href="${path}/painel/pedidos?page=${pedidos.totalPages - 1}&filtro=${filtro}&key=${key}">Última</a>
                                                        </li>
                                                    </c:when>
                                                </c:choose>
                                            </ul>
                                        </nav>
                                        <div class="table-responsive-sm">
                                            <table class="table border">
                                                <thead class=" text-primary">
                                                <th class="text-center border">Código Pedido</th>
                                                <th class="text-center border">Data Solicitação</th>
                                                <th class="text-center border">Entidade</th>
                                                <th class="text-center border">Loja</th>
                                                <th class="text-center border">Carta Ofício</th>
                                                <th class="text-center border">Status</th>
                                                <th>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="pedido" items="${pedidos.content}">
                                                    <tr>
                                                        <td class="text-center border"># ${pedido.id}</td>
                                                        <fmt:formatDate type="both" dateStyle="short" timeStyle="short"
                                                                        value="${pedido.dataCadastro}"
                                                                        var="dataCadastro"/>
                                                        <td class="text-center border">${dataCadastro}</td>
                                                        <td class="text-center border"
                                                            title="${pedido.entidade.razaoSocial}">${pedido.entidade.nomeFantasia}</td>
                                                        <td class="text-center border"
                                                            title="Cidade: ${pedido.analista.endereco.cidade} / Estado: ${pedido.analista.endereco.estado}"> ${pedido.analista.endereco.bairro}</td>
                                                        <td class="text-center border"><a
                                                                href="${path}/${pedido.documentosPedido.cartaOficio.path}"
                                                                title="Visualizar" target="_blank"><i
                                                                class="far fa-file-alt"></i> Carta Ofício</a></td>
                                                        <td class="text-center border">
                                                            <c:if test="${pedido.status.id == 0}"><span
                                                                    class="bg-warning p-1 text-white">PENDENTE</span></c:if>
                                                            <c:if test="${pedido.status.id == 1}"><span
                                                                    class="bg-danger p-1"><a href="#" class="text-white"
                                                                                             data-toggle="modal"
                                                                                             data-target="#modal-observacao-pedido-recusado-${pedido.id}"
                                                                                             title="Visualizar Motivo">RECUSADO</a></span></c:if>
                                                            <c:if test="${pedido.status.id == 2}"><span
                                                                    class="bg-primary p-1"><a href="#"
                                                                                              class="text-white"
                                                                                              data-toggle="modal"
                                                                                              data-target="#modal-observacao-pedido-aprovado-${pedido.id}"
                                                                                              title="Visualizar Motivo">APROVADO</a></span></c:if>
                                                            <c:if test="${pedido.status.id == 3}"><span
                                                                    class="bg-success p-1"><a href="#"
                                                                                              class="text-white"
                                                                                              data-toggle="modal"
                                                                                              data-target="#modal-observacao-pedidopre-aprovado-admin-${pedido.id}"
                                                                                              title="Visualizar Motivo">PRÉ-APROVADO</a></span></c:if>
                                                        </td>
                                                        <td class="text-center border">
                                                            <a class="btn btn-success btn-sm"
                                                               href="${path}/painel/pedido/${pedido.id}"
                                                               title="Visualizar"><i class="fas fa-sign-in-alt"></i></a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/componentes/footer/painel/footer.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-observacao-pedido-recusado.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-observacao-pedido-aprovado.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-observacao-pedido-pre-aprovado-admin.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-alterar-senha.jsp"/>

<!--   JQUERY   -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<!--   POPPER   -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<!--   BOOTSTRAP   -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script type="text/javascript" src="${path}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var url = location.search.slice(1);
        var partes = url.split('&');
        partes.forEach(function (parte) {
            var chaveValor = parte.split('=');
            var chave = String(chaveValor[0]);
            var valor = chaveValor[1];

            if (chave == 'filtro') {
                if (valor == 'LOJA') {
                    $("#filtro-admin").val('LOJA');
                    $('#key-admin').show();

                } else if (valor == 'CIDADE') {
                    $("#filtro-admin").val('CIDADE');
                    $('#key-admin').show();
                } else if (valor == 'ESTADO') {
                    $("#filtro-admin").val('ESTADO');
                    $('#key-admin').show();
                } else if (valor == 'ENTIDADE') {
                    $("#filtro-admin").val('ENTIDADE');
                    $('#key-admin').show();
                } else {
                    $("#filtro-admin").val('TODOS');
                    $('#key-admin').hide();
                }
            }
        });
    });
</script>

</body>

</html>