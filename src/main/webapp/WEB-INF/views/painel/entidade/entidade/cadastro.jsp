<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="pt-br">

<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        Incentivados - Cadastro de Entidade
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
    <c:import url="/WEB-INF/views/componentes/sidebar/sidebar-entidade.jsp"/>
    <div class="main-panel">
        <c:import url="/WEB-INF/views/componentes/navbar/navbar-entidade.jsp"/>
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-info"></div>
                        <div class="card-body border">
                            <form action="${path}/painel/entidades/cadastro" method="post" enctype="multipart/form-data"
                                  acceptcharset="UTF-8">

                                <fieldset>
                                    <legend class="text-primary">Informações Gerais:</legend>

                                    <hr class="bg-primary">

                                    <div class="row mt-3">
                                        <div class="col-12 col-sm-12 col-md-4">
                                            <div class="form-group">
                                                <label>Nome Fantasia:</label>
                                                <input type="text" class="form-control" name="nomeFantasia" required>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-4">
                                            <div class="form-group">
                                                <label>Razao Social:</label>
                                                <input type="text" class="form-control" name="razaoSocial" required>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label>CNPJ:</label>
                                                <input type="text" class="form-control" id="cnpj" name="cnpj"
                                                       onchange="if(!validarCNPJ(this.value)){$('#modal-cnpj-invalido').modal('show'); this.value='';}"
                                                       required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Sobre:</label>
                                            <textarea class="form-control" name="sobre" rows="5"
                                                      maxlength="3000"></textarea>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="mt-5">
                                    <legend class="text-primary">Endereço:</legend>
                                    <hr class="bg-primary">
                                    <div class="row mt-3">
                                        <div class="col-8 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label>CEP:</label>
                                                <input type="text" class="form-control" id="cep" name="endereco.cep"
                                                       required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-6 ">
                                            <div class="form-group">
                                                <label>Logradouro:</label>
                                                <input type="text" class="form-control" id="logradouro"
                                                       name="endereco.logradouro" required>
                                            </div>
                                        </div>
                                        <div class="col-5 col-sm-2 col-md-2">
                                            <div class="form-group">
                                                <label>Nº:</label>
                                                <input type="text" class="form-control" name="endereco.numero">
                                            </div>
                                        </div>
                                        <div class="col-sm-10 col-md-4">
                                            <div class="form-group">
                                                <label>Complemento:</label>
                                                <input type="text" class="form-control" name="endereco.complemento">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Bairro:</label>
                                                <input type="text" class="form-control" id="bairro"
                                                       name="endereco.bairro" required>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Cidade</label>
                                                <input type="text" class="form-control" id="cidade"
                                                       name="endereco.cidade" required>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Estado:</label>
                                                <select class="form-control" id="estado" name="endereco.estado"
                                                        required>
                                                    <option value="Não Informado">Selecione um Estado</option>
                                                    <option value="Acre">Acre</option>
                                                    <option value="Alagoas">Alagoas</option>
                                                    <option value="Amapá">Amapá</option>
                                                    <option value="Amazonas">Amazonas</option>
                                                    <option value="Bahia">Bahia</option>
                                                    <option value="Ceará">Ceará</option>
                                                    <option value="Distrito Federal">Distrito Federal</option>
                                                    <option value="Espírito Santo">Espírito Santo</option>
                                                    <option value="Goiás">Goiás</option>
                                                    <option value="Maranhão">Maranhão</option>
                                                    <option value="Mato Grosso">Mato Grosso</option>
                                                    <option value="Mato Grosso do Sul">Mato Grosso do Sul</option>
                                                    <option value="Minas Gerais">Minas Gerais</option>
                                                    <option value="Pará">Pará</option>
                                                    <option value="Paraíba">Paraíba</option>
                                                    <option value="Paraná">Paraná</option>
                                                    <option value="Pernambuco">Pernambuco</option>
                                                    <option value="Piauí">Piauí</option>
                                                    <option value="Rio de Janeiro">Rio de Janeiro</option>
                                                    <option value="Rio Grane do Norte">Rio Grande do Norte</option>
                                                    <option value="Rio Grande do Sul">Rio Grande do Sul</option>
                                                    <option value="Rondônia">Rondônia</option>
                                                    <option value="Roraima">Roraima</option>
                                                    <option value="Santa Catarina">Santa Catarina</option>
                                                    <option value="São Paulo">São Paulo</option>
                                                    <option value="Sergipe">Sergipe</option>
                                                    <option value="Tocantins">Tocantins</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="mt-5 mb-5">
                                    <legend class="text-primary">Arquivos:</legend>
                                    <hr class="bg-primary">
                                    <div class="row justify-content-center'">
                                        <div class=" col-md-6 col-lg-4 text-center mt-5">
                                            <div class="form-group">
                                                <label for="logo"><i class="far fa-file-image text-primary"
                                                                     style="font-size: 56px;"></i></label>
                                                <hr>
                                                <h5 class="text-center">Logo</h5>
                                                <input type="file" id="logo" name="documentosEntidade.logo.file"
                                                       onchange="validaImg(this, this.id)" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 text-center mt-5">
                                            <div class="form-group">
                                                <label for="ata-eleicao">
                                                    <i class="far fa-file-pdf text-primary"style="font-size: 56px;"></i></label>
                                                <hr>
                                                <h5 class="text-center">Ata de Eleição</h5>
                                                <input type="file" id="ata-eleicao"
                                                       name="documentosEntidade.ataEleicao.file"
                                                       onchange="validaPdf(this, this.id)" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 text-center mt-5">
                                            <div class="form-group">
                                                <label for="estatuto-social"><i class="far fa-file-pdf text-primary"
                                                                                style="font-size: 56px;"></i></label>
                                                <hr>
                                                <h5 class="text-center">Estatuto Social</h5>
                                                <input type="file" id="estatuto-social"
                                                       name="documentosEntidade.estatutoSocial.file"
                                                       onchange="validaPdf(this, this.id)" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 text-center mt-5">
                                            <div class="form-group">
                                                <label for="identidade"><i class="far fa-file-pdf text-primary"
                                                                           style="font-size: 56px;"></i></label>
                                                <hr>
                                                <h5 class="text-center">Identidade Presidente</h5>
                                                <input type="file" id="identidade"
                                                       name="documentosEntidade.identidade.file"
                                                       onchange="validaImgPdf(this, this.id)" required>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-lg-4 text-center mt-5">
                                            <div class="form-group">
                                                <label for="cartao-cnpj">
                                                    <i class="far fa-file-pdf text-primary" style="font-size: 56px;"></i>
                                                </label>
                                                <hr>
                                                <h5 class="text-center">Cartão CNPJ</h5>
                                                <input type="file" id="cartao-cnpj"
                                                       name="documentosEntidade.cartaoCnpj.file"
                                                       onchange="validaImgPdf(this, this.id)" required>
                                            </div>
                                        </div>
                                </fieldset>

                                <hr class="bg-primary">
                                <button type="submit" class="btn btn-info float-right">Enviar <i
                                        class="far fa-share-square"></i></button>
                                <a href="${path}/painel/entidades" class="btn btn-danger float-right"><i
                                        class="fas fa-angle-double-left"></i> Voltar</a>
                            </form>
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
<c:import url="/WEB-INF/views/componentes/modal/modal-cnpj-invalido.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-arquivo-recusado-all.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-arquivo-recusado-img.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-arquivo-recusado-pdf.jsp"/>


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