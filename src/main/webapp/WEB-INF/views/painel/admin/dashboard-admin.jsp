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
    <c:import url="/WEB-INF/views/componentes/sidebar/sidebar-admin.jsp" />    
    <div class="main-panel">
      <!-- Navbar -->
      <c:import url="/WEB-INF/views/componentes/navbar/navbar-admin.jsp" /> 
      <div class="content">
        <div class="row">
          <div class="col-lg-4 col-md-4 col-sm-6">
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
                      <i class="fas fa-project-diagram text-default"></i>
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
                      <i class="fas fa-hand-holding-heart text-default"></i>
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
                      <div class="alert alert-danger" role="alert">
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
                                <td class="text-center">
                                  <a href="${path}/painel/entidades/${entidade.id}" class="btn btn-default btn-circle" title="Visualizar"><i class="fas fa-file-alt"></i></a>
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
                      <div class="alert alert-danger mt-3" role="alert">
                        <p class="text-bold">Não há registro(s) ou .</p>
                      </div>
                    </c:if>
                    <c:if test = "${not empty projetos}">           
                      <c:forEach var="projeto" items="${projetos}">
                        <div class="row p-3 mt-3">
                          <div class="col-6 col-lg-4 col-md-12 col-sm-12 mx-auto text-center">
                            <figure class="figure">
                              <img src="${path}/${projeto.documentosProjeto.logo.path}" class="img-projeto mt-2 mb-2 mx-auto d-block" alt="${projeto.titulo}">
                            </figure>
                          </div>
                          <div class="col-6 col-lg-8 col-md-12 col-sm-12">
                            <h3>${projeto.titulo} @ ${projeto.entidade.nomeFantasia}</h3>
                            <hr class="bg-default">    
                            <p class="lead">${projeto.objetivo}</p>
                            <p class="text-center">
                              <button type="button" class="btn btn-primary">Ver Detalhes</button>
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
                  data: ['${dataChartEntidade[0]}', '${dataChartEntidade[1]}', '${dataChartEntidade[2]}', '${dataChartEntidade[3]}', '${dataChartEntidade[4]}', '${dataChartEntidade[5]}', '${dataChartEntidade[6]}', '${dataChartEntidade[7]}', '${dataChartEntidade[8]}', '${dataChartEntidade[9]}', '${dataChartEntidade[10]}', '${dataChartEntidade[11]}', '${dataChartEntidade[12]}'],
                  backgroundColor: [
                      'rgba(54, 162, 235, 0.2)',
                  ],
                  borderColor: [
                      'rgba(54, 162, 235, 1)',
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
              labels: ["Criança e Adolescente", "Fundo do Idoso"],
              datasets: [{
                  label: 'Registros',
                  data: [12, 40],
                  backgroundColor: [
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(54, 162, 235, 0.2)'
                  ],
                  borderColor: [
                      'rgba(54, 162, 235, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(54, 162, 235, 1)'
                  ],
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
                ]
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