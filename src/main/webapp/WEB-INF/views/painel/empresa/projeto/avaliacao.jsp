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
  <meta content='width=device-width, initial-scale=2.5, maximum-scale=2.5, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     FONTAWESOME     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet"/>
  <link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" rel="stylesheet">
  <!--     BOOTSTRAP     -->
  <link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/css/bootstrap-select.min.css" rel="stylesheet">
  <!--     CUSTOM     -->
  <link href="${path}/assets/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
  <link href="${path}/assets/css/style.css" rel="stylesheet" />
  <style type="text/css">
    .label-quest{
      font-size: 1.05rem !important;
    }
  </style>
</head>

<body class="">
<div class="wrapper ">
  <!-- Sidebar -->
  <div class="sidebar" data-color="grey" data-active-color="white">
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
        <li>
          <a href="${path}/documentos/manual-do-usuario.pdf" target="_blank">
            <i class="far fa-question-circle"></i>Tutorial
          </a>
        </li>
        <li>
            <a href="${path}/painel/ranking"><i class="far fa-chart-bar"></i>Ranking</a>
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
          <b><a class="navbar-brand" href="#">Projetos <i class='fas fa-angle-double-right'></i> Avaliação</a> </b>
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
                <p><span class="d-lg-none d-md-block">Ações</span></p>
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
              <form action="${path}/painel/projetos/avaliacao/${projeto.id}" method="post" enctype="multipart/form-data" acceptcharset="UTF-8"> 
              <input type="hidden" name="tipoAvaliacao" value="INSTITUCIONAL">   
              <input type="hidden" name="analista" value="${usuario.id}">             
                <div class="accordion" id="accordionExample">
                  <div class="card">
                    <div class="card-header bg-info" id="headingOne">
                      <h5 class="mb-0">
                        <button class="btn btn-info" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                          Projeto Técnico <i class="fas fa-angle-down mx-2"></i>
                        </button>
                      </h5>
                    </div>
                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                      <div class="card-body">
                        <div class="row my-3">
                          <div class="col-12">
                            <div class="form-group">
                              <label for="projeto-tecnico-01" class="label-quest">1) A proposta técnica está bem elaborada e apresenta objetivos, metas e indicadores consistentes?</label>
                              <select class="form-control" id="projeto-tecnico-01" name="notas">
                                <option value="2.5">Não</option>
                                <option value="10.0">Sim</option>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="row my-3">
                          <div class="col-12">
                            <div class="form-group">
                              <label for="projeto-tecnico-02" class="label-quest">2) A proposta técnica apresenta um cronograma de execução coerente com os desafios, objetivos e metas apresentados?</label>
                              <select class="form-control" id="projeto-tecnico-02" name="notas">
                                <option value="2.5">Não</option>
                                <option value="10.0">Sim</option>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="row my-3">
                          <div class="col-12">
                            <div class="form-group">
                              <label for="projeto-tecnico-03" class="label-quest">3) A proposta técnica apresenta  um orçamento estruturado e consistente frente ao escopo das ações e impactos propostos?</label>
                              <select class="form-control" id="projeto-tecnico-03" name="notas">
                                <option value="2.5">Não</option>
                                <option value="10.0">Sim</option>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="row my-3">
                          <div class="col-12">
                            <div class="form-group">
                              <label for="projeto-tecnico-04" class="label-quest">4) A proposta técnica explicita em termos mensuráveis o número de beneficiários diretos, indiretos que serão impactados pela ação?</label>
                              <select class="form-control" id="projeto-tecnico-04" name="notas">
                                <option value="2.5">Não</option>
                                <option value="10.0">Sim</option>
                              </select>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-header bg-info" id="headingTwo">
                      <h5 class="mb-0">
                        <button class="btn btn-info collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                          Estratégias Corporativas <i class="fas fa-angle-down mx-2"></i>
                        </button>
                      </h5>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                      <div class="card-body">
                        <div class="row my-3">
                          <div class="col-12">
                            <div class="form-group">
                              <label for="estrategias-corporativas-01" class="label-quest">1) Tecnicamente a proposta está alinhada aos objetivos do negócio e propósito da empresa incentivadora?</label>
                              <select class="form-control" id="estrategias-corporativas-01" name="notas">
                                <option value="2.5">Não</option>
                                <option value="10.0">Sim</option>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="row my-3">
                          <div class="col-12">
                            <div class="form-group">
                              <label for="estrategias-corporativas-02" class="label-quest">2) O projeto ao ser executado beneficia direta ou indiretamente os stakeholders relevantes para a empresa incentivadora?</label>
                              <select class="form-control" id="estrategias-corporativas-02" name="notas">
                                <option value="2.5">Não</option>
                                <option value="10.0">Sim</option>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="row my-3">
                          <div class="col-12">
                            <div class="form-group">
                              <label for="estrategias-corporativas-03" class="label-quest">3) O projeto contribuir para o fortalecimento da marca da empresa?</label>
                              <select class="form-control" id="estrategias-corporativas-03" name="notas">
                                <option value="2.5">Não</option>
                                <option value="10.0">Sim</option>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="row my-3">
                          <div class="col-12">
                            <div class="form-group">
                              <label for="estrategias-corporativas-04" class="label-quest">4) O projeto contribui para o fortalecimento da cultura organizacional (coerência interna) da empresa?</label>
                              <select class="form-control" id="estrategias-corporativas-04" name="notas">
                                <option value="2.5">Não</option>
                                <option value="10.0">Sim</option>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="row my-3">
                          <div class="col-12">
                            <div class="form-group">
                              <label for="estrategias-corporativas-05" class="label-quest">5) Há possibilidade do engajamento dos colaboradores da empresa como voluntários?</label>
                              <select class="form-control" id="estrategias-corporativas-05" name="notas">
                                <option value="2.5">Não</option>
                                <option value="10.0">Sim</option>
                              </select>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-header bg-info" id="headingThree">
                      <h5 class="mb-0">
                        <button class="btn btn-info collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                          Visibilidade <i class="fas fa-angle-down mx-2"></i>
                        </button>
                      </h5>
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                      <div class="card-body">
                        <div class="row my-3">
                          <div class="col-12">
                            <div class="form-group">
                              <label for="visibilidade-01" class="label-quest">1) O projeto apresenta um plano de comunicação estruturado?</label>
                              <select class="form-control" id="visibilidade-01" name="notas">
                                <option value="2.5">Não</option>
                                <option value="10.0">Sim</option>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="row my-3">
                          <div class="col-12">
                            <div class="form-group">
                              <label for="visibilidade-02" class="label-quest">2) As contrapartidas para a visibilidade da empresa incentivados estão coerentes com a expectativa da mesma?</label>
                              <select class="form-control" id="visibilidade-02" name="notas">
                                <option value="2.5">Não</option>
                                <option value="10.0">Sim</option>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="row my-3">
                          <div class="col-12">
                            <div class="form-group">
                              <label for="visibilidade-03" class="label-quest">3) Em termos de visibilidade para a empresa qual o impacto desse projeto ?</label>
                              <select class="form-control" id="visibilidade-03" name="notas">
                                <option value="2.5">Ruim</option>
                                <option value="5.0">Regular</option>
                                <option value="7.5">Bom</option>
                                <option value="10.0">Ótimo</option>
                              </select>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header bg-info" id="headingFour">
                    <h5 class="mb-0">
                      <button class="btn btn-info collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        Acesso aos Direitos <i class="fas fa-angle-down mx-2"></i>
                      </button>
                    </h5>
                  </div>
                  <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                    <div class="card-body">
                      <div class="row mb-5">
                        <div class="col-12">
                          <p class="lead"><strong> Considerando a Lei de Incentivo que a proposta  está inscrito/aprovada pela instância pública:</strong></p>
                          <p class="lead">
                            <ul>
                              <c:forEach var="incentivoFiscal" items="${projeto.incentivosFiscais}"><li>${incentivoFiscal.legislacao}</li></c:forEach>
                            </ul>
                          </p>
                        </div>
                      </div>
                      <div class="row my-3">
                        <div class="col-12">
                          <div class="form-group">
                            <label for="acesso-aos-direitos-01" class="label-quest">1) O projeto é relevante para o desenvolvimento da sociedade?</label>
                            <select class="form-control" id="acesso-aos-direitos-01" name="notas">
                              <option value="2.5">Não</option>
                              <option value="10.0">Sim</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="row my-3">
                        <div class="col-12">
                          <div class="form-group">
                            <label for="acesso-aos-direitos-02" class="label-quest">2) O projeto viabiliza à população acesso à direitos?</label>
                            <select class="form-control" id="acesso-aos-direitos-02" name="notas">
                              <option value="2.5">Não</option>
                              <option value="10.0">Sim</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="row my-3">
                        <div class="col-12">
                          <div class="form-group">
                            <label for="acesso-aos-direitos-03" class="label-quest">3) O projeto apresenta características inovadoras do ponto de vista sociedade/empresa ?</label>
                            <select class="form-control" id="acesso-aos-direitos-03" name="notas">
                              <option value="2.5">Não</option>
                              <option value="10.0">Sim</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="bg-primary">                
                <button type="submit" class="btn btn-primary float-right">Enviar <i class="far fa-share-square"></i></button>
                <a href="${path}/painel/dashboard" class="btn btn-danger float-right"><i class="fas fa-angle-double-left"></i> Voltar</a>
                <a href="${path}/painel/projetos/${projeto.id}" class="btn btn-warning float-left" target="_blank"><i class="fas fa-book"></i> Dados da Proposta</a>
              </form>
            </div>
            <div class="card-footer bg-info"></div>
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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