<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="pt-br">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Dashboard
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
    <c:import url="/WEB-INF/views/componentes/sidebar/sidebar-admin.jsp" />    
    <div class="main-panel">
      <!-- Navbar -->
      <c:import url="/WEB-INF/views/componentes/navbar/navbar-admin.jsp" /> 
      <div class="content">
        <div class="row">          
          <div class="col-12">
            <div class="card">
              <div class="card-header ">                
                <h5 class="card-title text-primary">Cadastro de Incentivo Fiscal</h5>
              </div>
              <div class="card-body">
                <div class="row mt-5">
                  <div class="col-12">
                    <form action="${path}/painel/incentivos-fiscais/cadastro" method="post" acceptcharset="UTF-8">
                      <fieldset>
                      <legend>Informações Gerais:</legend>
                      <div class="row mt-3 mt-3">               
                        <div class="col-sm-12 col-md-9">
                          <div class="form-group">
                              <label>Legislação:</label>
                              <input type="text" class="form-control" name="legislacao" required>
                          </div>
                        </div>
                        <div class="col-6 col-sm-5 col-md-3">
                          <div class="form-group">
                              <label>Sigla:</label>
                              <input type="text" class="form-control" name="sigla">
                          </div>
                        </div>            
                      </div>
                      <div class="row">                 
                        <div class="col-sm-12 col-md-4">
                          <div class="form-group">
                              <label>Competência:</label>
                              <select class="form-control" id="competencia" name="competencia" required>                          
                                <c:forEach var="competencia" items="${competencias}">
                                    <option value="${competencia}">${competencia.descricao}</option>
                                </c:forEach>
                              </select>
                          </div>
                        </div>
                        <div class="col-sm-12 col-md-4">
                          <div class="form-group">
                              <label>Atuação:</label>
                              <select class="form-control" name="atuacao" required>
                                <c:forEach var="atuacao" items="${atuacoes}">
                                    <option value="${atuacao}">${atuacao.descricao}</option>
                                </c:forEach>
                              </select>
                          </div>
                        </div>
                        <div class="col-sm-12 col-md-4" id="campo-localidade">
                          <div class="form-group">
                              <label>Localidade:</label>
                              <input type="text" class="form-control" id="localidade" name="localidade">
                          </div>
                        </div>
                      </div>
                      </fieldset>
                      <hr class="bg-default">
                      <button type="submit" class="btn btn-primary float-right">Enviar <i class="far fa-share-square"></i></button>
                      <a href="${path}/painel/incentivos-fiscais" class="btn btn-danger float-right"><i class="fas fa-angle-double-left"></i> Voltar</a>
                    </form> 
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
      <c:import url="/WEB-INF/views/componentes/footer/painel/footer.jsp" />
    </div>
  </div>
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
        let competencia = $('#competencia');
        let campo_localidade = $('#campo-localidade'); 

        competencia.change(function () {
          if(competencia.val() == "FEDERAL"){
            campo_localidade.hide();
          }
          else{
            campo_localidade.show();
          }
        });
        //final get estado
    });
  </script>
</body>

</html>