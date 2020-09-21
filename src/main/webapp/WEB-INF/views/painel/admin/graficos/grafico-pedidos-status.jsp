<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                <li>
                    <a href="${path}/painel/pedidos?filtro=TODOS&key=">
                        <i class="fas fa-praying-hands"></i>Pedidos</a>
                </li>
                <li>
                    <a href="${path}/painel/ranking">
                        <i class="fas fa-medal"></i>Ranking</a>
                </li>
                <li>
                    <a data-toggle="collapse" href="#graficos"><i class="fas fa-chart-line"></i>Gráficos<b
                            class="caret"></b></a>
                    <div class="collapse show" id="graficos">
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
                                <div class="collapse show" id="graficos-pedidos">
                                    <ul class="nav">
                                        <li class="active">
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
                    <b><a class="navbar-brand" href="#">Gráficos <i class='fas fa-angle-double-right'></i> Pedidos <i
                            class='fas fa-angle-double-right'></i> Status</a></b>
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
                                <a class="dropdown-item" href="${path}/painel/perfil" data-toggle="modal"
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
                <div class="col-md-10 mx-auto">
                    <div class="card ">
                        <div class="card-header ">
                            <h5 class="card-title">Pedidos x Status</h5>
                        </div>
                        <div class="card-body ">
                            <canvas id="pedidos-donut-chart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

        </div>
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
<script type="text/javascript">
    var doughnutCtx = document.getElementById("pedidos-donut-chart").getContext('2d');
    var doughnutChart = new Chart(doughnutCtx, {
        type: 'doughnut',
        data: {
            labels: ["${pendentes.label}", "${recusados.label}", "${aprovados.label}"],
            datasets: [{
                label: 'Registros',
                data: ["${pendentes.value}", "${recusados.value}", "${aprovados.value}"],
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