<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html lang="pt-br">

<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        Incentivados - Painel
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <!-- CSS Files -->
    <link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${path}/assets/css/paper-dashboard.css" rel="stylesheet"/>
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="${path}/assets/css/style.css" rel="stylesheet"/>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-173176674-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'UA-173176674-1');
    </script>
</head>

<body class="">
<div class="wrapper ">
    <!-- Sidebar -->    
    <div class="sidebar" data-color="verde" data-active-color="white">
      <div class="logo">
        <a href="#" class="simple-text logo-mini">
          <div class="logo-image-small">
            <i class="far fa-user"></i>
          </div>
        </a>
        <a href="${path}/painel/perfil" class="text-white logo-normal">Bem vindo, ${usuario.nome}.</a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active">
            <a href="${path}/painel/dashboard">
              <i class="fas fa-desktop"></i>Painel Principal
            </a>
          </li>
          <li>
            <a href="${path}/painel/entidades">
              <i class="fas fa-users"></i>Entidades
            </a>
          </li>
          <li>
            <a href="${path}/painel/projetos">
              <i class="fas fa-project-diagram"></i>Projetos
            </a>
          </li>
          <li>
            <a href="${path}/documentos/manual-do-usuario.pdf" target="_blank">
              <i class="far fa-question-circle"></i>Tutorial
            </a>
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
                  <b><a class="navbar-brand" href="#">Painel Principal</a></b>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-bar navbar-kebab"></span>
                    <span class="navbar-toggler-bar navbar-kebab"></span>
                    <span class="navbar-toggler-bar navbar-kebab"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navigation">
                  <ul class="navbar-nav">
                    <li class="nav-item btn-rotate dropdown">
                      <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-power-off"></i>
                        <p><span class="d-lg-none d-md-block">Ações</span></p>
                      </a>
                      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="${path}/painel/perfil">Meus Dados</a>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-alterar-senha">Alterar Senha</a>
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
                <div class="col-md-4">
                    <div class="card card-stats">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="icon-big text-center icon-warning">
                                        <i class="far fa-address-card text-info"></i>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="numbers">
                                        <p class="card-category">Entidades</p>
                                        <p class="card-title">${qtdEntidades}<p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer ">
                            <hr>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-stats">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="icon-big text-center icon-warning">
                                        <i class="fas fa-project-diagram text-info"></i>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="numbers">
                                        <p class="card-category">Projetos</p>
                                        <p class="card-title">${qtdProjetos}<p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer ">
                            <hr>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-stats">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="icon-big text-center icon-warning">
                                        <i class="fas fa-hand-holding-heart text-info"></i>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="numbers">
                                        <p class="card-category">Pedidos</p>
                                        <p class="card-title">${qtdPedidos}<p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer ">
                            <hr>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h5 class="card-title"> Análises</h5>
                    <div class="card-body">
                      <ul>                        
                        <li>Entidades com documentação irregular: <strong>${entidadesNegadoAnalise.totalElements}</strong></li>
                        <c:if test="${not empty entidadesNegadoAnalise.content}">
                          <ul style="margin-top: 10px;">
                              <c:forEach var="entidadeNegadoAnalise" items="${entidadesNegadoAnalise.content}">
                                <strong><a href="${path}/painel/entidades/${entidadeNegadoAnalise.id}" title="Visualizar" class="text-primary"><li>${entidadeNegadoAnalise.nomeFantasia}</li></a></strong>
                              </c:forEach>
                          </ul>
                        </c:if>   
                        </li>
                        <hr>                        
                        <li>Projetos com documentação irregular: <strong>${projetosNegadoAnalise.totalElements}</strong></li>
                        <c:if test="${not empty projetosNegadoAnalise.content}">
                          <ul style="margin-top: 10px;">
                              <c:forEach var="projetoNegadoAnalise" items="${projetosNegadoAnalise.content}">
                                <strong><a href="${path}/painel/projetos/${projetoNegadoAnalise.id}" title="Visualizar" class="text-primary"><li>${projetoNegadoAnalise.titulo}</li></a></strong>
                              </c:forEach>
                          </ul>
                        </c:if>   
                        <hr>                         
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>


            <div class="row">
                <div class="col-md-12">
                    <div class="card ">
                        <div class="card-header ">
                            <div class="row">
                                <div class="col-12">
                                    <h5 class="card-title">Meus Cadastros</h5>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <c:if test="${cadastroProjeto}">
                                        <a href="${path}/painel/projetos/cadastro" class="btn btn-primary float-right"><i class="fas fa-plus mr-2"></i> Cadastrar Projeto</a>
                                    </c:if>
                                    <a href="${path}/painel/entidades/cadastro" class="btn btn-primary float-right"><i class="fas fa-plus mr-2"></i> Cadastrar Entidade</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body ">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="entidades-tab" data-toggle="tab" href="#entidades" role="tab" aria-controls="entidades" aria-selected="true">Entidades</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " id="projetos-tab" data-toggle="tab" href="#projetos" role="tab" aria-controls="projetos" aria-selected="false">Projetos</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="entidades" role="tabpanel"
                                     aria-labelledby="entidades-tab">
                                    <c:if test="${empty entidades.content}">
                                        <div class="alert alert-danger alert-with-icon alert-dismissible fade show mt-2" data-notify="container">
                                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                <i class="nc-icon nc-simple-remove"></i>
                                            </button>
                                            <span data-notify="icon" class="nc-icon nc-zoom-split"></span>
                                            <span data-notify="message">Não há entidade(s) cadastrada(s).</span>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty entidades.content}">
                                        <div class="table-responsive-sm">
                                            <table class="table">
                                                <thead class=" text-primary">
                                                <th class="border-left border-right"></th>
                                                <th class="text-center border-left border-right">Data Cadastro</th>
                                                <th class="text-center border-left border-right">Nome Fantasia</th>
                                                <th class="text-center border-left border-right">CNPJ</th>
                                                <th class="text-center border-left border-right">Ações</th>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="entidade" items="${entidades.content}">
                                                        <tr>
                                                            <td class="text-center border"><img class="" src="${path}/${entidade.documentosEntidade.logo.path}" style="max-width: 6rem; max-height: 3rem;">
                                                            </td>
                                                            <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${entidade.dataCadastro}" var="dataCadastro"/>
                                                            <td class="text-center border">${dataCadastro}</td>
                                                            <td class="text-center border">${entidade.nomeFantasia}</td>
                                                            <td class="text-center border">${entidade.cnpj}</td>
                                                            <td class="text-center border">
                                                                <a href="${path}/painel/entidades/${entidade.id}" class="btn btn-primary btn-circle" title="Visualizar"><i class="fas fa-file-alt"></i></a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="tab-pane fade" id="projetos" role="tabpanel" aria-labelledby="projetos-tab">
                                    <c:if test="${empty projetos.content}">
                                        <div class="alert alert-danger alert-with-icon alert-dismissible fade show mt-2" data-notify="container">
                                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                <i class="nc-icon nc-simple-remove"></i>
                                            </button>
                                            <span data-notify="icon" class="nc-icon nc-zoom-split"></span>
                                            <span data-notify="message">Não há projeto(s) cadastrado(s).</span>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty projetos.content}">
                                        <div class="row justify-content-start">
                                            <c:forEach var="projeto" items="${projetos.content}">
                                              <div class="col-12 col-xl-3 col-lg-6 col-md-6 d-flex align-items-stretch bd-highlight">
                                                <div class="card border align-self-stretch flex-fill bd-highlight mt-3">
                                                  <img src="${path}/${projeto.documentosProjeto.logo.path}" class="img-fluid img-thumbnail" alt="..." style="height: 200px;">
                                                  <div class="card-body">
                                                    <h5 class="card-title" style="font-weight: bold;">${projeto.titulo}</h5>
                                                    <hr>
                                                    <p class="card-text text-justify">${fn:substring(projeto.objetivo, 0, 180)} ...</p>
                                                  </div>
                                                  <div class="card-footer">
                                                    <a href="${path}/painel/projetos/${projeto.id}" class="btn btn-primary">Ver Detalhes</a>
                                                  </div>
                                                </div>
                                              </div>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card ">
                        <div class="card-header ">
                            <h5 class="card-title">Minhas Solicitações</h5>
                            <div class="row">
                                <div class="col-12">                                    
                                    <a href="${path}/painel/pedidos/cadastro?empresaCnpj=01.438.784/0001-05" class="btn btn-primary float-right"><i class="fas fa-plus mr-2"></i> Cadastrar Pedido</a>
                                </div>
                            </div>
                            <c:if test="${empty pedidos.content}">
                                <div class="alert alert-danger alert-with-icon alert-dismissible fade show mt-2" data-notify="container">
                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                        <i class="nc-icon nc-simple-remove"></i>
                                    </button>
                                    <span data-notify="icon" class="nc-icon nc-zoom-split"></span>
                                    <span data-notify="message">Não há pedido(s) cadastrado(s).</span>
                                </div>
                            </c:if>
                            <c:if test="${not empty pedidos.content}">
                                <div class="table-responsive-sm">
                                    <table class="table">
                                        <thead class=" text-primary">
                                        <th class="text-center border">Código Pedido</th>
                                        <th class="text-center border">Data Solicitação</th>
                                        <th class="text-center border">Entidade</th>
                                        <th class="text-center border">Empresa</th>
                                        <th class="text-center border">Loja</th>
                                        <th class="text-center border">Tipo de Solicitação</th>
                                        <th class="text-center border">Status</th>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="pedido" items="${pedidos.content}">
                                            <tr>
                                                <td class="text-center border">${pedido.id}</td>
                                                <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${pedido.dataCadastro}" var="dataCadastro"/>
                                                <td class="text-center border">${dataCadastro}</td>
                                                <td class="text-center border">${pedido.entidade.nomeFantasia}</td>
                                                <td class="text-center border">${pedido.empresa.nomeFantasia}</td>
                                                <td class="text-center border" title="Cidade: ${pedido.analista.endereco.cidade} / Estado: ${pedido.analista.endereco.estado}"> ${pedido.analista.endereco.bairro}</td>
                                                <td class="text-center border">${pedido.tipoPedido.descricao}</td>
                                                <th class="text-center border">
                                                    <c:if test="${pedido.status.id == 0}">
                                                        <span class="bg-warning p-1 text-white">PENDENTE</span>
                                                    </c:if>
                                                    <c:if test="${pedido.status.id == 1}">
                                                        <span class="bg-danger p-1"><a class="text-white" href="#" data-toggle="modal" data-target="#modal-observacao-pedido-${pedido.id}" title="Visualizar">REPROVADO</a></span>
                                                    </c:if>
                                                    <c:if test="${pedido.status.id == 2}">
                                                        <span class="bg-success p-1"><a class="text-white" href="#" data-toggle="modal" data-target="#modal-observacao-pedido-${pedido.id}" title="Visualizar">APROVADO</a></span>
                                                    </c:if>
                                                    <c:if test="${pedido.status.id == 3}">
                                                        <span class="bg-success p-1"><a class="text-white" href="#" data-toggle="modal" data-target="#modal-observacao-pedidopre-aprovado-usuario-${pedido.id}" title="Visualizar">PRÉ-APROVADO</a></span>
                                                    </c:if>
                                                </th>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="/WEB-INF/views/componentes/footer/painel/footer.jsp" />        
    </div>
</div>

<!-- MODALS -->
<c:import url="/WEB-INF/views/componentes/modal/modal-alterar-senha.jsp" />
<c:import url="/WEB-INF/views/componentes/modal/modal-observacao-pedido.jsp" />
<c:import url="/WEB-INF/views/componentes/modal/modal-observacao-pedido-pre-aprovado-usuario.jsp" />
<c:import url="/WEB-INF/views/componentes/modal/modal-welcome.jsp" />

<!--   JQUERY   -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<!--   POPPER   -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--   BOOTSTRAP   -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script type="text/javascript" src="${path}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0"></script>
</body>

<c:if test="${!usuario.ativo}">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#modal-welcome').modal('show');
        });
    </script>
</c:if>

</html>