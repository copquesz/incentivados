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
    Incentivados - Análise de Documentação
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
        <a href="#" class="simple-text logo-mini">
          <div class="logo-image-small"><i class="far fa-user"></i></div>
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
            <b><a class="navbar-brand" href="#">Entidade <i class='fas fa-angle-double-right'></i> ${entidade.nomeFantasia} <i class='fas fa-angle-double-right'></i> Documentos</a></b>
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
          <div class="col-12">
            <div class="card">
              <div class="card-header "> 
                <h5 class="card-title">Análise de Documentação</h5>  
              </div>
              <form action="${path}/painel/entidades/${entidade.id}/documentos/analise" method="post"  acceptcharset="UTF-8" id="formulario-analise-documentos-entidade">  
                <input type="hidden" name="id" value="${entidade.documentosEntidade.id}">                           
                <div class="card-body">
                  <div class="row">
                    <div class="col-12">                    
                      <!-- EXIBE A LISTA DE DOCUMENTOS -->                       
                      <div class="row justify-content-start">
                        <div class="col-12">
                          <div class="table-responsive">
                            <table class="table">
                              <thead class=" text-primary">                                
                                <th class="border text-center">#</th>
                                <th class="border text-center">Tipo</th>
                                <th class="border text-center">Status</th>                                
                              </thead>
                              <tbody>                                
                                 
                                <c:if test="${not empty entidade.documentosEntidade.logo.path}">  
                                <input type="hidden" name="logo.id" value="${entidade.documentosEntidade.logo.id}">
                                <input type="hidden" name="logo.path" value="${entidade.documentosEntidade.logo.path}">
                                  <tr>                                      
                                    <td class="border text-center">${entidade.documentosEntidade.logo.id}</td>
                                    <c:if test="${entidade.documentosEntidade.logo.status eq 'PENDENTE'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.logo.path}" target="_blank" class="btn btn-warning btn-sm text-white" title="Visualizar">Logo</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-logo" name="logo.status" type="radio" value="APROVADO" checked><label for="checkbox-logo">APROVADO</label>
                                          <input id="checkbox-logo" name="logo.status" type="radio" value="NEGADO" style="margin-left: 10%;"><label for="checkbox-logo">NEGADO</label>
                                      </td>   
                                    </c:if>
                                    <c:if test="${entidade.documentosEntidade.logo.status eq 'APROVADO'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.logo.path}" target="_blank" class="btn btn-primary btn-sm text-white" title="Visualizar">Logo</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-logo" name="logo.status" type="radio" value="APROVADO" checked><label for="checkbox-logo">APROVADO</label>
                                          <input id="checkbox-logo" name="logo.status" type="radio" value="NEGADO" style="margin-left: 10%;"><label for="checkbox-logo">NEGADO</label>
                                      </td> 
                                    </c:if>
                                    <c:if test="${entidade.documentosEntidade.logo.status eq 'NEGADO'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.logo.path}" target="_blank" class="btn btn-danger btn-sm text-white" title="Visualizar">Logo</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-logo" name="logo.status" type="radio" value="APROVADO" checked><label for="checkbox-logo">APROVADO</label>
                                          <input id="checkbox-logo" name="logo.status" type="radio" value="NEGADO" checked style="margin-left: 10%;"><label for="checkbox-logo">NEGADO</label>
                                      </td> 
                                    </c:if>                                                                                                          
                                  </tr>
                                </c:if> 
                                
                                <c:if test="${not empty entidade.documentosEntidade.ataEleicao.path}">  
                                <input type="hidden" name="ataEleicao.id" value="${entidade.documentosEntidade.ataEleicao.id}">
                                <input type="hidden" name="ataEleicao.path" value="${entidade.documentosEntidade.ataEleicao.path}">
                                  <tr>                                      
                                    <td class="border text-center">${entidade.documentosEntidade.ataEleicao.id}</td>
                                    <c:if test="${entidade.documentosEntidade.ataEleicao.status eq 'PENDENTE'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.ataEleicao.path}" target="_blank" class="btn btn-warning btn-sm text-white" title="Visualizar">Ata de Eleição</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-ata-eleicao" name="ataEleicao.status" type="radio" value="APROVADO" checked><label for="checkbox-ata-eleicao">APROVADO</label>
                                          <input id="checkbox-ata-eleicao" name="ataEleicao.status" type="radio" value="NEGADO" style="margin-left: 10%;"><label for="checkbox-ata-eleicao">NEGADO</label>
                                      </td>   
                                    </c:if>
                                    <c:if test="${entidade.documentosEntidade.ataEleicao.status eq 'APROVADO'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.ataEleicao.path}" target="_blank" class="btn btn-primary btn-sm text-white" title="Visualizar">Ata de Eleição</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-ata-eleicao" name="ataEleicao.status" type="radio" value="APROVADO" checked><label for="checkbox-ata-eleicao">APROVADO</label>
                                          <input id="checkbox-ata-eleicao" name="ataEleicao.status" type="radio" value="NEGADO" style="margin-left: 10%;"><label for="checkbox-ata-eleicao">NEGADO</label>
                                      </td> 
                                    </c:if>
                                    <c:if test="${entidade.documentosEntidade.ataEleicao.status eq 'NEGADO'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.ataEleicao.path}" target="_blank" class="btn btn-danger btn-sm text-white" title="Visualizar">Ata de Eleição</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-ata-eleicao" name="ataEleicao.status" type="radio" value="APROVADO"><label for="checkbox-ata-eleicao">APROVADO</label>
                                          <input id="checkbox-ata-eleicao" name="ataEleicao.status" type="radio" value="NEGADO" checked style="margin-left: 10%;"><label for="checkbox-ata-eleicao">NEGADO</label>
                                      </td> 
                                    </c:if>                                                                                                          
                                  </tr>
                                </c:if>
                                
                                <c:if test="${not empty entidade.documentosEntidade.estatutoSocial.path}"> 
                                <input type="hidden" name="estatutoSocial.id" value="${entidade.documentosEntidade.estatutoSocial.id}">
                                <input type="hidden" name="estatutoSocial.path" value="${entidade.documentosEntidade.estatutoSocial.path}">
                                  <tr>                                      
                                    <td class="border text-center">${entidade.documentosEntidade.estatutoSocial.id}</td>
                                    <c:if test="${entidade.documentosEntidade.estatutoSocial.status eq 'PENDENTE'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.estatutoSocial.path}" target="_blank" class="btn btn-warning btn-sm text-white" title="Visualizar">Estatuto Social / Contrato Social</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-estatuto-social" name="estatutoSocial.status" type="radio" value="APROVADO" checked><label for="checkbox-estatuto-social">APROVADO</label>
                                          <input id="checkbox-estatuto-social" name="estatutoSocial.status" type="radio" value="NEGADO" style="margin-left: 10%;"><label for="checkbox-estatuto-social">NEGADO</label>
                                      </td>   
                                    </c:if>
                                    <c:if test="${entidade.documentosEntidade.estatutoSocial.status eq 'APROVADO'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.estatutoSocial.path}" target="_blank" class="btn btn-primary btn-sm text-white" title="Visualizar">Estatuto Social / Contrato Social</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-estatuto-social" name="estatutoSocial.status" type="radio" value="APROVADO" checked><label for="checkbox-estatuto-social">APROVADO</label>
                                          <input id="checkbox-estatuto-social" name="estatutoSocial.status" type="radio" value="NEGADO" style="margin-left: 10%;"><label for="checkbox-estatuto-social">NEGADO</label>
                                      </td> 
                                    </c:if>
                                    <c:if test="${entidade.documentosEntidade.estatutoSocial.status eq 'NEGADO'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.estatutoSocial.path}" target="_blank" class="btn btn-danger btn-sm text-white" title="Visualizar">Estatuto Social / Contrato Social</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-estatuto-social" name="estatutoSocial.status" type="radio" value="APROVADO"><label for="checkbox-estatuto-social">APROVADO</label>
                                          <input id="checkbox-estatuto-social" name="estatutoSocial.status" type="radio" value="NEGADO" checked style="margin-left: 10%;"><label for="checkbox-estatuto-social">NEGADO</label>
                                      </td> 
                                    </c:if>                                                                                                          
                                  </tr>
                                </c:if>

                                <c:if test="${not empty entidade.documentosEntidade.identidade.path}">     
                                <input type="hidden" name="identidade.id" value="${entidade.documentosEntidade.identidade.id}">
                                <input type="hidden" name="identidade.path" value="${entidade.documentosEntidade.identidade.path}">
                                  <tr>                                      
                                    <td class="border text-center">${entidade.documentosEntidade.identidade.id}</td>
                                    <c:if test="${entidade.documentosEntidade.identidade.status eq 'PENDENTE'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.identidade.path}" target="_blank" class="btn btn-warning btn-sm text-white" title="Visualizar">Identidade Presidente</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-identidade" name="identidade.status" type="radio" value="APROVADO" checked><label for="checkbox-identidade">APROVADO</label>
                                          <input id="checkbox-identidade" name="identidade.status" type="radio" value="NEGADO" style="margin-left: 10%;"><label for="checkbox-identidade">NEGADO</label>
                                      </td>   
                                    </c:if>
                                    <c:if test="${entidade.documentosEntidade.identidade.status eq 'APROVADO'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.identidade.path}" target="_blank" class="btn btn-primary btn-sm text-white" title="Visualizar">Identidade Presidente</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-identidade" name="identidade.status" type="radio" value="APROVADO" checked><label for="checkbox-identidade">APROVADO</label>
                                          <input id="checkbox-identidade" name="identidade.status" type="radio" value="NEGADO" style="margin-left: 10%;"><label for="checkbox-identidade">NEGADO</label>
                                      </td> 
                                    </c:if>
                                    <c:if test="${entidade.documentosEntidade.identidade.status eq 'NEGADO'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.identidade.path}" target="_blank" class="btn btn-danger btn-sm text-white" title="Visualizar">Identidade Presidente</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-identidade" name="identidade.status" type="radio" value="APROVADO"><label for="checkbox-identidade">APROVADO</label>
                                          <input id="checkbox-identidade" name="identidade.status" type="radio" value="NEGADO" checked style="margin-left: 10%;"><label for="checkbox-identidade">NEGADO</label>
                                      </td> 
                                    </c:if>                                                                                                          
                                  </tr>
                                </c:if>

                                <c:if test="${not empty entidade.documentosEntidade.cartaoCnpj.path}">   
                                <input type="hidden" name="cartaoCnpj.id" value="${entidade.documentosEntidade.cartaoCnpj.id}">
                                <input type="hidden" name="cartaoCnpj.path" value="${entidade.documentosEntidade.cartaoCnpj.path}">
                                  <tr>                                      
                                    <td class="border text-center">${entidade.documentosEntidade.cartaoCnpj.id}</td>
                                    <c:if test="${entidade.documentosEntidade.cartaoCnpj.status eq 'PENDENTE'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.cartaoCnpj.path}" target="_blank" class="btn btn-warning btn-sm text-white" title="Visualizar">Cartão CNPJ</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-cartao-cnpj" name="cartaoCnpj.status" type="radio" value="APROVADO" checked><label for="checkbox-cartao-cnpj">APROVADO</label>
                                          <input id="checkbox-cartao-cnpj" name="cartaoCnpj.status" type="radio" value="NEGADO" style="margin-left: 10%;"><label for="checkbox-cartao-cnpj">NEGADO</label>
                                      </td>   
                                    </c:if>
                                    <c:if test="${entidade.documentosEntidade.cartaoCnpj.status eq 'APROVADO'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.cartaoCnpj.path}" target="_blank" class="btn btn-primary btn-sm text-white" title="Visualizar">Cartão CNPJ</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-cartao-cnpj" name="cartaoCnpj.status" type="radio" value="APROVADO" checked><label for="checkbox-cartao-cnpj">APROVADO</label>
                                          <input id="checkbox-cartao-cnpj" name="cartaoCnpj.status" type="radio" value="NEGADO" style="margin-left: 10%;"><label for="checkbox-cartao-cnpj">NEGADO</label>
                                      </td> 
                                    </c:if>
                                    <c:if test="${entidade.documentosEntidade.cartaoCnpj.status eq 'NEGADO'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.cartaoCnpj.path}" target="_blank" class="btn btn-danger btn-sm text-white" title="Visualizar">Cartão CNPJ</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-cartao-cnpj" name="cartaoCnpj.status" type="radio" value="APROVADO"><label for="checkbox-cartao-cnpj">APROVADO</label>
                                          <input id="checkbox-cartao-cnpj" name="cartaoCnpj.status" type="radio" value="NEGADO" checked style="margin-left: 10%;"><label for="checkbox-cartao-cnpj">NEGADO</label>
                                      </td> 
                                    </c:if>                                                                                                          
                                  </tr>
                                </c:if>
                                
                                <c:if test="${not empty entidade.documentosEntidade.dadosBancarios.path}">
                                <input type="hidden" name="dadosBancarios.id" value="${entidade.documentosEntidade.dadosBancarios.id}">
                                <input type="hidden" name="dadosBancarios.path" value="${entidade.documentosEntidade.dadosBancarios.path}">
                                  <tr>                                      
                                    <td class="border text-center">${entidade.documentosEntidade.dadosBancarios.id}</td>
                                    <c:if test="${entidade.documentosEntidade.dadosBancarios.status eq 'PENDENTE'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.dadosBancarios.path}" target="_blank" class="btn btn-warning btn-sm text-white" title="Visualizar">Dados Bancários</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-dados-bancarios" name="dadosBancarios.status" type="radio" value="APROVADO" checked><label for="checkbox-dados-bancarios">APROVADO</label>
                                          <input id="checkbox-dados-bancarios" name="dadosBancarios.status" type="radio" value="NEGADO" style="margin-left: 10%;"><label for="checkbox-dados-bancarios">NEGADO</label>
                                      </td>   
                                    </c:if>
                                    <c:if test="${entidade.documentosEntidade.dadosBancarios.status eq 'APROVADO'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.dadosBancarios.path}" target="_blank" class="btn btn-primary btn-sm text-white" title="Visualizar">Dados Bancários</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-dados-bancarios" name="dadosBancarios.status" type="radio" value="APROVADO" checked><label for="checkbox-dados-bancarios">APROVADO</label>
                                          <input id="checkbox-dados-bancarios" name="dadosBancarios.status" type="radio" value="NEGADO" style="margin-left: 10%;"><label for="checkbox-dados-bancarios">NEGADO</label>
                                      </td> 
                                    </c:if>
                                    <c:if test="${entidade.documentosEntidade.dadosBancarios.status eq 'NEGADO'}">
                                      <td class="border text-center"><a href="${path}/${entidade.documentosEntidade.dadosBancarios.path}" target="_blank" class="btn btn-danger btn-sm text-white" title="Visualizar">Dados Bancários</a></td>
                                      <td class="border text-center">
                                          <input id="checkbox-dados-bancarios" name="dadosBancarios.status" type="radio" value="APROVADO"><label for="checkbox-dados-bancarios">APROVADO</label>
                                          <input id="checkbox-dados-bancarios" name="dadosBancarios.status" type="radio" value="NEGADO" checked style="margin-left: 10%;"><label for="checkbox-dados-bancarios">NEGADO</label>
                                      </td> 
                                    </c:if>                                                                                                          
                                  </tr>
                                </c:if> 

                              </tbody>
                            </table>
                          </div>      
                        </div>        
                      </div> 
                      <div class="row" id="campo-parecer">
                        <div class="col-12">
                          <div class="form-group">
                            <input type="hidden" name="analista.id" value="${analista.id}">
                            <label>Parecer:</label>
                            <textarea class="form-control text-justify" name="analise" rows="10" maxlength="3000" placeholder="Descreva sua o motivo pelo qual o(s) documento(s) está sendo negado ..."></textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-12">
                          <button type="submit" class="btn btn-primary float-right">Enviar <i class="far fa-share-square"></i></button>
                          <a href="${path}/painel/dashboard" class="btn btn-danger float-right"><i class="fas fa-angle-double-left"></i> Voltar</a>
                        </div>
                      </div>                   
                    </div>     
                  </div>
                </div>
              </form>
              <div class="card-footer"></div>
            </div>
          </div>          
        </div>         
      </div>
      <c:import url="/WEB-INF/views/componentes/footer/painel/footer.jsp" />
    </div>
  </div>

  <!-- MODALS -->
  <c:import url="/WEB-INF/views/componentes/modal/modal-alterar-senha.jsp" />

  <!--   JQUERY   -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <!--   POPPER   -->  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <!--   BOOTSTRAP   -->  
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>  
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script type="text/javascript" src="${path}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <script type="text/javascript" src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0"></script>  

  <script type="text/javascript">
    $(document).ready(function () {

      // Variáveis globais
      let campo_parecer = $('#campo-parecer');   
      campo_parecer.hide();

      $("#formulario-analise-documentos-entidade").change(function(){
        
          if($("input[name='logo.status']:checked").val() == 'NEGADO' || $("input[name='ataEleicao.status']:checked").val() == 'NEGADO' || $("input[name='estatutoSocial.status']:checked").val() == 'NEGADO' || $("input[name='identidade.status']:checked").val() == 'NEGADO' || $("input[name='cartaoCnpj.status']:checked").val() == 'NEGADO' || $("input[name='dadosBancarios.status']:checked").val() == 'NEGADO')
            campo_parecer.show()
          else{
            campo_parecer.hide();
          }
          
        
      });
    });
  </script>

</body>

</html>