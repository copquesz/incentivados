<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="pt-br">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Dashboard
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
</head>

<body class="">
  <div class="wrapper ">
    <!-- Sidebar -->
    <div class="sidebar" data-color="black" data-active-color="info">
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
          <li class="active">
            <a href="${path}/painel/incentivos-fiscais">
              <i class="fas fa-gavel"></i>Incentivos Fiscais</a>
          </li>
          <li>
            <a href="${path}/painel/pedidos?filtro=TODOS&key=">
              <i class="fas fa-praying-hands"></i>Pedidos</a>
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
              <b><a class="navbar-brand" href="#">Incentivos Fiscais</a></b>
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
                    <p>
                      <span class="d-lg-none d-md-block">Ações</span>
                    </p>
                  </a>
                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="${path}/painel/perfil">Meus Dados</a>
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
                <h5 class="card-title">Incentivos Fiscais Cadastrado(s): ${qtdIncentivosFiscais}</h5>
                <div class="d-flex justify-content-start"> 
                  <div class="row">
                    <div class="col-md-12">
                      <form class="form-inline">                                          
                        <div class="form-group mx-sm-3 mb-2">
                          <input type="text" class="form-control" placeholder="Pesquisar por..">
                        </div>
                        <div class="form-group mb-2">
                          <button type="submit" class="btn btn-primary mb-2"><i class="fas fa-search"></i></button>
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
                    <c:if test = "${empty incentivosFiscais.content}">
                      <div class="alert alert-info alert-with-icon alert-dismissible fade show" data-notify="container">
                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                          <i class="nc-icon nc-simple-remove"></i>
                        </button>
                        <span data-notify="icon" class="nc-icon nc-zoom-split"></span>
                        <span data-notify="message">Não há nenhum incentivo fiscal cadastrado</span>
                      </div>
                    </c:if>
                    <c:if test = "${not empty incentivosFiscais.content}">  
                      <nav class="float-right" aria-label="Paginação de Empresas">
                        <ul class="pagination"> 
                          <c:choose> 
                            <c:when test = "${incentivosFiscais.totalPages == 1}">
                              <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
                              <li class="page-item active"><a class="page-link text-white" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number}">${incentivosFiscais.number + 1}</a></li>
                              <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
                            </c:when>
                            <c:when test = "${(incentivosFiscais.totalPages == 2) && (incentivosFiscais.number + 1 < incentivosFiscais.totalPages)}">
                              <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
                              <li class="page-item active"><a class="page-link text-primary text-white" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number}">${incentivosFiscais.number + 1}</a></li>
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number + 1}">${incentivosFiscais.number + 2}</a></li>
                              <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
                            </c:when>
                            <c:when test = "${(incentivosFiscais.totalPages == 2) && (incentivosFiscais.number + 1 == incentivosFiscais.totalPages)}">
                              <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number - 1}">${incentivosFiscais.number}</a></li>
                              <li class="page-item active"><a class="page-link text-primary text-white" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number}">${incentivosFiscais.number + 1}</a></li>
                              <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
                            </c:when>
                            <c:when test = "${(incentivosFiscais.totalPages >= 3) && (incentivosFiscais.number == 0)}">
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais">Primeira</a></li>
                              <li class="page-item active"><a class="page-link text-white" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number}">${incentivosFiscais.number + 1}</a></li>
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number + 1}">${incentivosFiscais.number + 2}</a></li>
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number + 2}">${incentivosFiscais.number + 3}</a></li>
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.totalPages - 1}">Última</a></li>
                            </c:when>
                            <c:when test = "${(incentivosFiscais.totalPages >= 3) && (incentivosFiscais.number > 0) && (incentivosFiscais.number + 1 < incentivosFiscais.totalPages)}">
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais">Primeira</a></li>
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number - 1}">${incentivosFiscais.number}</a></li>
                              <li class="page-item active"><a class="page-link text-white" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number}">${incentivosFiscais.number + 1}</a></li>
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number + 1}">${incentivosFiscais.number + 2}</a></li>
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.totalPages - 1}">Última</a></li>
                            </c:when>
                            <c:when test = "${(incentivosFiscais.totalPages >= 3) && (incentivosFiscais.number + 1 == incentivosFiscais.totalPages)}">
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais">Primeira</a></li>
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number - 2}">${incentivosFiscais.number - 1}</a></li>
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number - 1}">${incentivosFiscais.number}</a></li>
                              <li class="page-item active"><a class="page-link text-white" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.number}">${incentivosFiscais.number + 1}</a></li>
                              <li class="page-item"><a class="page-link text-primary" href="${path}/painel/incentivosFiscais?page=${incentivosFiscais.totalPages - 1}">Última</a></li>
                            </c:when>
                          </c:choose> 
                        </ul>
                      </nav>  
                      <div class="table-responsive">
                        <table class="table">
                          <thead class=" text-primary">
                            <th class="border text-center" scope="col">#</th>
                            <th class="border text-center" scope="col">Legislação</th>
                            <th class="border text-center" scope="col">Competência</th>
                            <th class="border text-center" scope="col">Atuação</th>
                          </thead>
                          <tbody>
                            <c:forEach var="incentivoFiscal" items="${incentivosFiscais.content}">
                              <tr>
                                <td class="border text-center" scope="row">${incentivoFiscal.id}</td>
                                <td class="border text-center">${incentivoFiscal.legislacao} <c:if test = "${not empty incentivoFiscal.sigla}"> - ${incentivoFiscal.sigla}</c:if></td>
                                <td class="border text-center">${incentivoFiscal.competencia.descricao}<c:if test = "${not empty incentivoFiscal.localidade}"> - ${incentivoFiscal.localidade}</c:if></td>
                                <td class="border text-center" scope="row">${incentivoFiscal.atuacao.descricao}</td>
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
                <div class="row">
                  <div class="col-md-12">
                    <a href="${path}/painel/incentivos-fiscais/cadastro" class="btn btn-primary mr-5">Cadastrar Incentivos Fiscal</a>
                  </div>
                </div>
              </div>
            </div>
          </div>          
        </div>         
      </div>
      <c:import url="/WEB-INF/views/componentes/footer/painel/footer.jsp" />
    </div>
  </div>
  <!--   JQUERY   -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <!--   POPPER   -->  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <!--   BOOTSTRAP   -->  
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script type="text/javascript" src="${path}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <script type="text/javascript" src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0"></script> 
</body>

</html>