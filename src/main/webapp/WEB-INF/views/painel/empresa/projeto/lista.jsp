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
    Incentivados - Projetos
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
    <div class="sidebar" data-color="verde" data-active-color="white">
      <div class="logo">
        <a href="#" class="simple-text logo-mini">
          <div class="logo-image-small"><i class="far fa-user"></i></div>
        </a>
        <a href="${path}/painel/perfil" class="text-white logo-normal">Bem vindo, ${usuario.nome}.</a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="${path}/painel/dashboard"><i class="fas fa-desktop"></i>Painel Principal</a>
          </li>
          <li>
            <a href="${path}/painel/${usuario.empresa.id}/analistas"><i class="fas fa-users"></i>Analistas</a>
          </li>
          <li class="active">
            <a href="${path}/painel/projetos"><i class="fas fa-project-diagram"></i>Projetos</a>
          </li>
          <li>
            <a href="${path}/painel/pedidos"><i class="fas fa-praying-hands"></i>Pedidos</a>
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
              <b><a class="navbar-brand" href="#">Projetos</a></b>
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
                <h5 class="card-title">Projetos Cadastrado(s): ${qtdProjetos}</h5>                
                <div class="row">
                  <div class="col-12 d-flex justify-content-start">
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
              <div class="card-body">
                <div class="row">
                  <div class="col-12">
                    <!-- MSG CASO LISTA ESTEJA VAZIA -->
                    <c:if test = "${empty projetos.content}">
                      <div class="alert alert-info alert-with-icon alert-dismissible fade show mt-2" data-notify="container">
                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                          <i class="nc-icon nc-simple-remove"></i>
                        </button>
                        <span data-notify="icon" class="nc-icon nc-zoom-split"></span>
                        <span data-notify="message">Não há nenhum projeto cadastrado</span>
                      </div>
                    </c:if>
                    <!-- EXIBE A LISTA DE PROJETOS -->
                    <c:if test="${not empty projetos.content}">
                      <div class="row">
                        <div class="col-12 d-flex justify-content-end">
                          <nav class="" aria-label="Paginação de Projetos">
                            <ul class="pagination"> 
                              <c:choose> 
                                <c:when test = "${projetos.totalPages == 1}">
                                  <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
                                  <li class="page-item active"><a class="page-link text-white" href="${path}/painel/projetos?page=${projetos.number}">${projetos.number + 1}</a></li>
                                  <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
                                </c:when>
                                <c:when test = "${(projetos.totalPages == 2) && (projetos.number + 1 < projetos.totalPages)}">
                                  <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
                                  <li class="page-item active"><a class="page-link text-primary text-white" href="${path}/painel/projetos?page=${projetos.number}">${projetos.number + 1}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos?page=${projetos.number + 1}">${projetos.number + 2}</a></li>
                                  <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
                                </c:when>
                                <c:when test = "${(projetos.totalPages == 2) && (projetos.number + 1 == projetos.totalPages)}">
                                  <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos?page=${projetos.number - 1}">${projetos.number}</a></li>
                                  <li class="page-item active"><a class="page-link text-primary text-white" href="${path}/painel/projetos?page=${projetos.number}">${projetos.number + 1}</a></li>
                                  <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
                                </c:when>
                                <c:when test = "${(projetos.totalPages >= 3) && (projetos.number == 0)}">
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos">Primeira</a></li>
                                  <li class="page-item active"><a class="page-link text-white" href="${path}/painel/projetos?page=${projetos.number}">${projetos.number + 1}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos?page=${projetos.number + 1}">${projetos.number + 2}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos?page=${projetos.number + 2}">${projetos.number + 3}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos?page=${projetos.totalPages - 1}">Última</a></li>
                                </c:when>
                                <c:when test = "${(projetos.totalPages >= 3) && (projetos.number > 0) && (projetos.number + 1 < projetos.totalPages)}">
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos">Primeira</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos?page=${projetos.number - 1}">${projetos.number}</a></li>
                                  <li class="page-item active"><a class="page-link text-white" href="${path}/painel/projetos?page=${projetos.number}">${projetos.number + 1}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos?page=${projetos.number + 1}">${projetos.number + 2}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos?page=${projetos.totalPages - 1}">Última</a></li>
                                </c:when>
                                <c:when test = "${(projetos.totalPages >= 3) && (projetos.number + 1 == projetos.totalPages)}">
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos">Primeira</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos?page=${projetos.number - 2}">${projetos.number - 1}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos?page=${projetos.number - 1}">${projetos.number}</a></li>
                                  <li class="page-item active"><a class="page-link text-white" href="${path}/painel/projetos?page=${projetos.number}">${projetos.number + 1}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/projetos?page=${projetos.totalPages - 1}">Última</a></li>
                                </c:when>
                              </c:choose> 
                            </ul>
                          </nav>  
                        </div>
                      </div>
                      <hr>
                      <div class="row justify-content-start">                        
                        <c:forEach var="projeto" items="${projetos.content}">
                          <div class="col-12 col-xl-3 col-lg-6 col-md-6 d-flex align-items-stretch bd-highlight">
                            <div class="card border align-self-stretch flex-fill bd-highlight mt-3">
                              <img src="${path}/${projeto.documentosProjeto.logo.path}" class="card-img-top img-fluid" alt="...">
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
              <div class="card-footer"></div>
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