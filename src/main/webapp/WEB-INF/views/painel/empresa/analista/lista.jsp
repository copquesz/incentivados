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
    Incentivados - ${usuario.empresa.nomeFantasia} - Analistas
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
          <li class="active">
            <a href="${path}/painel/${usuario.empresa.id}/analistas"><i class="fas fa-users"></i>Analistas</a>
          </li>
          <li>
            <a href="${path}/painel/projetos"><i class="fas fa-project-diagram"></i>Projetos</a>
          </li>
          <li>
            <a href="${path}/painel/pedidos?filtro=TODOS&key="><i class="fas fa-praying-hands"></i>Pedidos</a>
          </li>
          <li>
            <a href="${path}/painel/ranking"><i class="far fa-chart-bar"></i>Ranking</a>
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
            <b><a class="navbar-brand" href="#">${usuario.empresa.nomeFantasia} <i class='fas fa-angle-double-right'></i> Analistas</b>
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
                <h5 class="card-title">Analistas Cadastrado(s): ${analistas.totalElements}</h5>
                <div class="d-flex justify-content-start">
                  <div class="row">
                    <div class="col-12">                      
                      <form class="form-inline">
                        <div class="form-group mx-sm-3 mb-2">
                          <input class="form-control" type="text" name="key" id="key" placeholder="Pesquisar por Nome ou Sobrenome ..." />
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
                    <c:if test = "${empty analistas.content}">                      
                      <div class="alert alert-danger alert-with-icon alert-dismissible fade show" data-notify="container">
                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                          <i class="nc-icon nc-simple-remove"></i>
                        </button>
                        <span data-notify="icon" class="nc-icon nc-zoom-split"></span>
                        <span data-notify="message">Não há analista(s) cadastrado(s) ou resultado(s) para a pesquisa.</span>
                      </div>                      
                    </c:if>                 
                    <c:if test = "${not empty analistas.content}">  
                      <div class="row">
                        <div class="col-12 d-flex justify-content-end">
                          <nav class="" aria-label="Paginação de Projetos">
                            <ul class="pagination"> 
                              <c:choose> 
                                <c:when test = "${analistas.totalPages == 1}">
                                  <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
                                  <li class="page-item active"><a class="page-link text-white" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number}&key=">${analistas.number + 1}</a></li>
                                  <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
                                </c:when>
                                <c:when test = "${(analistas.totalPages == 2) && (analistas.number + 1 < analistas.totalPages)}">
                                  <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
                                  <li class="page-item active"><a class="page-link text-primary text-white" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number}&key=">${analistas.number + 1}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number + 1}&key=">${analistas.number + 2}</a></li>
                                  <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
                                </c:when>
                                <c:when test = "${(analistas.totalPages == 2) && (analistas.number + 1 == analistas.totalPages)}">
                                  <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number - 1}&key=">${analistas.number}</a></li>
                                  <li class="page-item active"><a class="page-link text-primary text-white" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number}&key=">${analistas.number + 1}</a></li>
                                  <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
                                </c:when>
                                <c:when test = "${(analistas.totalPages >= 3) && (analistas.number == 0)}">
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/${empresa.id}/analistas?key=">Primeira</a></li>
                                  <li class="page-item active"><a class="page-link text-white" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number}&key=">${analistas.number + 1}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number + 1}&key=">${analistas.number + 2}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number + 2}&key=">${analistas.number + 3}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/${empresa.id}/analistas?page=${analistas.totalPages - 1}&key=">Última</a></li>
                                </c:when>
                                <c:when test = "${(analistas.totalPages >= 3) && (analistas.number > 0) && (analistas.number + 1 < analistas.totalPages)}">
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/${empresa.id}/analistas?key=">Primeira</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number - 1}&key=">${analistas.number}</a></li>
                                  <li class="page-item active"><a class="page-link text-white" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number}&key=">${analistas.number + 1}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number + 1}&key=">${analistas.number + 2}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/analistas?page=${analistas.totalPages - 1}&key=">Última</a></li>
                                </c:when>
                                <c:when test = "${(analistas.totalPages >= 3) && (analistas.number + 1 == analistas.totalPages)}">
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/${empresa.id}/analistas?key=">Primeira</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number - 2}&key=">${analistas.number - 1}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number - 1}&key=">${analistas.number}</a></li>
                                  <li class="page-item active"><a class="page-link text-white" href="${path}/painel/${empresa.id}/analistas?page=${analistas.number}&key=">${analistas.number + 1}</a></li>
                                  <li class="page-item"><a class="page-link text-primary" href="${path}/painel/${empresa.id}/analistas?page=${analistas.totalPages - 1}&key=">Última</a></li>
                                </c:when>
                              </c:choose> 
                            </ul>
                          </nav>  
                        </div>
                      </div>                    
                      <div class="table-responsive-sm">
                        <table class="table">
                          <thead class=" text-primary">
                            <th class="border text-center">Nome</th>
                            <th class="border text-center">Perfil</th>
                            <th class="border text-center">CPF</th>
                            <th class="border text-center">E-mail</th>
                            <th class="border text-center">Loja</th>
                          </thead>
                          <tbody>
                            <c:forEach var="analista" items="${analistas.content}">
                              <tr>
                                <td class="border text-center">${analista.nome} ${analista.sobrenome}</td>
                                <td class="border text-center">${analista.tipoUsuario.descricao}</td>
                                <c:if test = "${empty analista.cpf}">                    
                                  <td class="border text-center">Não Informado</td>
                                </c:if>
                                <c:if test = "${not empty analista.cpf}">                    
                                  <td class="border text-center">${analista.cpf}</td>
                                </c:if>
                                <td class="border text-center">${analista.email}</td>
                                <td class="border text-center" title="Cidade: ${analista.endereco.cidade} / Estado: ${analista.endereco.estado}"> ${analista.endereco.bairro}</td>
                              </tr>
                            </c:forEach>
                          </tbody>
                        </table>                        
                      </div>
                    </c:if>         
                  </div>                   
                </div>
                <hr class="bg-info">
                <div class="row justify-content-end">
                  <div class="col-12">
                    <a class="btn btn-info" href="${path}/painel/analistas/cadastro">Cadastrar</a>
                    <a class="btn btn-info" href="${path}/painel/dashboard"><i class="fas fa-angle-double-left"></i> Voltar</a>
                  </div>
                </div>                
              </div>
            </div>
            <div class="card-footer"></div>
          </div>          
        </div>         
      </div>
      <c:import url="/WEB-INF/views/componentes/footer/painel/footer.jsp" />
    </div>
  </div>

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

</html>