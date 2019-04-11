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
    Incentivados - Dashboard
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
    <c:import url="/WEB-INF/views/componentes/sidebar/sidebar-entidade.jsp" />    
    <div class="main-panel">
      <!-- Navbar -->
      <c:import url="/WEB-INF/views/componentes/navbar/navbar-entidade.jsp" />    
      <div class="content">
        <div class="row">
          <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="far fa-address-card text-default"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
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
          <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="fas fa-project-diagram text-default"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
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
          <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="fas fa-hand-holding-heart text-default"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
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
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header ">
                <c:if test = "${cadastroProjeto}">
                  <a href="${path}/painel/projetos/cadastro" class="btn btn-default float-right"><i class="fas fa-plus mr-2"></i> Cadastrar Projeto</a>
                </c:if>                 
                  <a href="${path}/painel/entidades/cadastro" class="btn btn-default float-right"><i class="fas fa-plus mr-2"></i> Cadastrar Entidade</a>
                <h5 class="card-title">Meus Cadastros</h5>
              </div>
              <div class="card-body ">
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
                    <c:if test = "${empty entidades}">
                      <div class="alert alert-danger mt-3" role="alert">
                        <p class="text-bold">Não há registro(s) ou .</p>
                      </div>
                    </c:if>      
                    <c:if test = "${not empty entidades}">              
                      <div class="table-responsive">
                        <table class="table">
                          <thead class=" text-primary">
                            <th></th>
                            <th>Data Cadastro</th>
                            <th>Nome Fantasia</th>
                            <th>CNPJ</th>
                            <th></th>
                          </thead>
                          <tbody>
                            <c:forEach var="entidade" items="${entidades}">
                              <tr>
                                <td class="text-center"><img class="logo-entidade" src="${path}/${entidade.documentosEntidade.logo.path}"></td>
                                <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${entidade.dataCadastro}" var="dataCadastro" />
                                <td>${dataCadastro}</td>
                                <td>${entidade.nomeFantasia}</td>
                                <td>${entidade.cnpj}</td>
                                <td class="text-center"><a href="${path}/painel/entidades/${entidade.id}" class="btn btn-default btn-circle" title="Visualizar"><i class="fas fa-file-alt"></i></a></td>
                              </tr>
                            </c:forEach>
                          </tbody>
                        </table>
                      </div>   
                    </c:if>            
                  </div>
                  <div class="tab-pane fade" id="projetos" role="tabpanel" aria-labelledby="projetos-tab">
                    <c:if test = "${empty projetos}">
                      <div class="alert alert-danger mt-3" role="alert">
                        <p class="text-bold">Não há registro(s) ou .</p>
                      </div>
                    </c:if> 
                    <c:if test = "${not empty projetos}">
                      <c:forEach var="projeto" items="${projetos}">
                        <div class="row p-3 mt-3">
                          <div class="col-6 col-lg-4 col-md-12 col-sm-12 mx-auto text-center">
                            <figure class="figure">
                              <img src="${path}/${projeto.documentosProjeto.logo.path}" class="img-projeto img-fluid mt-2 mb-2 mx-auto d-block" alt="Logo">
                            </figure>
                          </div>
                          <div class="col-6 col-lg-8 col-md-12 col-sm-12">
                            <h3>${projeto.titulo}</h3>
                            <hr class="bg-default">    
                            <p class="lead">${projeto.objetivo}</p>
                            <p class="text-center">
                              <a href="${path}/painel/projetos/${projeto.id}" class="btn btn-primary">Ver Detalhes</a>
                            </p>
                            <p></p>                
                          </div>
                        </div>
                      </c:forEach>
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
                <c:if test = "${empty pedidos}">
                  <div class="alert alert-danger mt-3" role="alert">
                    <p class="text-bold">Não há registro(s) ou .</p>
                  </div>
                </c:if>      
                <c:if test = "${not empty pedidos}">              
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th class="text-center">Código Pedido</th>
                        <th class="text-center">Data Solicitação</th>
                        <th class="text-center">Entidade</th>
                        <th class="text-center">Empresa</th>
                        <th class="text-center">Loja</th>
                        <th class="text-center">Carta Ofício</th>
                        <th class="text-center">Status</th>
                      </thead>
                      <tbody>
                        <c:forEach var="pedido" items="${pedidos}">
                          <tr>
                            <td class="text-center">${pedido.id}</td>
                            <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${pedido.dataCadastro}" var="dataCadastro" />
                            <td class="text-center">${dataCadastro}</td>
                            <td class="text-center">${pedido.entidade.nomeFantasia}</td>
                            <td class="text-center">${pedido.empresa.nomeFantasia}</td>
                            <td class="text-center">${pedido.analista.endereco.bairro} - ${pedido.analista.endereco.cidade} / ${pedido.analista.endereco.estado}</td>
                            <td class="text-center"><a href="${path}/${pedido.documentosPedido.cartaOficio.path}" title="Visualizar" target="_blank"><i class="far fa-file-alt"></i> Carta Ofício</a></td>
                            <th class="text-center">
                              <c:if test = "${pedido.status.id == 0}"><span class="bg-warning" ">${pedido.status}</span></c:if>
                              <c:if test = "${pedido.status.id == 1}"><span class="bg-danger" ">${pedido.status}</span></c:if>
                              <c:if test = "${pedido.status.id == 2}"><span class="bg-success" ">${pedido.status}</span></c:if>
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
  <!--   JQUERY   -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <!--   POPPER   -->  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <!--   BOOTSTRAP   -->  
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script type="text/javascript" src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0"></script>  
</body>

</html>