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
  <c:import url="/WEB-INF/views/componentes/sidebar/sidebar-analista.jsp" />
  <div class="main-panel">
    <!-- Navbar -->
    <c:import url="/WEB-INF/views/componentes/navbar/navbar-analista.jsp" />
    <div class="content">
      <div class="row">
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
                      ${qtdPedidos}
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
        <div class="col-md-12">
          <div class="card ">
            <div class="card-body">
              <ul class="nav nav-pills" id="myTab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active bg-warning text-white border" id="pendentes-tab" data-toggle="tab" href="#pendentes" role="tab" aria-controls="pendentes" aria-selected="true">Pendentes: ${qtdPendente}</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link bg-success text-white border" id="aprovados-tab" data-toggle="tab" href="#aprovados" role="tab" aria-controls="aprovados" aria-selected="false">Aprovados: ${qtdAprovado}</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link bg-danger text-white border" id="recusados-tab" data-toggle="tab" href="#recusados" role="tab" aria-controls="recusados" aria-selected="false">Recusados: ${qtdRecusado}</a>
                </li>
              </ul>
              <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="pendentes" role="tabpanel" aria-labelledby="pendentes-tab">
                  <c:if test = "${empty pendentes}">
                    <div class="row mt-2">
                      <div class="col-12">
                        <div class="alert alert-info" role="alert">
                          <p class="text-bold">Não há registro(s).</p>
                        </div>
                      </div>
                    </div>
                  </c:if>
                  <c:if test = "${not empty pendentes}">
                    <div class="row mt-2">
                      <div class="col-12">
                        <div class="table-responsive pr-3">
                          <table class="table border">
                            <thead class=" text-primary">
                            <th class="text-center">Código Pedido</th>
                            <th class="text-center">Data Solicitação</th>
                            <th class="text-center">Entidade</th>
                            <th class="text-center">Empresa</th>
                            <th class="text-center">Loja</th>
                            <th class="text-center">Carta Ofício</th>
                            <th class="text-center"></th>
                            </thead>
                            <tbody>
                            <c:forEach var="pedidoPendente" items="${pendentes}">
                              <tr>
                                <td class="text-center">${pedidoPendente.id}</td>
                                <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${pedidoPendente.dataCadastro}" var="dataCadastro" />
                                <td class="text-center">${dataCadastro}</td>
                                <td class="text-center">${pedidoPendente.entidade.nomeFantasia}</td>
                                <td class="text-center">${pedidoPendente.empresa.nomeFantasia}</td>
                                <td class="text-center">${pedidoPendente.analista.endereco.bairro} - ${pedidoPendente.analista.endereco.cidade} / ${pedidoPendente.analista.endereco.estado}</td>
                                <td class="text-center"><a href="${path}/${pedidoPendente.documentosPedido.cartaOficio.path}" title="Visualizar" target="_blank"><i class="far fa-file-alt"></i> Carta Ofício</a></td>
                                <td class="text-center"><a class="btn btn-success btn-sm" href="${path}/painel/pedido/${pedidoPendente.id}" title="Avaliar"><i class="fas fa-sign-in-alt"></i></a></td>
                              </tr>
                            </c:forEach>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </c:if>
                </div>
                <div class="tab-pane fade show" id="aprovados" role="tabpanel" aria-labelledby="aprovados-tab">
                  <c:if test = "${empty aprovados}">
                    <div class="row mt-2">
                      <div class="col-12">
                        <div class="alert alert-info" role="alert">
                          <p class="text-bold">Não há registro(s).</p>
                        </div>
                      </div>
                    </div>
                  </c:if>
                  <c:if test = "${not empty aprovados}">
                    <div class="row mt-2">
                      <div class="col-12">
                        <div class="table-responsive pr-3">
                          <table class="table border">
                            <thead class=" text-primary">
                            <th class="text-center">Código Pedido</th>
                            <th class="text-center">Data Solicitação</th>
                            <th class="text-center">Entidade</th>
                            <th class="text-center">Empresa</th>
                            <th class="text-center">Loja</th>
                            <th class="text-center">Carta Ofício</th>
                            </thead>
                            <tbody>
                            <c:forEach var="pedidoAprovado" items="${aprovados}">
                              <tr>
                                <td class="text-center">${pedidoAprovado.id}</td>
                                <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${pedidoAprovado.dataCadastro}" var="dataCadastro" />
                                <td class="text-center">${dataCadastro}</td>
                                <td class="text-center">${pedidoAprovado.entidade.nomeFantasia}</td>
                                <td class="text-center">${pedidoAprovado.empresa.nomeFantasia}</td>
                                <td class="text-center">${pedidoAprovado.analista.endereco.bairro} - ${pedidoAprovado.analista.endereco.cidade} / ${pedidoAprovado.analista.endereco.estado}</td>
                                <td class="text-center"><a href="${path}/${pedidoAprovado.documentosPedido.cartaOficio.path}" title="Visualizar" target="_blank"><i class="far fa-file-alt"></i> Carta Ofício</a></td>
                              </tr>
                            </c:forEach>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </c:if>
                </div>
                <div class="tab-pane fade show" id="recusados" role="tabpanel" aria-labelledby="recusados-tab">
                  <c:if test = "${empty recusados}">
                    <div class="row mt-2">
                      <div class="col-12">
                        <div class="alert alert-info" role="alert">
                          <p class="text-bold">Não há registro(s).</p>
                        </div>
                      </div>
                    </div>
                  </c:if>
                  <c:if test = "${not empty recusados}">
                    <div class="row mt-2">
                      <div class="col-12">
                        <div class="table-responsive pr-3">
                          <table class="table border">
                            <thead class=" text-primary">
                            <th class="text-center">Código Pedido</th>
                            <th class="text-center">Data Solicitação</th>
                            <th class="text-center">Entidade</th>
                            <th class="text-center">Empresa</th>
                            <th class="text-center">Loja</th>
                            <th class="text-center">Carta Ofício</th>
                            <th class="text-center">Motivo</th>
                            </thead>
                            <tbody>
                            <c:forEach var="pedidoReprovado" items="${recusados}">
                              <tr>
                                <td class="text-center">${pedidoReprovado.id}</td>
                                <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${pedidoReprovado.dataCadastro}" var="dataCadastro" />
                                <td class="text-center">${dataCadastro}</td>
                                <td class="text-center">${pedidoReprovado.entidade.nomeFantasia}</td>
                                <td class="text-center">${pedidoReprovado.empresa.nomeFantasia}</td>
                                <td class="text-center">${pedidoReprovado.analista.endereco.bairro} - ${pedidoReprovado.analista.endereco.cidade} / ${pedidoReprovado.analista.endereco.estado}</td>
                                <td class="text-center"><a href="${path}/${pedidoReprovado.documentosPedido.cartaOficio.path}" title="Visualizar" target="_blank"><i class="far fa-file-alt"></i> Carta Ofício</a></td>
                                <td class="text-center"><a href="#" data-toggle="modal" data-target="#modal-motivo-reprovado-${pedidoReprovado.id}" title="Visualizar"><i class="far fa-file-pdf"></i></a></td>
                              </tr>
                            </c:forEach>
                            </tbody>
                          </table>
                        </div>
                      </div>
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
    <c:import url="/WEB-INF/views/componentes/modal/modal-motivo-reprovado.jsp" />
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
<script type="text/javascript" src="${path}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<script src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0" type="text/javascript"></script>
</body>

</html>