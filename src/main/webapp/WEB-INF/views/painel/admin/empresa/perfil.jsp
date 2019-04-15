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
    Incentivados - ${empresa.nomeFantasia}
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
    <c:import url="/WEB-INF/views/componentes/sidebar/sidebar-admin.jsp" />    
    <div class="main-panel">
      <!-- Navbar -->
      <c:import url="/WEB-INF/views/componentes/navbar/navbar-admin.jsp" />      
      <div class="content">        
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header bg-info"></div>
              <div class="card-body border">
                <fieldset>
                <legend class="text-primary">Informações Gerais:</legend>
                <div class="row mt-5">
                  <div class="col-4 text-center">                    
                    <figure class="figure">
                      <img class="img-fluid" src="${path}/${empresa.documentosEmpresa.logo.path}" width="200"> 
                    </figure> 
                  </div>                                           
                  <div class="col-8">
                    <div class="row">
                      <div class="col-12">
                        <div class="form-group">
                            <label>Razao Social:</label>
                            <input type="text" class="form-control" value="${empresa.razaoSocial}" readonly>
                        </div>
                      </div>  
                    </div> 
                    <div class="row">
                      <div class="col-12">
                        <div class="form-group">
                            <label>Nome Fantasia:</label>
                            <input type="text" class="form-control" value="${empresa.nomeFantasia}" readonly>
                        </div>
                      </div>  
                    </div> 
                    <div class="row">
                      <div class="col-12">
                        <div class="form-group">
                            <label>CNPJ:</label>
                            <input type="text" class="form-control" value="${empresa.cnpj}" readonly>
                        </div>
                      </div>  
                    </div> 
                  </div>
                </div>  
                </fieldset>                          

                <fieldset class="mt-5">
                <legend class="text-primary">Analistas:</legend>                  
                <div class="row justify-content-start">
                  <c:if test = "${empty empresa.analistas}">
                    <div class="col-12">
                      <div class="alert alert-info p-3" role="alert">
                        <p class="text-bold">Não há registro(s) ou .</p>
                      </div>
                    </div>
                  </c:if> 
                  <c:if test = "${not empty empresa.analistas}">
                    <div class="col-12">
                      <div class="table-responsive">
                        <table class="table">
                          <thead class=" text-primary">
                            <th class="border text-center">Nome</th>
                            <th class="border text-center">CPF</th>
                            <th class="border text-center">E-mail</th>
                            <th class="border text-center">Loja</th>
                          </thead>
                          <tbody>
                            <c:forEach var="analista" items="${empresa.analistas}">
                              <tr>
                                <td class="border text-center">${analista.nome} ${analista.sobrenome}</td>
                                <td class="border text-center">${analista.cpf}</td>
                                <td class="border text-center">${analista.email}</td>
                                <td class="border text-center" ><strong><i class="far fa-building"></i> ${analista.endereco.bairro}</strong> (${analista.endereco.cidade} - ${analista.endereco.estado})</td>
                              </tr>
                            </c:forEach>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </c:if>                  
                </div>
                </fieldset>
                <hr class="bg-success">
                <a href="${path}/painel/empresas" class="btn btn-danger float-right"><i class="fas fa-angle-double-left"></i> Voltar</a>
                <a href="${path}/painel/empresas/${empresa.nomeFantasia}/analistas/cadastro" class="btn btn-info mr-5 float-right">Cadastrar Analista</a>
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
  <c:import url="/WEB-INF/views/componentes/modal/modal-cnpj-invalido.jsp" />

  <!--   JQUERY   -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <!--   POPPER   -->  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <!--   BOOTSTRAP   -->  
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
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