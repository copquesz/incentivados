<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<html lang="pt-br">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Incentivados - Cadastro de Projeto
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     FONTAWESOME     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet"/>
  <link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" rel="stylesheet">
  <!--     BOOTSTRAP     -->
  <link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/css/bootstrap-select.min.css" rel="stylesheet">
  <!--     CUSTOM     -->
  <link href="${path}/assets/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
  <link href="${path}/assets/css/style.css" rel="stylesheet" />
</head>

<body class="">
  <div class="wrapper ">
    <!-- Sidebar -->    
    <div class="sidebar" data-color="verde" data-active-color="white">
      <div class="logo">
        <a href="#" class="simple-text logo-mini">
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
              <i class="fas fa-desktop"></i>Painel Principal
            </a>
          </li>
          <li>
            <a href="${path}/painel/entidades">
              <i class="fas fa-users"></i>Entidades
            </a>
          </li>
          <li class="active">
            <a href="${path}/painel/projetos">
              <i class="fas fa-project-diagram"></i>Projetos
            </a>
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
                <b><a class="navbar-brand" href="#">Projetos <i class='fas fa-angle-double-right'></i> Cadastro</a></b>
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
          <div class="col-md-12">
            <div class="card">
              <div class="card-header bg-info"></div>
              <div class="card-body border">
                <form action="${path}/painel/projetos/cadastro" method="post" enctype="multipart/form-data" acceptcharset="UTF-8">

                  <fieldset>
                  <legend class="text-primary">Órgão Executor:</legend>
                      <label>Entidade:</label>
                      <select class="selectpicker form-control" name="entidade" title="Selecione ..." data-live-search="true" data-style="btn-info" required>
                        <c:forEach var="entidade" items="${entidades}">
                          <option value="${entidade.id}">${entidade.razaoSocial}</option>
                        </c:forEach>
                      </select>
                  </fieldset>

                  <fieldset class="mt-5">
                  <legend class="text-primary">Incentivo Fiscal:</legend>
                      <label>Lei:</label>
                      <select class="selectpicker form-control" name="incentivosFiscais" multiple title="Selecione ..." data-live-search="true" data-style="btn-info" required>
                        <c:forEach var="incentivoFiscal" items="${incentivosFiscais}">
                          <option value="${incentivoFiscal.id}">${incentivoFiscal.legislacao} <c:if test = "${not empty incentivoFiscal.sigla}"> - ${incentivoFiscal.sigla}</c:if></option>
                        </c:forEach>
                      </select>
                  </fieldset>

                  <fieldset class="mt-5">
                  <legend class="text-primary">Informações Gerais:</legend>

                  <hr class="bg-primary">

                  <div class="row mt-3">
                    <div class="col-12">
                      <div class="form-group">
                          <label>Título:</label>
                          <input type="text" class="form-control" name="titulo" required>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-12 col-md-3">
                      <div class="form-group">
                          <label>Valor Solicitado:</label>
                          <input type="text" class="form-control" id="valor-solicitado" name="valorSolicitado" required>
                      </div>
                    </div>
                    <div class="col-sm-12 col-md-3">
                      <div class="form-group">
                          <label>Valor Total:</label>
                          <input type="text" class="form-control" id="valor-total" name="valorTotal" required>
                      </div>
                    </div>
                    <div class="col-sm-12 col-md-3">
                      <div class="form-group">
                          <label>Beneficiários Diretos:</label>
                          <input type="number" class="form-control" name="beneficiariosDiretos" required>
                      </div>
                    </div>
                    <div class="col-sm-12 col-md-3">
                      <div class="form-group">
                          <label>Beneficiários Indiretos:</label>
                          <input type="number" class="form-control" name="beneficiariosIndiretos" required>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Contrapartida:</label>
                        <textarea class="form-control" name="contrapartida" rows="5" maxlength="3000" placeholder="Cite as estratégias de contrapartida ..." required></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Objetivo:</label>
                        <textarea class="form-control" name="objetivo" rows="5" maxlength="3000" placeholder="Descreva o seu objetivo ..." required></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Resumo:</label>
                        <textarea class="form-control" name="resumo" rows="10" maxlength="3000" placeholder="Apresente um resumo do projeto ..." required></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="row mt-5">
                    <div class="col-md-3">
                      <div class="form-group">
                        <label>Possui Parceiros/Apoiadores:</label>
                        <select class="form-control" id="condicional-parceiros-apoiadores">
                          <option value="Não">Não</option>
                          <option value="Sim">Sim</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-md-9" id="campo-parceiros-apoiadores">
                      <div class="form-group">
                        <label>Parceiros e Apoiadores:</label>
                        <input type="text" class="form-control" name="parceiros">
                      </div>
                    </div>
                  </div>
                  </fieldset>

                  <fieldset class="mt-5 mb-5">
                  <legend class="text-primary">Uploads:</legend>
                    <hr class="bg-primary">
                    <div class="row justify-content-start">
                      <div class="col-sm-12 col-md-6 text-center mt-5">
                        <div class="form-group">
                            <label for="logo"><i class="far fa-file-image text-primary" style="font-size: 56px;"></i></label>
                            <hr>
                            <h5 class="text-center">Logo</h5>
                            <input type="file" id="logo" name="documentosProjeto.logo.file" onchange="validaImg(this, this.id)" required>
                        </div>
                      </div>
                      <div class="col-sm-12 col-md-6 text-center mt-5">
                        <div class="form-group">
                            <label for="proposta-tecnica"><i class="far fa-file-pdf text-primary" style="font-size: 56px;"></i></label>
                            <hr>
                            <h5 class="text-center">Proposta Técnica</h5>
                            <input type="file" id="proposta-tecnica" name="documentosProjeto.propostaTecnica.file" onchange="validaPdf(this, this.id)" required>
                        </div>
                      </div>
                      <div class="col-sm-12 col-md-6 text-center mt-5">
                        <div class="form-group">
                            <label for="proposta-orcamentaria"><i class="far fa-file-pdf text-primary" style="font-size: 56px;"></i></label>
                            <hr>
                            <h5 class="text-center">Proposta Orçamentária</h5>
                            <input type="file" id="proposta-orcamentaria" name="documentosProjeto.propostOrcamentaria.file" onchange="validaImgPdf(this, this.id)" required>
                        </div>
                      </div>
                      <div class="col-sm-12 col-md-6 text-center mt-5">
                        <div class="form-group">
                            <label for="dados-bancarios"><i class="far fa-file-pdf text-primary" style="font-size: 56px;"></i></label>
                            <hr>
                            <h5 class="text-center">Dados Bancários da Entidade</h5>
                            <input type="file" id="dados-bancarios" name="documentosProjeto.dadosBancarios.file" onchange="validaImgPdf(this, this.id)" required>
                        </div>
                      </div>
                      <div class="col-sm-12 col-md-6 text-center mt-5">
                        <div class="form-group">
                            <label for="certificado"><i class="far fa-file-pdf text-primary" style="font-size: 56px;"></i></label>
                            <hr>
                            <h5 class="text-center">Certificado de Captação / Diário Oficial</h5>
                            <input type="file" id="certificado" name="documentosProjeto.certificado.file" onchange="validaImgPdf(this, this.id)" required>
                        </div>
                      </div>
                    </div>
                  </fieldset>

                  <hr class="bg-primary">
                  <button type="submit" class="btn btn-primary float-right">Enviar <i class="far fa-share-square"></i></button>
                  <a href="${path}/painel/dashboard" class="btn btn-danger float-right"><i class="fas fa-angle-double-left"></i> Voltar</a>
                </form>
              </div>
              <div class="card-footer bg-info"></div>
            </div>
          </div>
        </div>
      </div>
      <c:import url="/WEB-INF/views/componentes/footer/painel/footer.jsp" />
      <c:import url="/WEB-INF/views/componentes/modal/modal-motivo-reprovado.jsp" />
    </div>
  </div>

  <!-- MODALS -->
  <c:import url="/WEB-INF/views/componentes/modal/modal-arquivo-recusado-all.jsp" />
  <c:import url="/WEB-INF/views/componentes/modal/modal-arquivo-recusado-img.jsp" />
  <c:import url="/WEB-INF/views/componentes/modal/modal-arquivo-recusado-pdf.jsp" />


  <!--   JQUERY   -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <!--   POPPER   -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <!--   BOOTSTRAP   -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/js/bootstrap-select.min.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script type="text/javascript" src="${path}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <script type="text/javascript" src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0"></script>
  <!-- API'S -->
  <script type="text/javascript" src="${path}/api/via-cep.js"></script>
  <!-- VALIDATOR -->
  <script type="text/javascript" src="${path}/assets/js/file-validator.js"></script>
  <!-- MASK -->
  <script type="text/javascript" src="${path}/assets/js/core/jquery.maskMoney.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
        let condicional = $('#condicional-parceiros-apoiadores');
        let campo_parceiros_apoiadores = $('#campo-parceiros-apoiadores');
        campo_parceiros_apoiadores.hide();

        condicional.change(function () {
          if(condicional.val() == "Não"){
            campo_parceiros_apoiadores.hide();
          }
          else{
            campo_parceiros_apoiadores.show();
          }
        });
        //final get estado
    });
  </script>
  <script type="text/javascript">
    $("#valor-solicitado").maskMoney({showSymbol: true, symbol:'R$ ', thousands:'.', decimal:','});
    $("#valor-total").maskMoney({showSymbol: true, symbol:'R$ ', thousands:'.', decimal:','});
  </script>
</body>

</html>