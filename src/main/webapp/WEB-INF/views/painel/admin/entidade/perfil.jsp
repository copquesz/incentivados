<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html lang="pt-br">

<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        Incentivados - ${entidade.nomeFantasia}
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
        <li class="active">
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
            <i class="far fa-chart-bar"></i>Ranking</a>
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
            <b><a class="navbar-brand" href="#">Entidade <i class='fas fa-angle-double-right'></i> ${entidade.nomeFantasia}</a></b>
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
              <div class="row mt-3">
                  <div class="col-md-3 text-center">
                      <figure class="figure">
                          <img src="${path}/${entidade.documentosEntidade.logo.path}" width="200" />
                      </figure>
                  </div>
                  <div class="col-md-9 text-md-left text-center">
                      <h2 class="mt-3 ml-3 bold text-primary">${entidade.nomeFantasia}</h2>
                      <p class="lead text-justify p-3">${entidade.sobre}</p>
                  </div>
              </div>
              <fieldset class="mt-5">
                  <legend class="text-primary">Informações Gerais:</legend>
                  <hr class="bg-primary">
                  <div class="row mt-3">
                    <div class="col-md-4">
                      <div class="form-group">
                          <label>Responsável:</label>                                        
                          <input type="text" class="form-control" value="${entidade.usuario.nome} ${entidade.usuario.sobrenome}" readonly>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-group">
                          <label>E-mail:</label>                                        
                          <input type="text" class="form-control" value="${entidade.usuario.email}" readonly>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-group">
                          <label>Telefone:</label>                                        
                          <input type="text" class="form-control" value="${entidade.usuario.telefone}" readonly>
                      </div>
                    </div>
                  </div>
                  <div class="row mt-3">
                      <div class="col-md-4">
                          <div class="form-group">
                              <label>Data/Hora Cadastro:</label>
                              <fmt:formatDate type="both" dateStyle="short" timeStyle="short"
                                              value="${entidade.dataCadastro}" var="dataCadastro"/>
                              <input type="text" class="form-control" value="${dataCadastro}" readonly>
                          </div>
                      </div>
                      <div class="col-md-4">
                          <div class="form-group">
                              <label>Razão Social:</label>
                              <input type="text" class="form-control" value="${entidade.razaoSocial}"
                                     readonly>
                          </div>
                      </div>
                      <div class="col-md-4">
                          <div class="form-group">
                              <label>CNPJ:</label>
                              <input type="text" class="form-control" value="${entidade.cnpj}" readonly>
                          </div>
                      </div>
                  </div>
                  <div class="row mt-5">
                      <div class="col-md-7">
                          <div class="form-group">
                              <label>Logradouro:</label>
                              <input type="text" class="form-control"
                                     value="${entidade.endereco.logradouro}" readonly>
                          </div>
                      </div>
                      <div class="col-md-2">
                          <div class="form-group">
                              <label>Nº:</label>
                              <input type="text" class="form-control" value="${entidade.endereco.numero}"
                                     readonly>
                          </div>
                      </div>
                      <div class="col-md-3">
                          <div class="form-group">
                              <label>Complemento:</label>
                              <input type="text" class="form-control"
                                     value="${entidade.endereco.complemento}" placeholder="Não Informado"
                                     readonly>
                          </div>
                      </div>
                  </div>
                  <div class="row">
                      <div class="col-md-3">
                          <div class="form-group">
                              <label>Cep:</label>
                              <input type="text" class="form-control" value="${entidade.endereco.cep}"
                                     readonly>
                          </div>
                      </div>
                      <div class="col-md-3">
                          <div class="form-group">
                              <label>Bairro:</label>
                              <input type="text" class="form-control" value="${entidade.endereco.bairro}"
                                     readonly>
                          </div>
                      </div>
                      <div class="col-md-3">
                          <div class="form-group">
                              <label>Cidade</label>
                              <input type="text" class="form-control" value="${entidade.endereco.cidade}"
                                     readonly>
                          </div>
                      </div>
                      <div class="col-md-3">
                          <div class="form-group">
                              <label>Estado:</label>
                              <input type="text" class="form-control" value="${entidade.endereco.estado}"
                                     readonly>
                          </div>
                      </div>
                  </div>
              </fieldset>

              <fieldset class="mt-5">
                <legend class="text-primary">Projetos:</legend>
                  <c:if test = "${empty projetos.content}">
                    <div class="alert alert-info mt-3" role="alert">
                      <p class="text-bold">Não há projeto(s) cadastrado(s).</p>
                    </div>
                  </c:if>
                  <c:if test = "${not empty projetos.content}"> 
                    <div class="row justify-content-start">
                      <c:forEach var="projeto" items="${projetos.content}">
                        <div class="col-12 col-xl-3 col-lg-6 col-md-6 d-flex align-items-stretch bd-highlight">
                          <div class="card border align-self-stretch flex-fill bd-highlight mt-3">
                            <img src="${path}/${projeto.documentosProjeto.logo.path}" class="card-img-top img-fluid" alt="..." style="max-height: 200px;">
                            <div class="card-body">
                              <h5 class="card-title" style="font-weight: bold;">
                                <c:choose> 
                                  <c:when test = "${fn:length(projeto.titulo) > 30}">
                                    ${fn:substring(projeto.titulo, 0, 30)} ...
                                  </c:when>
                                  <c:otherwise>  
                                    ${projeto.titulo}
                                  </c:otherwise>
                                </c:choose>
                              </h5>
                              <hr>
                              <p class="card-text text-justify">${fn:substring(projeto.objetivo, 0, 180)} ...</p>
                            </div>
                            <div class="card-footer">
                              <a href="${path}/painel/projetos/${projeto.id}" class="btn btn-primary">Ver Detalhes</a>
                            </div>
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                  </c:if>
              </fieldset>

              <fieldset class="mt-5">
                  <legend class="text-primary">Documentação:</legend>
                  <div class="row">
                    <div class="col-12">

                      <c:choose>                        
                        <c:when test = "${entidade.documentosEntidade.logo.status eq 'APROVADO' && entidade.documentosEntidade.ataEleicao.status eq 'APROVADO' && entidade.documentosEntidade.estatutoSocial.status eq 'APROVADO' && entidade.documentosEntidade.identidade.status eq 'APROVADO' && entidade.documentosEntidade.cartaoCnpj.status eq 'APROVADO' && entidade.documentosEntidade.dadosBancarios.status eq 'APROVADO' &&  entidade.documentosEntidade.ataEleicao.status eq 'NAO_SE_APLICA'}">
                          <div class="alert alert-success" role="alert">
                            <small><strong><i class="far fa-check-circle"></i> A documentação está aprovada.</strong></small>
                          </div>
                        </c:when>                        
                        <c:when test = "${entidade.documentosEntidade.logo.status eq 'APROVADO' && entidade.documentosEntidade.estatutoSocial.status eq 'APROVADO' && entidade.documentosEntidade.identidade.status eq 'APROVADO' && entidade.documentosEntidade.cartaoCnpj.status eq 'APROVADO' && entidade.documentosEntidade.dadosBancarios.status eq 'APROVADO' && empty entidade.documentosEntidade.ataEleicao.path}">
                          <div class="alert alert-success" role="alert">
                            <small><strong><i class="far fa-check-circle"></i> A documentação está aprovada.</strong></small>
                          </div>
                        </c:when>                        
                        <c:when test = "${entidade.documentosEntidade.logo.status eq 'NEGADO'|| entidade.documentosEntidade.ataEleicao.status eq 'NEGADO'|| entidade.documentosEntidade.estatutoSocial.status eq 'NEGADO'|| entidade.documentosEntidade.identidade.status eq 'NEGADO'|| entidade.documentosEntidade.cartaoCnpj.status eq 'NEGADO'|| entidade.documentosEntidade.dadosBancarios.status eq 'NEGADO' && not empty entidade.documentosEntidade.ataEleicao.path}">
                          <div class="alert alert-danger" role="alert">
                            <small><strong><i class="far fa-times-circle"></i> A documentação possui arquivo(s) negado(s).</small>
                          </div>
                        </c:when>                        
                        <c:when test = "${entidade.documentosEntidade.logo.status eq 'NEGADO' || entidade.documentosEntidade.estatutoSocial.status eq 'NEGADO'|| entidade.documentosEntidade.identidade.status eq 'NEGADO'|| entidade.documentosEntidade.cartaoCnpj.status eq 'NEGADO'|| entidade.documentosEntidade.dadosBancarios.status eq 'NEGADO' && empty entidade.documentosEntidade.ataEleicao.path}">
                          <div class="alert alert-danger" role="alert">
                            <small><strong><i class="far fa-times-circle"></i> A documentação possui arquivo(s) negado(s).</small>
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
                    <c:if test="${entidade.documentosEntidade.logo.status eq 'APROVADO'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento Aprovado" href="${path}/${entidade.documentosEntidade.logo.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px;"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #3fa733 !important">Logo</strong></h5>
                          </div>
                      </div>
                    </c:if>
                    <!-- LOGO NEGADO -->
                    <c:if test="${entidade.documentosEntidade.logo.status eq 'NEGADO'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento Negado" href="${path}/${entidade.documentosEntidade.logo.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px; color: #e74c3c !important;"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #e74c33 !important">Logo</strong></h5>
                          </div>
                      </div>
                    </c:if>
                    <!-- LOGO PENDENTE -->
                    <c:if test="${entidade.documentosEntidade.logo.status eq 'PENDENTE'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento em Análise" href="${path}/${entidade.documentosEntidade.logo.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px; color: #f39c12 !important;"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #f39c12 !important">Logo</strong></h5>
                          </div>
                      </div>
                    </c:if>

                    <!-- ATA DE ELEIÇÃO APROVADO -->
                    <c:if test="${not empty entidade.documentosEntidade.ataEleicao.path}">
                      <c:if test="${entidade.documentosEntidade.ataEleicao.status eq 'APROVADO'}">
                        <div class="col-lg-2 text-center mt-5">
                            <div class="form-group">
                                <a title="Documento Aprovado" href="${path}/${entidade.documentosEntidade.ataEleicao.path}"
                                   target="_blank"><i class="far fa-file-image text-primary"
                                                      style="font-size: 56px;"></i></a>
                                <hr>
                                <h5 class="text-center"><strong style="color: #3fa733 !important">Ata de Eleição</strong></h5>
                            </div>
                        </div>
                      </c:if>
                      <!-- ATA DE ELEIÇÃO NEGADO -->
                      <c:if test="${entidade.documentosEntidade.ataEleicao.status eq 'NEGADO'}">
                        <div class="col-lg-2 text-center mt-5">
                            <div class="form-group">
                                <a type="Documento Negado" href="${path}/${entidade.documentosEntidade.ataEleicao.path}"
                                   target="_blank"><i class="far fa-file-image text-primary"
                                                      style="font-size: 56px; color: #e74c3c !important"></i></a>
                                <hr>
                                <h5 class="text-center"><strong style="color: #e74c3c !important">Ata de Eleição</strong></h5>
                            </div>
                        </div>
                      </c:if>
                      <!-- ATA DE ELEIÇÃO PENDENTE -->
                      <c:if test="${entidade.documentosEntidade.ataEleicao.status eq 'PENDENTE'}">
                        <div class="col-lg-2 text-center mt-5">
                            <div class="form-group">
                                <a title="Documento em Análise" href="${path}/${entidade.documentosEntidade.ataEleicao.path}"
                                   target="_blank"><i class="far fa-file-image text-primary"
                                                      style="font-size: 56px; color: #f39c12 !important"></i></a>
                                <hr>
                                <h5 class="text-center"><strong style="color: #f39c12 !important">Ata de Eleição</strong></h5>
                            </div>
                        </div>
                      </c:if>
                    </c:if>

                    <!-- ESTATUTO SOCIAL APROVADO -->
                    <c:if test="${entidade.documentosEntidade.estatutoSocial.status eq 'APROVADO'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento Aprovado" href="${path}/${entidade.documentosEntidade.estatutoSocial.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px;"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #3fa733 !important">Estatuto Social ou Contrato Social</strong></h5>
                          </div>
                      </div>
                    </c:if>
                    <!-- ESTATUTO SOCIAL NEGADO -->
                    <c:if test="${entidade.documentosEntidade.estatutoSocial.status eq 'NEGADO'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento Negado" href="${path}/${entidade.documentosEntidade.estatutoSocial.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px; color: #e74c3c !important"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #e74c3c !important">Estatuto Social ou Contrato Social</strong></h5>
                          </div>
                      </div>
                    </c:if>
                    <!-- ESTATUTO SOCIAL PENDENTE -->
                    <c:if test="${entidade.documentosEntidade.estatutoSocial.status eq 'PENDENTE'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento em Análise" href="${path}/${entidade.documentosEntidade.estatutoSocial.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px; color: #f39c12 !important"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #f39c12 !important">Estatuto Social ou Contrato Social</strong></h5>
                          </div>
                      </div>
                    </c:if>

                    <!-- IDENTIDADE PRESIDENTE APROVADO -->
                    <c:if test="${entidade.documentosEntidade.identidade.status eq 'APROVADO'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento Aprovado" href="${path}/${entidade.documentosEntidade.identidade.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px;"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #3fa733 !important">Identidade Presidente</strong></h5>
                          </div>
                      </div>
                    </c:if>
                    <!-- IDENTIDADE PRESIDENTE NEGADO -->
                    <c:if test="${entidade.documentosEntidade.identidade.status eq 'NEGADO'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento Negado" href="${path}/${entidade.documentosEntidade.identidade.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px; color: #e74c3c !important"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #e74c3c !important">Identidade Presidente</strong></h5>
                          </div>
                      </div>
                    </c:if>
                    <!-- IDENTIDADE PENDENTE -->
                    <c:if test="${entidade.documentosEntidade.identidade.status eq 'PENDENTE'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento em Análise" href="${path}/${entidade.documentosEntidade.identidade.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px; color: #f39c12 !important"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #f39c12 !important">Identidade Presidente</strong></h5>
                          </div>
                      </div>
                    </c:if>

                    <!-- CARTÃO CNPJ APROVADO -->
                    <c:if test="${entidade.documentosEntidade.cartaoCnpj.status eq 'APROVADO'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento Aprovado" href="${path}/${entidade.documentosEntidade.cartaoCnpj.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px;"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #3fa733 !important">Cartão CNPJ</strong></h5>
                          </div>
                      </div>
                    </c:if>
                    <!-- CARTÃO CNPJ NEGADO -->
                    <c:if test="${entidade.documentosEntidade.cartaoCnpj.status eq 'NEGADO'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento Negado" href="${path}/${entidade.documentosEntidade.cartaoCnpj.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px; color: #e74c3c !important"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #e74c3c !important">Cartão CNPJ</strong></h5>
                          </div>
                      </div>
                    </c:if>
                    <!-- CARTÃO CNPJ PENDENTE -->
                    <c:if test="${entidade.documentosEntidade.cartaoCnpj.status eq 'PENDENTE'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento em Análise" href="${path}/${entidade.documentosEntidade.cartaoCnpj.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px; color: #f39c12 !important"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #f39c12 !important">Cartão CNPJ</strong></h5>
                          </div>
                      </div>
                    </c:if>

                     <!-- DADOS BANCÁRIOS APROVADO -->
                    <c:if test="${entidade.documentosEntidade.dadosBancarios.status eq 'APROVADO'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento Aprovado" href="${path}/${entidade.documentosEntidade.dadosBancarios.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px;"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #3fa733 !important">Dados Bancários</strong></h5>
                          </div>
                      </div>
                    </c:if>
                    <!-- DADOS BANCÁRIOS NEGADO -->
                    <c:if test="${entidade.documentosEntidade.dadosBancarios.status eq 'NEGADO'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento Negado" href="${path}/${entidade.documentosEntidade.dadosBancarios.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px; color: #e74c3c !important"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #e74c3c !important">Dados Bancários</strong></h5>
                          </div>
                      </div>
                    </c:if>
                    <!-- DADOS BANCÁRIOS PENDENTE -->
                    <c:if test="${entidade.documentosEntidade.dadosBancarios.status eq 'PENDENTE'}">
                      <div class="col-lg-2 text-center mt-5">
                          <div class="form-group">
                              <a title="Documento em Análise" href="${path}/${entidade.documentosEntidade.dadosBancarios.path}"
                                 target="_blank"><i class="far fa-file-image text-primary"
                                                    style="font-size: 56px; color: #f39c12 !important"></i></a>
                              <hr>
                              <h5 class="text-center"><strong style="color: #f39c12 !important">Dados Bancários</strong></h5>
                          </div>
                      </div>
                    </c:if>                     
                    
                  </div>
              </fieldset>
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
<c:import url="/WEB-INF/views/componentes/modal/modal-alterar-senha.jsp" />

<!--   JQUERY   -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!--   POPPER   -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--   BOOTSTRAP   -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script type="text/javascript" src="${path}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0"></script>
</body>

</html>