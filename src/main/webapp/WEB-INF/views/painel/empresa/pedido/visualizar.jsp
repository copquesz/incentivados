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
    Incentivados - Visualizar Pedido
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     FONTAWESOME     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
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
          <div class="logo-image-small"><i class="far fa-user"></i></div>
        </a>
        <a href="${path}/painel/perfil" class="text-white logo-normal">Bem vindo, ${usuario.nome}.</a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="${path}/painel/dashboard"><i class="fas fa-desktop"></i>Painel Principal</a>
          </li>
          <li>
            <a href="${path}/painel/${usuario.empresa.id}/analistas"><i class="fas fa-users"></i>Analistas</a>
          </li>
          <li>
            <a href="${path}/painel/projetos"><i class="fas fa-project-diagram"></i>Projetos</a>
          </li>
          <li class="active">
            <a href="${path}/painel/pedidos?filtro=TODOS&key="><i class="fas fa-praying-hands"></i>Pedidos</a>
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
            <b><a class="navbar-brand" href="#">${usuario.empresa.nomeFantasia} <i class='fas fa-angle-double-right'></i> Pedido <i class='fas fa-angle-double-right'></i> #${pedido.id}</a></b>
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
              <div class="card-header bg-primary"></div>
              <div class="card-body border">
                <form action="${path}/painel/pedidos/${empresa.nomeFantasia}/cadastro" method="post" enctype="multipart/form-data" acceptcharset="UTF-8">
                  <input type="hidden" name="pedido.id" value="${pedido.id}">
                  <fieldset>
                  <legend class="text-primary">Solicitante:</legend>
                  <hr class="bg-primary">
                  <div class="row mt-3">               
                    <div class="col-4">
                      <div class="form-group">
                          <label>Nome:</label>
                          <input type="text" class="form-control" value="${pedido.usuario.nome} ${pedido.usuario.sobrenome}" readonly>
                      </div>
                    </div>                     
                    <div class="col-4">
                      <div class="form-group">
                          <label>E-mail:</label>
                          <input type="text" class="form-control" value="${pedido.usuario.email}" readonly>
                      </div>
                    </div>    
                    <div class="col-4">
                      <div class="form-group">
                          <label>CPF:</label>
                          <input type="text" class="form-control" value="${pedido.usuario.cpf}" readonly>
                      </div>
                    </div>   
                  </div>
                  <div class="row">
                    <div class="col-6">
                      <label>Tipo de Solicitação:</label>                      
                      <input type="text" class="form-control" value="${pedido.tipoPedido.descricao}" readonly>
                    </div>
                    <div class="col-6">
                      <label>Entidade:</label>                      
                      <input type="text" class="form-control" value="${pedido.entidade.nomeFantasia}" readonly>
                    </div>
                  </div>
                  <div class="row"> 
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Descrição do Pedido:</label>
                        <textarea class="form-control" rows="5" placeholder="Não Informado" readonly>${pedido.solicitacao}</textarea>
                      </div>
                    </div>  
                  </div>
                  </fieldset>  

                  <fieldset class="mt-5">
                  <legend class="text-primary">Destino:</legend>
                  <hr class="bg-primary">
                  <div class="row mt-3">  
                    <div class="col-4">                      
                      <div class="form-group">
                          <label>Nome Fantasia:</label>
                          <input type="text" class="form-control" value="${pedido.entidade.nomeFantasia}" readonly>
                      </div>
                    </div>             
                    <div class="col-4">
                      <div class="form-group">
                          <label>Razão Social:</label>
                          <input type="text" class="form-control" value="${pedido.entidade.razaoSocial}" readonly>
                      </div>
                    </div>
                    <div class="col-4">
                      <div class="form-group">
                          <label>CNPJ:</label>
                          <input type="text" class="form-control" value="${pedido.entidade.cnpj}" readonly>
                      </div>
                    </div>    
                  </div>
                  <div class="row">
                    <div class="col-12">
                      <label>Loja:</label>  
                      <input type="text" class="form-control" value="${pedido.analista.endereco.bairro} ( ${pedido.analista.endereco.cidade} / ${pedido.analista.endereco.estado} )" readonly>
                    </div>
                  </div>
                  </fieldset> 

                  <fieldset class="mt-5 mb-5">
                  <legend class="text-primary">Uploads:</legend>

                  <hr class="bg-primary">

                  <div class="row justify-content-start">
                    <div class="col-lg-2 text-center mt-5">
                      <div class="form-group">
                          <a href="${path}/${pedido.documentosPedido.cartaOficio.path}" target="_blank"><i class="far fa-file-alt text-primary" style="font-size: 56px;"></i></a>
                          <hr>
                          <h5 class="text-center">Carta Ofício</h5>
                      </div>
                    </div>
                    <div class="col-lg-2 text-center mt-5">
                      <div class="form-group">
                          <a href="${path}/${pedido.entidade.documentosEntidade.cartaoCnpj.path}" target="_blank"><i class="far fa-file-image text-primary" style="font-size: 56px;"></i></a>
                          <hr>
                          <h5 class="text-center">Cartão CNPJ</h5>
                      </div>
                    </div>
                  </div>
                  </fieldset> 

                  <hr class="bg-primary">
                  <a href="#" class="btn btn-danger float-right" data-toggle="modal" data-target="#modal-reprovar-pedido">Reprovar <i class="far fa-thumbs-down"></i></a>
                  <a href="" class="btn btn-success float-right" data-toggle="modal" data-target="#modal-aprovar-pedido">Aprovar <i class="far fa-thumbs-up"></i></a>
                  <a href="${path}/painel/dashboard" class="btn btn-warning float-left"><i class="fas fa-angle-double-left"></i> Voltar</a>
                </form>
              </div>
              <div class="card-footer bg-primary"></div>
            </div>
          </div>
        </div>              
      </div>      
      <c:import url="/WEB-INF/views/componentes/footer/painel/footer.jsp" />
    </div>
  </div>

  <!-- MODALS -->
  <c:import url="/WEB-INF/views/componentes/modal/modal-aprovar-pedido.jsp" /> 
  <c:import url="/WEB-INF/views/componentes/modal/modal-reprovar-pedido.jsp" />


  <!--   JQUERY   -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <!--   POPPER   -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <!--   BOOTSTRAP   -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script type="text/javascript" src="${path}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <script type="text/javascript" src="${path}/assets/js/paper-dashboard.min.js?v=2.0.0"></script>
</body>

</html>