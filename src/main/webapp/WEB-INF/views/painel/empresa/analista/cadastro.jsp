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
    Incentivados - Cadastro de Analista
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     FONTAWESOME     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!--     BOOTSTRAP     -->
  <link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet" />
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
          <li class="active">
            <a href="${path}/painel/${usuario.empresa.id}/analistas"><i class="fas fa-users"></i>Analistas</a>
          </li>
          <li>
            <a href="${path}/painel/projetos"><i class="fas fa-project-diagram"></i>Projetos</a>
          </li>
          <li>
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
            <b><a class="navbar-brand" href="#">${usuario.empresa.nomeFantasia} <i class='fas fa-angle-double-right'></i> Analista <i class='fas fa-angle-double-right'></i> Cadastro</a></b>
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
                <form action="${path}/painel/analistas/cadastro" method="post" acceptcharset="UTF-8">                  
                  <input type="hidden" class="form-control" name="tipoUsuario" value="ANALISTA">    
                  <fieldset class="mt-3 mt-3">
                  <legend>Informações do Analista:</legend>
                  <div class="row">               
                    <div class="col-12 col-lg-4">
                      <div class="form-group">
                          <label>Nome:</label>
                          <input type="text" class="form-control" name="nome" required>
                      </div>
                    </div>
                    <div class="col-12 col-lg-4">
                      <div class="form-group">
                          <label>Sobrenome:</label>
                          <input type="text" class="form-control" name="sobrenome" required>
                      </div>
                    </div>
                    <div class="col-12 col-lg-4">
                      <div class="form-group">
                          <label>CPF:</label>
                          <input type="text" class="form-control" id="cpf" name="cpf" onchange="if(!validarCPF(this.value)){$('#modal-cpf-invalido').modal('show'); this.value='';}">
                      </div>
                    </div>              
                  </div>
                  <div class="row">
                    <div class="col-12 col-lg-4">
                      <div class="form-group">
                          <label>E-mail:</label>
                          <input type="email" class="form-control" name="email" required>
                      </div>
                    </div>
                    <div class="col-12 col-lg-4">
                      <div class="form-group">
                          <label>Senha:</label>
                          <input type="password" class="form-control" name="senha" minlength="6" required>
                      </div>
                    </div>
                    <div class="col-12 col-lg-4">
                      <div class="form-group">
                          <label>Telefone:</label>
                          <input type="text" class="form-control" id="telefone" name="telefone" required>
                      </div>
                    </div>
                  </div>
                  </fieldset>

                  <fieldset class="mt-3 mt-3">
                  <legend>Endereço Loja:</legend>
                  <div class="row">
                    <div class="col-12 col-lg-4">
                      <div class="form-group">
                          <label>CEP:</label>                     
                          <input type="text" class="form-control" id="cep" name="endereco.cep" required>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-12 col-lg-7">
                      <div class="form-group">
                          <label>Logradouro:</label>                      
                          <input type="text" class="form-control" id="logradouro" name="endereco.logradouro" required>
                      </div>
                    </div>
                    <div class="col-12 col-lg-2">
                      <div class="form-group">
                          <label>Nº:</label>                      
                          <input type="text" class="form-control" name="endereco.numero" required>
                      </div>
                    </div>
                    <div class="col-12 col-lg-3">
                      <div class="form-group">
                          <label>Complemento:</label>                     
                          <input type="text" class="form-control" name="endereco.complemento">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-12 col-lg-4">
                      <div class="form-group">
                          <label>Bairro:</label>                      
                          <input type="text" class="form-control" id="bairro" name="endereco.bairro" required>
                      </div>
                    </div>
                    <div class="col-12 col-lg-4">
                      <div class="form-group">
                          <label>Cidade</label>                     
                          <input type="text" class="form-control" id="cidade" name="endereco.cidade" required>
                      </div>
                    </div>
                    <div class="col-12 col-lg-4">
                      <div class="form-group">
                          <label>Estado:</label>                      
                          <input type="text" class="form-control" id="estado" name="endereco.estado" required>
                      </div>
                    </div>
                  </div>
                  </fieldset>
                  <hr class="bg-success">
                  <button type="submit" class="btn btn-info float-right">Enviar <i class="far fa-share-square"></i></button>
                  <a href="${path}/painel/dashboard" class="btn btn-danger float-right"><i class="fas fa-angle-double-left"></i> Voltar</a>
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
  <c:import url="/WEB-INF/views/componentes/modal/modal-cpf-invalido.jsp" />
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
  <!-- API'S -->
  <script type="text/javascript" src="${path}/api/via-cep.js"></script>
  <!-- VALIDATOR -->
  <script type="text/javascript" src="${path}/assets/js/cpf-validator.js"></script>
  <!-- MASK -->
  <script type="text/javascript" src="${path}/assets/js/core/jquery.maskedinput.js"></script>
  <script type="text/javascript">    
    $("#cpf").mask("999.999.999-99");
    $("#cep").mask("99999-999");
    $('#telefone').focusout(function(){
        var phone, element;
        element = $(this);
        element.unmask();
        phone = element.val().replace(/\D/g, '');
        if(phone.length > 10) {
            element.mask("(99) 99999-999?9");
        } else {
            element.mask("(99) 9999-9999?9");
        }
    }).trigger('focusout');   
  </script>
</body>

</html>