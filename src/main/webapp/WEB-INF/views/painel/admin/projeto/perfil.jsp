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
    Incentivados - ${projeto.titulo}
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
      <c:import url="/WEB-INF/views/componentes/navbar/navbar-admin.jsp" />      
      <div class="content">        
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header bg-primary"></div><!-- END CARD-HEADER -->

              <!-- CARD BODY -->
              <div class="card-body border"> 

                <!-- IMAGEM, TÍTULO E OBJETIVO DO PROJETO -->
                <div class="row mt-4">
                  <div class="col-xl-4 text-center">                    
                    <figure class="figure">
                      <img class="img-thumbnail img-fluid" src="${path}/${projeto.documentosProjeto.logo.path}" width="400" /> 
                    </figure> 
                  </div> 
                  <div class="col-xl-8 text-left">      
                      <h2 class="mt-3 ml-3 bold text-primary text-center">${projeto.titulo}</h2>
                      <hr>
                      <p class="text-justify">${projeto.objetivo}</p>
                  </div>
                </div>
                <hr>
                <!-- END IMAGEM, TÍTULO E OBJETIVO DO PROJETO -->

                <!-- ESTATÍSTICAS DO PROJETO -->
                <div class="row justify-content-center p-2 mt-3">
                  <div class="col-xl-2 col-lg-5 col-md-9 col-sm-8 bg-primary rounded text-center p-3 mt-3 mx-auto">
                    <h5 class="text-white"><i class="fas fa-file-invoice-dollar fa-3x"></i></h5>
                    <hr>
                    <h5 class="text-white bold"><span style="font-size: 0.8rem;">Valor Total:</span> </br><span style="font-size: 1.4rem;">R$ ${projeto.valorTotal}</span></h5>
                  </div>
                  <div class="col-xl-2 col-lg-5 col-md-9 col-sm-8 bg-primary rounded text-center p-3 mt-3 mx-auto">
                    <h5 class="text-white"><i class="fas fa-hand-holding-usd fa-3x"></i></h5>
                    <hr>
                    <h5 class="text-white bold"><span style="font-size: 0.8rem;">Valor Solicitado:</span> </br><span style="font-size: 1.4rem;">R$ ${projeto.valorSolicitado}</span></h5>
                  </div>
                  <div class="col-xl-2 col-lg-5 col-md-9 col-sm-8 bg-primary rounded text-center p-3 mt-3 mx-auto">
                    <h5 class="text-white"><i class="fas fa-compress-arrows-alt fa-3x"></i></h5>
                    <hr>
                    <h5 class="text-white bold"><span style="font-size: 0.8rem;">Beneficiários Diretos:</span> </br><span style="font-size: 1.4rem;"><i class="fas fa-users"></i> ${projeto.beneficiariosDiretos}</span></h5>
                  </div>
                  <div class="col-xl-2 col-lg-5 col-md-9 col-sm-8 bg-primary rounded text-center p-3 mt-3 mx-auto">
                    <h5 class="text-white"><i class="fas fa-expand-arrows-alt fa-3x"></i></h5>
                    <hr>
                    <h5 class="text-white bold"><span style="font-size: 0.8rem;">Beneficiários Indiretos:</span> </br><span style="font-size: 1.4rem;"><i class="fas fa-users"></i> ${projeto.beneficiariosIndiretos}</span></h5>
                  </div>
                </div>
                <!-- END ESTATÍSTICAS DO PROJETO -->

                <!-- INFORMAÇÕES GERAIS DO PROJETO -->
                <fieldset class="my-5">
                <legend class="text-primary">Informações Gerais:</legend>
                <hr class="bg-primary">
                    <div class="row mt-3">
                      <div class="col-xl-4">
                        <div class="form-group">
                            <label>Data/Hora Cadastro:</label>   
                            <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${projeto.dataCadastro}" var="dataCadastro" />
                            <input type="text" class="form-control" value="${dataCadastro}" readonly>
                        </div>
                      </div>
                      <div class="col-xl-8">
                        <div class="form-group">
                            <label>Entidade Executora:</label> 
                            <input type="text" class="form-control" value="${projeto.entidade.razaoSocial}" readonly>
                        </div>
                      </div>
                    </div>
                    <div class="row mt-3">
                      <div class="col-xl-12">
                        <div class="form-group">
                            <label>Resumo:</label>                     
                            <textarea class="form-control" rows="5" readonly>${projeto.resumo}</textarea>
                        </div>
                      </div>
                    </div>
                </fieldset>
                <!-- END INFORMAÇÕES GERAIS DO PROJETO -->

                <!-- INFORMAÇÕES DAS LEIS FISCAIS ESCOLHIDAS DO PROJETO -->
                <fieldset class="mt-5">
                <legend class="text-primary">Incentivos Fiscais Selecionados:</legend>
                <hr class="bg-primary">
                <div class="row">
                  <div class="col-xl-12">
                    <div class="form-group">
                      <ul>
                        <c:forEach var="incentivoFiscal" items="${projeto.incentivosFiscais}">
                          <li class="lead">${incentivoFiscal.legislacao} <c:if test = "${not empty incentivoFiscal.sigla}"> - ${incentivoFiscal.sigla}</c:if></li>
                        </c:forEach>
                      </ul>
                    </div>
                  </div> 
                </fieldset> 
                <!-- END INFORMAÇÕES DAS LEIS FISCAIS ESCOLHIDAS DO PROJETO -->

                <!-- ARQUIVOS DO PROJETO -->
                <fieldset class="mt-5">
                <legend class="text-primary">Uploads:</legend>
                <hr class="bg-primary">
                  <div class="row justify-content-start">
                    <div class="col-xl-2 col-md-4 col-sm-12 text-center my-5">
                      <div class="form-group">
                          <a href="${path}/${projeto.documentosProjeto.logo.path}" target="_blank"><i class="far fa-file-image text-primary" style="font-size: 4rem;"></i></a>
                          <hr>
                          <h5 class="text-center" style="font-size: 0.8rem">Logo</h5>
                      </div>
                    </div> 
                    <div class="col-xl-2 col-md-4 col-sm-12 text-center my-5">
                      <div class="form-group">
                          <a href="${path}/${projeto.documentosProjeto.propostaTecnica.path}" target="_blank"><i class="fas fa-file-pdf text-primary" style="font-size: 4rem;"></i></a>
                          <hr>
                          <h5 class="text-center" style="font-size: 0.8rem">Projeto Técnico</h5>
                      </div>
                    </div>
                    <div class="col-xl-2 col-md-4 col-sm-12 text-center my-5">
                      <div class="form-group">
                          <a href="${path}/${projeto.documentosProjeto.propostOrcamentaria.path}" target="_blank"><i class="fas fa-file-pdf text-primary" style="font-size: 4rem;"></i></a>
                          <hr>
                          <h5 class="text-center" style="font-size: 0.8rem">Projeto Orçamentário</h5>
                      </div>
                    </div> 
                    <div class="col-xl-2 col-md-4 col-sm-12 text-center my-5">
                      <div class="form-group">
                          <a href="${path}/${projeto.documentosProjeto.dadosBancarios.path}" target="_blank"><i class="fas fa-file-pdf text-primary" style="font-size: 4rem;"></i></a>
                          <hr>
                          <h5 class="text-center" style="font-size: 0.8rem">Dados Bancários</h5>
                      </div>
                    </div>
                    <div class="col-xl-2 col-md-4 col-sm-12 text-center my-5">
                      <div class="form-group">
                          <a href="${path}/${projeto.documentosProjeto.certificado.path}" target="_blank"><i class="fas fa-file-pdf text-primary" style="font-size: 4rem;"></i></a>
                          <hr>
                          <h5 class="text-center" style="font-size: 0.8rem">Certificado de Captação</h5>
                      </div>
                    </div>
                </fieldset>
                <!-- END ARQUIVOS DO PROJETO -->

              </div><!-- END CARD-BODY -->

              <div class="card-footer bg-primary"></div><!-- END CARD-FOOTER -->
            </div><!-- END CARD -->
          </div><!-- END MAIN-COL-12 -->
        </div><!-- END ROW -->              
      </div><!-- END CONTENT -->
      <c:import url="/WEB-INF/views/componentes/footer/painel/footer.jsp" />
    </div><!-- END MAIN-FOOTER -->
  </div>

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