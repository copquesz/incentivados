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
            <a href="${path}/painel/pedidos">
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
          <div class="col-md-4">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">Entidades Cadastradas</h5>
              </div>
              <div class="card-body ">
                
                <canvas id="line-chart" height="250"></canvas>

              </div>
            </div>
          </div>

          <div class="col-md-4">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">Projetos x Leis</h5>
              </div>
              <div class="card-body ">
                
                <canvas id="bar-chart" height="250"></canvas>

              </div>
            </div>
          </div>

          <div class="col-md-4">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">Pedidos</h5>
              </div>
              <div class="card-body ">
                
                <canvas id="doughnut-chart" height="250"></canvas>

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
                    <c:if test = "${empty entidades}">
                      <div class="alert alert-info" role="alert">
                        <p class="text-bold">Não há registro(s) ou .</p>
                      </div>
                    </c:if>      
                    <c:if test = "${not empty entidades}">              
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
                            <c:forEach var="entidade" items="${entidades}">
                              <tr>
                                <td class="text-center"><img src="${path}/${entidade.documentosEntidade.logo.path}" style="max-width: 8rem; max-height: 4rem;"></td>
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
                    <c:if test = "${empty projetos}">
                      <div class="alert alert-info mt-3" role="alert">
                        <p class="text-bold">Não há registro(s) ou .</p>
                      </div>
                    </c:if>
                    <c:if test = "${not empty projetos}"> 
                      <div class="row justify-content-start">
                        <c:forEach var="projeto" items="${projetos}">
                          <div class="col-12 col-xl-3 col-lg-6 col-md-6 d-flex align-items-stretch bd-highlight">
                            <div class="card border align-self-stretch flex-fill bd-highlight mt-3">
                              <img src="${path}/${projeto.documentosProjeto.logo.path}" class="card-img-top" alt="...">
                              <div class="card-body">
                                <h5 class="card-title" style="font-weight: bold;">${projeto.titulo}</h5>
                                <hr>
                                <p class="card-text text-justify">${fn:substring(projeto.objetivo, 0, 180)} ...</p>
                              </div>
                              <div class="card-footer">
                                <button type="button" class="btn btn-primary">Ver Detalhes</button>
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
    <script type="text/javascript">    
      var lineCtx = document.getElementById("line-chart").getContext('2d');
      var lineChart = new Chart(lineCtx, {
          type: 'line',
          data: {
              labels: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
              datasets: [{
                  label: 'Registros',                  
                  data: [<c:forEach var="dataChartEntidade" items="${datasChartEntidade}">${dataChartEntidade},</c:forEach>],
                  backgroundColor: [
                      'rgba(114, 191, 68, 0.2)',
                  ],
                  borderColor: [
                      'rgba(114, 191, 68, 1)',
                  ],
                  borderWidth: 1
              }]
          },
          options: {
              legend: {
                  display: false
              },
              scales: {
                  yAxes: [{
                      ticks: {
                          beginAtZero:true
                      }
                  }]
              }
          }
      });

      var barCtx = document.getElementById("bar-chart").getContext('2d');
      var barChart = new Chart(barCtx, {
          type: 'bar',
          data: {
              labels: [<c:forEach var="incentivoFiscal" items="${incentivosFiscais}">'${incentivoFiscal.legislacao}',</c:forEach>],
              datasets: [{
                  label: 'Registros',
                  data: [<c:forEach var="dataCharProjeto" items="${datasCharProjeto}">${dataCharProjeto},</c:forEach>],
                  backgroundColor: [<c:forEach var="incentivoFiscal" items="${incentivosFiscais}">'rgba(114, 191, 68, 0.2)',</c:forEach>],
                  borderColor: [<c:forEach var="incentivoFiscal" items="${incentivosFiscais}">'rgba(114, 191, 68, 1)',</c:forEach>],
                  borderWidth: 1
              }]
          },
          options: {
              legend: {
                  display: false
              },
              scales: {
                xAxes: [
                  {
                    ticks:{                      
                      callback: function (value) {
                        return ""
                      }
                    },
                  },
                ],
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
              }
          }
      });

      var doughnutCtx = document.getElementById("doughnut-chart").getContext('2d');
      var doughnutChart = new Chart(doughnutCtx, {
          type: 'doughnut',
          data: {
              labels: ["Pendente", "Recusado", "Aprovado"],
              datasets: [{
                  label: 'Registros',
                  data: ['${qtdPedidosPendente}', '${qtdPedidosRecusado}', '${qtdPedidosAprovado}'],
                  backgroundColor: [
                      'rgba(241, 196, 15, 0.6)',
                      'rgba(231, 76, 60, 0.6)',
                      'rgba(46, 204, 113, 0.6)'
                  ],
                  borderColor: [
                      'rgba(241, 196, 15, 0.6)',
                      'rgba(231, 76, 60, 0.6)',
                      'rgba(46, 204, 113, 0.6)'
                  ],
                  borderWidth: 1
              }]
          },
          options: {
              legend: {
                  display: false
              },
              scales: {
                  display: false
              }
          }
      });
  </script>
</body>

</html>