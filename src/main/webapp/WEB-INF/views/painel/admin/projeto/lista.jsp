<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="pt-br">

<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        Dashboard
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
    <c:import url="/WEB-INF/views/componentes/sidebar/sidebar-admin.jsp"/>
    <div class="main-panel">
        <!-- Navbar -->
        <c:import url="/WEB-INF/views/componentes/navbar/navbar-admin.jsp"/>
        <div class="content">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header ">
                            <h5 class="card-title">Projetos Cadastrado(s): ${qtdProjetos}</h5>
                            <div class="d-flex justify-content-end">
                                <div class="row">
                                    <div class="col-12">
                                        <form class="form-inline">
                                            <div class="form-group mx-sm-3 mb-2">
                                                <input type="text" class="form-control" placeholder="Pesquisar por.."
                                                       name="n">
                                            </div>                                            <div class="form-group mb-2">
                                                <button type="submit" class="btn btn-primary mb-2"><i
                                                        class="fas fa-search"></i></button>
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
                                    <c:if test="${empty projetos}">
                                        <div class="alert alert-info alert-with-icon alert-dismissible fade show" data-notify="container">
                                            <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                <i class="nc-icon nc-simple-remove"></i>
                                            </button>
                                            <span data-notify="icon" class="nc-icon nc-zoom-split"></span>
                                            <span data-notify="message">Não há nenhum projeto cadastrado</span>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty projetos}">
                                        <c:forEach var="projeto" items="${projetos}">
                                            <div class="row p-3 mt-3">
                                                <div class="col-6 col-lg-4 col-md-12 col-sm-12 mx-auto text-center">
                                                    <figure class="figure">
                                                        <img src="${path}/${projeto.documentosProjeto.logo.path}"
                                                             class="img-projeto mt-2 mb-2 mx-auto d-block"
                                                             alt="${projeto.titulo}">
                                                    </figure>
                                                </div>
                                                <div class="col-6 col-lg-8 col-md-12 col-sm-12">
                                                    <h3>${projeto.titulo} @ ${projeto.entidade.nomeFantasia}</h3>
                                                    <hr class="bg-default">
                                                    <p class="lead">${projeto.objetivo}</p>
                                                    <p class="text-center">
                                                        <a href="${path}/painel/projetos/${projeto.id}"
                                                           class="btn btn-primary">Ver Detalhes</a>
                                                    </p>
                                                </div>
                                            </div>
                                            <hr>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="/WEB-INF/views/componentes/footer/painel/footer.jsp"/>
    </div>
</div>

<!--   JQUERY   -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<!--   POPPER   -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<!--   BOOTSTRAP   -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script type="text/javascript" src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0"></script>

</body>

</html>