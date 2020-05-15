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
      Incentivados - ${projeto.titulo}
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
        name='viewport'/>
  <!--     FONTAWESOME     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet"/>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
        integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!--     BOOTSTRAP     -->
  <link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="${path}/assets/css/bootstrap-select.min.css" rel="stylesheet">
  <!--     CUSTOM     -->
  <link href="${path}/assets/css/paper-dashboard.css?v=2.0.0" rel="stylesheet"/>
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
          <li class="active">
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
              <i class="far fa-chart-bar"></i>Ranking</a>
          </li>
          <li>
            <a data-toggle="collapse" href="#graficos"><i class="fas fa-chart-line"></i>Gráficos<b class="caret"></b></a>
              <div class="collapse" id="graficos">
                <ul class="nav">
                  <li>
                    <a data-toggle="collapse" href="#graficos-entidade" style="margin-left: 30px;"><i class="fas fa-users"></i>Entidades <b class="caret"></b></a>
                      <div class="collapse" id="graficos-entidade">
                        <ul class="nav">
                          <li>
                            <a href="${path}/painel/graficos/entidades/linha-do-tempo" style="margin-left: 50px;"><i class="fas fa-chart-area"></i>Linha do Tempo</a>
                          </li>
                        </ul>
                      </div>                   
                  </li>
                  <li>
                    <a data-toggle="collapse" href="#graficos-projetos" style="margin-left: 30px;"><i class="fas fa-project-diagram"></i>Projetos <b class="caret"></b></a>
                      <div class="collapse" id="graficos-projetos">
                        <ul class="nav">
                          <li>
                            <a href="${path}/painel/graficos/projetos/categoria" style="margin-left: 50px;"><i class="far fa-chart-bar"></i>Categoria</a>                            
                          </li>
                          <li>
                            <a href="${path}/painel/graficos/projetos/mapa" style="margin-left: 50px;"><i class="fas fa-globe-americas"></i>Mapa</a>
                          </li>
                        </ul>
                      </div>                   
                  </li>
                  <li>
                    <a data-toggle="collapse" href="#graficos-pedidos" style="margin-left: 30px;"><i class="fas fa-praying-hands"></i>Pedidos <b class="caret"></b></a>
                      <div class="collapse" id="graficos-pedidos">
                        <ul class="nav">
                          <li>
                            <a href="${path}/painel/graficos/pedidos/status" style="margin-left: 50px;"><i class="fas fa-chart-pie"></i>Status</a>                            
                          </li>
                          <li>
                            <a href="${path}/painel/graficos/pedidos/mapa" style="margin-left: 50px;"><i class="fas fa-globe-americas"></i>Mapa</a>
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
            <b><a class="navbar-brand" href="#">Projeto <i class='fas fa-angle-double-right'></i> ${projeto.titulo}</a></b>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <ul class="navbar-nav">
              <li class="nav-item btn-rotate dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-power-off"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Ações</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="${path}/painel/perfil">Meus Dados</a>
                  <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-alterar-senha">Alterar Senha</a>
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
                            <c:if test = "${not empty projeto.ods}">
                              <div class="row mt-2">
                                <div class="col-md-12">
                                  <c:forEach var="ods" items="${projeto.ods}">
                                    <img class="logo-ods float-right mx-1 my-1" src="${path}/${ods.path}">
                                  </c:forEach>
                                </div>
                              </div>
                            </c:if>
                            <div class="row mt-4">
                                <div class="col-sm-12 col-md-4 text-sm-center">
                                    <figure class="figure">
                                        <img class="img-thumbnail img-fluid"
                                             src="${path}/${projeto.documentosProjeto.logo.path}" style="height: 300px;" />
                                    </figure>
                                </div>
                                <div class="col-sm-12 col-md-8 text-center text-md-left">
                                    <h2 class="mt-3 ml-3 bold text-primary text-center">${projeto.titulo}</h2>
                                    <hr>
                                    <p class="lead">${projeto.objetivo}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row justify-content-center mt-5">
                                <div class="col-xl-2 col-lg-3 col-md-6 col-sm-12 bg-primary rounded text-center p-3 mx-3 my-1">
                                    <h5 class="text-white"><i class="fas fa-file-invoice-dollar fa-3x"></i></h5>
                                    <hr>
                                    <h5 class="text-white bold"><span
                                            style="font-size: 0.8rem;">Valor Total:</span> </br><span
                                            style="font-size: 1.3rem;">R$ ${projeto.valorTotal}</span></h5>
                                </div>
                                <div class="col-xl-2 col-lg-3 col-md-6 col-sm-12 bg-primary rounded text-center p-3 mx-3 my-1">
                                    <h5 class="text-white"><i class="fas fa-hand-holding-usd fa-3x"></i></h5>
                                    <hr>
                                    <h5 class="text-white bold"><span
                                            style="font-size: 0.8rem;">Valor Solicitado:</span> </br><span
                                            style="font-size: 1.3rem;">R$ ${projeto.valorSolicitado}</span></h5>
                                </div>
                                <div class="col-xl-2 col-lg-3 col-md-6 col-sm-12 bg-primary rounded text-center p-3 mx-3 my-1">
                                    <h5 class="text-white"><i class="fas fa-compress-arrows-alt fa-3x"></i></h5>
                                    <hr>
                                    <h5 class="text-white bold"><span
                                            style="font-size: 0.8rem;">Beneficiários Diretos:</span> </br><span
                                            style="font-size: 1.3rem;"><i
                                            class="fas fa-users"></i> ${projeto.beneficiariosDiretos}</span></h5>
                                </div>
                                <div class="col-xl-2 col-lg-3 col-md-6 col-sm-12 bg-primary rounded text-center p-3 mx-3 my-1">
                                    <h5 class="text-white"><i class="fas fa-expand-arrows-alt fa-3x"></i></h5>
                                    <hr>
                                    <h5 class="text-white bold"><span style="font-size: 0.8rem;">Beneficiários Indiretos:</span> </br>
                                        <span style="font-size: 1.3rem;"><i
                                                class="fas fa-users"></i> ${projeto.beneficiariosIndiretos}</span></h5>
                                </div>
                            </div>

                            <fieldset class="mt-5">
                                <legend class="text-primary">Informações Gerais:</legend>
                                <hr class="bg-primary">
                                <div class="row mt-3">
                                    <div class="col-12 col-md-4">
                                        <div class="form-group">
                                            <label>Data/Hora Cadastro:</label>
                                            <fmt:formatDate type="both" dateStyle="short" timeStyle="short"
                                                            value="${projeto.dataCadastro}" var="dataCadastro"/>
                                            <input type="text" class="form-control" value="${dataCadastro}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4">
                                        <div class="form-group">
                                            <label>Prazo de Captação:</label>
                                            <input type="text" class="form-control" value="${projeto.prazoCaptacao}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4">
                                        <div class="form-group">
                                            <label>Entidade Executora:</label>
                                            <input type="text" class="form-control"
                                                   value="${projeto.entidade.nomeFantasia}" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                  <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Responsável:</label>                                        
                                        <input type="text" class="form-control" value="${projeto.entidade.usuario.nome} ${projeto.entidade.usuario.sobrenome}" readonly>
                                    </div>
                                  </div>
                                  <div class="col-md-4">
                                    <div class="form-group">
                                        <label>E-mail:</label>                                        
                                        <input type="text" class="form-control" value="${projeto.entidade.usuario.email}" readonly>
                                    </div>
                                  </div>
                                  <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Telefone:</label>                                        
                                        <input type="text" class="form-control" value="${projeto.entidade.usuario.telefone}" readonly>
                                    </div>
                                  </div>
                                </div>                                
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Resumo:</label>
                                            <textarea class="form-control" rows="10"
                                                      readonly>${projeto.resumo}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>

                            <fieldset class="mt-5">
                                <legend class="text-primary">Categoria(s) Selecionada(s):</legend>
                                <hr class="bg-primary">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <ul>
                                                <c:forEach var="incentivoFiscal" items="${projeto.incentivosFiscais}">
                                                    <li class="lead">${incentivoFiscal.legislacao} <c:if
                                                            test="${not empty incentivoFiscal.sigla}"> - ${incentivoFiscal.sigla}</c:if></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>

                            
                            <fieldset class="mt-5">
                                <legend class="text-primary">Parceiros:</legend>
                                <hr class="bg-primary">
                                <c:if test="${empty projeto.parceiros}">
                                  <div class="alert alert-danger" role="alert">
                                    <small><i class="fas fa-info-circle"></i> Projeto não possui parceiro(s) cadastrado(s).</small>
                                  </div>
                                </c:if>
                                <c:if test="${not empty projeto.parceiros}">
                                  <div class="row">
                                      <div class="col-lg-12">
                                          <div class="form-group">
                                              <ul>
                                                <li class="lead">${projeto.parceiros}</li>
                                              </ul>
                                          </div>
                                      </div>
                                  </div>
                                </c:if>
                            </fieldset>

                            <fieldset class="mt-5">
                                <legend class="text-primary">Documentação:</legend>

                                <div class="row">
                                  <div class="col-12">

                                    <c:choose>                        
                                      <c:when test = "${projeto.documentosProjeto.logo.status eq 'APROVADO' && projeto.documentosProjeto.propostaTecnica.status eq 'APROVADO' && projeto.documentosProjeto.propostOrcamentaria.status eq 'APROVADO' && projeto.documentosProjeto.dadosBancariosFundo.status eq 'APROVADO' && projeto.documentosProjeto.certificado.status eq 'APROVADO'}">
                                        <div class="alert alert-success" role="alert">
                                          <small><strong><i class="far fa-check-circle"></i> A documentação está aprovada.</strong></small>
                                        </div>
                                      </c:when> 
                                      <c:when test = "${projeto.documentosProjeto.logo.status eq 'APROVADO' && projeto.documentosProjeto.propostaTecnica.status eq 'APROVADO' && projeto.documentosProjeto.propostOrcamentaria.status eq 'APROVADO' && projeto.documentosProjeto.certificado.status eq 'APROVADO' && projeto.documentosProjeto.dadosBancariosFundo.status eq 'NAO_SE_APLICA'}">
                                        <div class="alert alert-success" role="alert">
                                          <small><strong><i class="far fa-check-circle"></i> A documentação está aprovada.</strong></small>
                                        </div>
                                      </c:when>  

                                      <c:when test = "${projeto.documentosProjeto.logo.status eq 'NEGADO' || projeto.documentosProjeto.propostaTecnica.status eq 'NEGADO' || projeto.documentosProjeto.propostOrcamentaria.status eq 'NEGADO' || projeto.documentosProjeto.dadosBancariosFundo.status eq 'NEGADO' || projeto.documentosProjeto.certificado.status eq 'NEGADO'}">
                                        <div class="alert alert-danger" role="alert">
                                          <small><strong><i class="far fa-times-circle"></i> A documentação possui arquivo(s) negado(s). </br><a href="#" data-toggle="modal" data-target="#modal-regularizacao-documentos-projeto"><u>Clique aqui</u></a> para regularizar.</strong></small>
                                        </div>
                                      </c:when>                                      
                                      
                                      <c:otherwise>
                                        <div class="alert alert-warning" role="alert">
                                          <small><strong><i class="fas fa-exclamation-triangle"></i> A documentação está em processo de análise pelo comitê.</strong></small>
                                        </div>
                                      </c:otherwise>
                                    </c:choose>
                                    
                                  </div>
                                </div>

                                <hr class="bg-primary">
                                <div class="row justify-content-center">

                                    <!-- LOGO APROVADO -->
                                    <c:if test="${projeto.documentosProjeto.logo.status eq 'APROVADO'}">
                                      <div class="col-lg-2 text-center mt-5">
                                          <div class="form-group">
                                              <a title="Documento Aprovado" href="${path}/${projeto.documentosProjeto.logo.path}"
                                                 target="_blank"><i class="far fa-file-image text-primary"
                                                                    style="font-size: 56px;"></i></a>
                                              <hr>
                                              <h5 class="text-center"><strong style="color: #3fa733 !important">Logo</strong></h5>
                                          </div>
                                      </div>
                                    </c:if>
                                    <!-- LOGO NEGADO -->
                                    <c:if test="${projeto.documentosProjeto.logo.status eq 'NEGADO'}">
                                      <div class="col-lg-2 text-center mt-5">
                                          <div class="form-group">
                                              <a title="Documento Negado" href="${path}/${projeto.documentosProjeto.logo.path}"
                                                 target="_blank"><i class="far fa-file-image text-primary"
                                                                    style="font-size: 56px; color: #e74c3c !important;"></i></a>
                                              <hr>
                                              <h5 class="text-center"><strong style="color: #e74c33 !important">Logo</strong></h5>
                                          </div>
                                      </div>
                                    </c:if>
                                    <!-- LOGO PENDENTE -->
                                    <c:if test="${projeto.documentosProjeto.logo.status eq 'PENDENTE'}">
                                      <div class="col-lg-2 text-center mt-5">
                                          <div class="form-group">
                                              <a title="Documento em Análise" href="${path}/${projeto.documentosProjeto.logo.path}"
                                                 target="_blank"><i class="far fa-file-image text-primary"
                                                                    style="font-size: 56px; color: #f39c12 !important;"></i></a>
                                              <hr>
                                              <h5 class="text-center"><strong style="color: #f39c12 !important">Logo</strong></h5>
                                          </div>
                                      </div>
                                    </c:if>

                                    <!-- PROPOSTA TÉCNICA APROVADO -->
                                    <c:if test="${projeto.documentosProjeto.propostaTecnica.status eq 'APROVADO'}">
                                      <div class="col-lg-2 text-center mt-5">
                                          <div class="form-group">
                                              <a title="Documento Aprovado" href="${path}/${projeto.documentosProjeto.propostaTecnica.path}"
                                                 target="_blank"><i class="far fa-file-image text-primary"
                                                                    style="font-size: 56px;"></i></a>
                                              <hr>
                                              <h5 class="text-center"><strong style="color: #3fa733 !important">Proposta</strong></h5>
                                          </div>
                                      </div>
                                    </c:if>
                                    <!-- PROPOSTA TÉCNICA NEGADO -->
                                    <c:if test="${projeto.documentosProjeto.propostaTecnica.status eq 'NEGADO'}">
                                      <div class="col-lg-2 text-center mt-5">
                                          <div class="form-group">
                                              <a title="Documento Negado" href="${path}/${projeto.documentosProjeto.propostaTecnica.path}"
                                                 target="_blank"><i class="far fa-file-image text-primary"
                                                                    style="font-size: 56px; color: #e74c3c !important;"></i></a>
                                              <hr>
                                              <h5 class="text-center"><strong style="color: #e74c33 !important">Proposta</strong></h5>
                                          </div>
                                      </div>
                                    </c:if>
                                    <!-- PROPOSTA TÉCNICA PENDENTE -->
                                    <c:if test="${projeto.documentosProjeto.propostaTecnica.status eq 'PENDENTE'}">
                                      <div class="col-lg-2 text-center mt-5">
                                          <div class="form-group">
                                              <a title="Documento em Análise" href="${path}/${projeto.documentosProjeto.propostaTecnica.path}"
                                                 target="_blank"><i class="far fa-file-image text-primary"
                                                                    style="font-size: 56px; color: #f39c12 !important;"></i></a>
                                              <hr>
                                              <h5 class="text-center"><strong style="color: #f39c12 !important">Proposta</strong></h5>
                                          </div>
                                      </div>
                                    </c:if>

                                    <!-- ORÇAMENTÁRIO APROVADO -->
                                    <c:if test="${projeto.documentosProjeto.propostOrcamentaria.status eq 'APROVADO'}">
                                      <div class="col-lg-2 text-center mt-5">
                                          <div class="form-group">
                                              <a title="Documento Aprovado" href="${path}/${projeto.documentosProjeto.propostOrcamentaria.path}"
                                                 target="_blank"><i class="far fa-file-image text-primary"
                                                                    style="font-size: 56px;"></i></a>
                                              <hr>
                                              <h5 class="text-center"><strong style="color: #3fa733 !important">Orçamentário</strong></h5>
                                          </div>
                                      </div>
                                    </c:if>
                                    <!-- ORÇAMENTÁRIO NEGADO -->
                                    <c:if test="${projeto.documentosProjeto.propostOrcamentaria.status eq 'NEGADO'}">
                                      <div class="col-lg-2 text-center mt-5">
                                          <div class="form-group">
                                              <a title="Documento Negado" href="${path}/${projeto.documentosProjeto.propostOrcamentaria.path}"
                                                 target="_blank"><i class="far fa-file-image text-primary"
                                                                    style="font-size: 56px; color: #e74c3c !important;"></i></a>
                                              <hr>
                                              <h5 class="text-center"><strong style="color: #e74c33 !important">Orçamentário</strong></h5>
                                          </div>
                                      </div>
                                    </c:if>
                                    <!-- ORÇAMENTÁRIO PENDENTE -->
                                    <c:if test="${projeto.documentosProjeto.propostOrcamentaria.status eq 'PENDENTE'}">
                                      <div class="col-lg-2 text-center mt-5">
                                          <div class="form-group">
                                              <a title="Documento em Análise" href="${path}/${projeto.documentosProjeto.propostOrcamentaria.path}"
                                                 target="_blank"><i class="far fa-file-image text-primary"
                                                                    style="font-size: 56px; color: #f39c12 !important;"></i></a>
                                              <hr>
                                              <h5 class="text-center"><strong style="color: #f39c12 !important">Orçamentário</strong></h5>
                                          </div>
                                      </div>
                                    </c:if>                                    
                                    

                                    <c:if test="${not empty projeto.documentosProjeto.dadosBancariosFundo.path}">
                                      <!-- DADOS FUNDO APROVADO -->
                                      <c:if test="${projeto.documentosProjeto.dadosBancariosFundo.status eq 'APROVADO'}">
                                        <div class="col-lg-2 text-center mt-5">
                                            <div class="form-group">
                                                <a title="Documento Aprovado" href="${path}/${projeto.documentosProjeto.dadosBancariosFundo.path}"
                                                   target="_blank"><i class="far fa-file-image text-primary"
                                                                      style="font-size: 56px;"></i></a>
                                                <hr>
                                                <h5 class="text-center"><strong style="color: #3fa733 !important">Dados Bancários do Fundo</strong></h5>
                                            </div>
                                        </div>
                                      </c:if>
                                      <!-- DADOS FUNDO NEGADO-->
                                      <c:if test="${projeto.documentosProjeto.dadosBancariosFundo.status eq 'NEGADO'}">
                                        <div class="col-lg-2 text-center mt-5">
                                            <div class="form-group">
                                                <a title="Documento Negado" href="${path}/${projeto.documentosProjeto.dadosBancariosFundo.path}"
                                                   target="_blank"><i class="far fa-file-image text-primary"
                                                                      style="font-size: 56px; color: #e74c3c !important;"></i></a>
                                                <hr>
                                                <h5 class="text-center"><strong style="color: #e74c33 !important">Dados Bancários do Fundo</strong></h5>
                                            </div>
                                        </div>
                                      </c:if>
                                      <!-- DADOS FUNDO PENDENTE-->
                                      <c:if test="${projeto.documentosProjeto.dadosBancariosFundo.status eq 'PENDENTE'}">
                                        <div class="col-lg-2 text-center mt-5">
                                            <div class="form-group">
                                                <a title="Documento em Análise" href="${path}/${projeto.documentosProjeto.dadosBancariosFundo.path}"
                                                   target="_blank"><i class="far fa-file-image text-primary"
                                                                      style="font-size: 56px; color: #f39c12 !important;"></i></a>
                                                <hr>
                                                <h5 class="text-center"><strong style="color: #f39c12 !important">Dados Bancários do Fundo</strong></h5>
                                            </div>
                                        </div>
                                      </c:if>                                       
                                    </c:if>


                                    <c:if test="${not empty projeto.documentosProjeto.certificado.path}">
                                      <!-- CERTIFICADO APROVADO -->
                                      <c:if test="${projeto.documentosProjeto.certificado.status eq 'APROVADO'}">
                                        <div class="col-lg-2 text-center mt-5">
                                            <div class="form-group">
                                                <a title="Documento Aprovado" href="${path}/${projeto.documentosProjeto.certificado.path}"
                                                   target="_blank"><i class="far fa-file-image text-primary"
                                                                      style="font-size: 56px;"></i></a>
                                                <hr>
                                                <h5 class="text-center"><strong style="color: #3fa733 !important">Certificado</strong></h5>
                                            </div>
                                        </div>
                                      </c:if>
                                      <!-- CERTIFICADO NEGADO -->
                                      <c:if test="${projeto.documentosProjeto.certificado.status eq 'NEGADO'}">
                                        <div class="col-lg-2 text-center mt-5">
                                            <div class="form-group">
                                                <a title="Documento Negado" href="${path}/${projeto.documentosProjeto.certificado.path}"
                                                   target="_blank"><i class="far fa-file-image text-primary"
                                                                      style="font-size: 56px; color: #e74c3c !important;"></i></a>
                                                <hr>
                                                <h5 class="text-center"><strong style="color: #e74c33 !important">Certificado</strong></h5>
                                            </div>
                                        </div>
                                      </c:if>
                                      <!-- CERTIFICADO PENDENTE -->
                                      <c:if test="${projeto.documentosProjeto.certificado.status eq 'PENDENTE'}">
                                        <div class="col-lg-2 text-center mt-5">
                                            <div class="form-group">
                                                <a title="Documento em Análise" href="${path}/${projeto.documentosProjeto.certificado.path}"
                                                   target="_blank"><i class="far fa-file-image text-primary"
                                                                      style="font-size: 56px; color: #f39c12 !important;"></i></a>
                                                <hr>
                                                <h5 class="text-center"><strong style="color: #f39c12 !important">Certificado</strong></h5>
                                            </div>
                                        </div>
                                      </c:if>
                                    </c:if>
                                </div>
                            </fieldset>
                        </div>
                        <div class="card-footer">
                          <button type="button" class="btn btn-primary float-right mx-1" data-toggle="modal" data-target="#modal-indicacao">
                            Indicar Projeto
                          </button>
                          <button type="button" class="btn btn-warning float-right mx-1" data-toggle="modal" data-target="#modal-ods">
                            Adicionar Selo ODS
                          </button>
                        </div>
                    </div>
                </div>

            </div>
        </div>       
        <c:import url="/WEB-INF/views/componentes/footer/painel/footer.jsp"/>        
    </div>
</div>

<!-- MODALS -->
<c:import url="/WEB-INF/views/componentes/modal/modal-alterar-senha.jsp" />
<c:import url="/WEB-INF/views/componentes/modal/modal-indicacao.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-ods.jsp"/>

<!--   JQUERY   -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<!--   POPPER   -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--   BOOTSTRAP   -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/js/bootstrap-select.min.js"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script type="text/javascript" src="${path}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0"></script>
</body>

</html>