<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html lang="pt-br">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Incentivados - Painel
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${path}/assets/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${path}/assets/css/style.css" rel="stylesheet" />
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
        <a href="http://www.creative-tim.com" class="simple-text logo-mini">
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
          <li>
            <a href="${path}/painel/pedidos?filtro=TODOS&key=">
              <i class="fas fa-praying-hands"></i>Pedidos</a>
          </li>
          <li>
            <a href="${path}/painel/ranking">
              <i class="fas fa-medal"></i>Ranking</a>
          </li>
          <li>
            <a data-toggle="collapse" href="#graficos"><i class="fas fa-chart-line"></i>Gráficos<b class="caret"></b></a>
              <div class="collapse" id="graficos">
                <ul class="nav">
                  <li>
                    <a data-toggle="collapse" href="#graficos-entidade" style="margin-left: 30px;"><i class="fas fa-users"></i>Entidades <b class="caret"></b></a>
                      <div class="collapse" id="graficos-entidade">
                        <ul class="nav">
                          <li>
                            <a href="${path}/painel/graficos/entidades/linha-do-tempo" style="margin-left: 50px;"><i class="fas fa-chart-area"></i>Linha do Tempo</a>
                          </li>
                        </ul>
                      </div>                   
                  </li>
                  <li>
                    <a data-toggle="collapse" href="#graficos-projetos" style="margin-left: 30px;"><i class="fas fa-project-diagram"></i>Projetos <b class="caret"></b></a>
                      <div class="collapse" id="graficos-projetos">
                        <ul class="nav">
                          <li>
                            <a href="${path}/painel/graficos/projetos/categoria" style="margin-left: 50px;"><i class="far fa-chart-bar"></i>Categoria</a>                            
                          </li>
                          <li>
                            <a href="${path}/painel/graficos/projetos/mapa" style="margin-left: 50px;"><i class="fas fa-globe-americas"></i>Mapa</a>
                          </li>
                        </ul>
                      </div>                   
                  </li>
                  <li>
                    <a data-toggle="collapse" href="#graficos-pedidos" style="margin-left: 30px;"><i class="fas fa-praying-hands"></i>Pedidos <b class="caret"></b></a>
                      <div class="collapse" id="graficos-pedidos">
                        <ul class="nav">
                          <li>
                            <a href="${path}/painel/graficos/pedidos/status" style="margin-left: 50px;"><i class="fas fa-chart-pie"></i>Status</a>                            
                          </li>
                          <li>
                            <a href="${path}/painel/graficos/pedidos/mapa" style="margin-left: 50px;"><i class="fas fa-globe-americas"></i>Mapa</a>
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
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-power-off"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Ações</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="${path}/painel/perfil">Meus Dados</a>
                  <a class="dropdown-item" href="${path}/painel/perfil" data-toggle="modal" data-target="#modal-alterar-senha">Alterar Senha</a>
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
          <div class="col-lg-4 col-md-4 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="far fa-address-card text-info"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">Entidades</p>
                      <p class="card-title">
                        <c:if test = "${empty qtdEntidades}">0</c:if>
                        <c:if test = "${not empty qtdEntidades}">${qtdEntidades}</c:if>
                      </p> 
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="fas fa-project-diagram text-info"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">Projetos</p>
                      <p class="card-title">
                        <c:if test = "${empty qtdProjetos}">0</c:if>
                        <c:if test = "${not empty qtdProjetos}">${qtdProjetos}</c:if>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="fas fa-hand-holding-heart text-info"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">Pedidos</p>
                      <p class="card-title">
                        <c:if test = "${empty qtdPedidos}">0</c:if>
                        <c:if test = "${not empty qtdPedidos}">${qtdPedidos}</c:if>
                      </p>
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
                    <li>Entidades aguardando análise da documentação: <strong>${entidadesPendenteAnalise.content.size()}</strong> de <strong>${entidadesPendenteAnalise.totalElements}</strong>.</li>
                    <c:if test="${not empty entidadesPendenteAnalise.content}">
                      <ul style="margin-top: 10px;">
                      <c:forEach var="entidadePendenteAnalise" items="${entidadesPendenteAnalise.content}">
                        <strong><a href="${path}/painel/entidades/${entidadePendenteAnalise.id}/documentos" title="Visualizar" class="text-primary"><li>${entidadePendenteAnalise.nomeFantasia}</li></a></strong>
                      </c:forEach>
                      </ul>
                    </c:if>  
                    <hr>  
                    <li>Projetos aguardando análise da documentação: <strong>${projetosPendenteAnalise.content.size()}</strong> de <strong>${projetosPendenteAnalise.totalElements}</strong>.</li>
                    <c:if test="${not empty projetosPendenteAnalise.content}">
                      <ul style="margin-top: 10px;">
                      <c:forEach var="projetoPendenteAnalise" items="${projetosPendenteAnalise.content}">
                        <strong><a href="${path}/painel/projetos/${projetoPendenteAnalise.id}/documentos" title="Visualizar" class="text-primary"><li>${projetoPendenteAnalise.titulo}</li></a></strong>
                      </c:forEach>
                      </ul>
                    </c:if>                    
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-md-12">
            <div class="card ">
              <div class="card-body">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="entidades-tab" data-toggle="tab" href="#entidades" role="tab" aria-controls="entidades" aria-selected="true">Entidades</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="projetos-tab" data-toggle="tab" href="#projetos" role="tab" aria-controls="projetos" aria-selected="false">Projetos</a>
                  </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active" id="entidades" role="tabpanel" aria-labelledby="entidades-tab"> 
                    <c:if test = "${empty entidades.content}">
                      <div class="alert alert-info" role="alert">
                        <p class="text-bold">Não há entidade(s) cadastrada(s).</p>
                      </div>
                    </c:if>      
                    <c:if test = "${not empty entidades.content}">              
                      <div class="table-responsive">
                        <table class="table">
                          <thead class=" text-info">
                            <th></th>
                            <th>Data Cadastro</th>
                            <th>Nome Fantasia</th>
                            <th>CNPJ</th>
                            <th></th>
                          </thead>
                          <tbody>
                            <c:forEach var="entidade" items="${entidades.content}">
                              <tr>
                                <td class="text-center"><img src="${path}/${entidade.documentosEntidade.logo.path}" style="max-width: 6rem; max-height: 3rem;"></td>
                                <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${entidade.dataCadastro}" var="dataCadastro" />
                                <td>${dataCadastro}</td>
                                <td>${entidade.nomeFantasia}</td>
                                <td>${entidade.cnpj}</td>
                                <td class="text-center">
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
                    <c:if test = "${empty projetos.content}">
                      <div class="alert alert-info mt-3" role="alert">
                        <p class="text-bold">Não há projeto(s) cadastrado(s).</p>
                      </div>
                    </c:if>
                    <c:if test = "${not empty projetos.content}"> 
                      <div class="row justify-content-start">
                        <c:forEach var="projeto" items="${projetos.content}">
                          <div class="col-12 col-xl-3 col-lg-6 col-md-6 d-flex align-items-stretch bd-highlight">
                            <div class="card border align-self-stretch flex-fill bd-highlight mt-3">
                              <img src="${path}/${projeto.documentosProjeto.logo.path}" class="card-img-top img-fluid" alt="..." style="max-height: 200px;">
                              <div class="card-body">
                                <h5 class="card-title" style="font-weight: bold;">
                                  <c:choose> 
                                    <c:when test = "${fn:length(projeto.titulo) > 30}">
                                      ${fn:substring(projeto.titulo, 0, 30)} ...
                                    </c:when>
                                    <c:otherwise>  
                                      ${projeto.titulo}
                                    </c:otherwise>
                                  </c:choose>
                                </h5>
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
      </div>
      <c:import url="/WEB-INF/views/componentes/footer/painel/footer.jsp" />
      <c:import url="/WEB-INF/views/componentes/modal/modal-alterar-senha.jsp" />
    </div>
  </div>  
  <!--   JQUERY   -->
  <script src="${path}/assets/js/core/jquery.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--   POPPER   -->  
  <script src="${path}/assets/js/core/popper.min.js"></script>
  <!--   BOOTSTRAP   -->  
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>  
  <!--   CHART'S   --> 
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>  
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0" type="text/javascript"></script>
  <script type="text/javascript" src="${path}/assets/js/file-validator.js"></script>  
</body>

</html>