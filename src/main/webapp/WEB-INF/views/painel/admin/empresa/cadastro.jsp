<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="pt-br">

<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        Incentivados - Cadastro de Empresas
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <!--     FONTAWESOME     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <!--     BOOTSTRAP     -->
    <link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <!--     CUSTOM     -->
    <link href="${path}/assets/css/paper-dashboard.css?v=2.0.0" rel="stylesheet"/>
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
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-info"></div>
                        <div class="card-body border">
                            <form action="${path}/painel/empresas/cadastro" method="post" enctype="multipart/form-data"
                                  acceptcharset="UTF-8">
                                <fieldset>
                                    <legend class="text-primary">Informações Gerais:</legend>
                                    <div class="row mt-3 mt-3">
                                        <div class="col-sm-12  col-lg-4">
                                            <div class="form-group">
                                                <label>Nome Fantasia:</label>
                                                <input type="text" class="form-control" name="nomeFantasia" required>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-lg-4">
                                            <div class="form-group">
                                                <label>Razao Social:</label>
                                                <input type="text" class="form-control" name="razaoSocial" required>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-lg-4">
                                            <div class="form-group">
                                                <label>CNPJ:</label>
                                                <input type="text" class="form-control" id="cnpj" name="cnpj"
                                                       onchange="if(!validarCNPJ(this.value)){$('#modal-cnpj-invalido').modal('show'); this.value='';}"
                                                       required>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="mt-3 mt-3">
                                    <legend class="text-primary">Uploads:</legend>
                                    <div class="row justify-content-start">
                                        <div class="col-lg-12 text-center mt-3">
                                            <div class="form-group">
                                                <label for="logo"><i class="far fa-image text-primary"
                                                                     style="font-size: 78px;"></i></label>
                                                <hr>
                                                <h5 class="text-center">Logo</h5>
                                                <input type="file" id="logo" name="documentosEmpresa.logo.file"
                                                       onchange="validaImg(this, this.id)" required>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                                <hr class="bg-success">
                                <button type="submit" class="btn btn-info float-right">Enviar <i
                                        class="far fa-share-square"></i></button>
                                <a href="${path}/painel/empresas" class="btn btn-danger float-right"><i
                                        class="fas fa-angle-double-left"></i> Voltar</a>
                            </form>
                        </div>
                        <div class="card-footer bg-info"></div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="/WEB-INF/views/componentes/footer/painel/footer.jsp"/>
    </div>
</div>

<!-- MODALS -->
<c:import url="/WEB-INF/views/componentes/modal/modal-cnpj-invalido.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-arquivo-recusado-all.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-arquivo-recusado-img.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-arquivo-recusado-pdf.jsp"/>


<!--   JQUERY   -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!--   POPPER   -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--   BOOTSTRAP   -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script type="text/javascript" src="${path}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0"></script>
<!-- API'S -->
<script type="text/javascript" src="${path}/api/via-cep.js"></script>
<!-- VALIDATOR -->
<script type="text/javascript" src="${path}/assets/js/cnpj-validator.js"></script>
<script type="text/javascript" src="${path}/assets/js/file-validator.js"></script>
<!-- MASK -->
<script type="text/javascript" src="${path}/assets/js/core/jquery.maskedinput.js"></script>
<script type="text/javascript">
    $("#cnpj").mask("99.999.999/9999-99");
    $("#cep").mask("99999-999");
</script>
</body>

</html>