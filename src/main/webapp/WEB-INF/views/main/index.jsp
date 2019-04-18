<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="no-js" lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="author" content="John Doe">
    <meta name="description" content="">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Title -->
    <title>Home</title>
    <!-- Place favicon.ico in the root directory -->
    <link rel="apple-touch-icon" href="${path}/main/images/apple-touch-icon.png">
    <link rel="shortcut icon" type="image/ico" href="${path}/main/images/favicon.ico"/>
    <!-- Plugin-CSS -->
    <link rel="stylesheet" href="${path}/main/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/main/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${path}/main/css/themify-icons.css">
    <link rel="stylesheet" href="${path}/main/css/magnific-popup.css">
    <link rel="stylesheet" href="${path}/main/css/animate.css">
    <!-- Main-Stylesheets -->
    <link rel="stylesheet" href="${path}/main/css/normalize.css">
    <link rel="stylesheet" href="${path}/main/css/style.css">
    <link rel="stylesheet" href="${path}/main/css/responsive.css">
    <link rel="stylesheet" hre=" animate.min.css">

    <script src="${path}/main/js/vendor/modernizr-2.8.3.min.js"></script>

    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body data-spy="scroll" data-target="#primary-menu">

<!--EFEITO DE ONDAS/-->
<div id="flow">
    <span class="flow-1"></span>
    <span class="flow-2"></span>
    <span class="flow-3"></span>
</div>
<%--PRELOADER Desativado--%>
<%--    <div class="preloader">--%>
<%--        <div class="sk-folding-cube">--%>
<%--            <div class="sk-cube1 sk-cube"></div>--%>
<%--            <div class="sk-cube2 sk-cube"></div>--%>
<%--            <div class="sk-cube4 sk-cube"></div>--%>
<%--            <div class="sk-cube3 sk-cube"></div>--%>
<%--        </div>--%>
<%--    </div>--%>

<!--Mainmenu-area-->
<div class="mainmenu-area" data-spy="affix" data-offset-top="100">
    <div class="container">
        <!--Logo-->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#primary-menu">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand logo">
                <img src="${path}/main/images/logoIncentivados.png" width="30" height="30"
                     style="display:inline-block;">
                Incentivados
                <h5>Yabá Consultoria</h5>
            </a>

        </div>
        <!--Logo/-->
        <nav class="collapse navbar-collapse" id="primary-menu">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="#home-page">Home</a></li>
                <li><a href="#service-page">Sobre</a></li>
                <li><a href="#feature-page">Serviços</a></li>
                <li><a href="#plataforma">Plataforma</a></li>
                <li><a href="#faq-page">FAQ</a></li>
                <li><a href="#contact-page">Contato</a></li>
                <li><a href="${path}/login">Login</a></li>
            </ul>
        </nav>
    </div>
</div>


<!--HEADER-->
<header class="header-area bg-default full-height relative v-center" id="home-page">
    <div class="absolute anlge-bg"></div>
    <div class="container">
        <div class="row v-center">
            <div class="col-xs-12 col-md-7 header-text">
                <h2 class="h2">Conectando empresas e proponentes</h2>
                <p>Aumentar a chances de captação de recursos para organizações sociais e potencializar o uso
                    qualificado de recursos dedutíveis do Imposto das empresas é o propósito do Incentivados no
                    Brasil. </p>
                <a href="${path}/login" class="button white">Comece agora!</a>
            </div>
        </div>
    </div>
</header>
<!--HEADER/-->


<!-- QUEM SOMOS -->
<section class="white-bg section-padding" id="service-page">
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-sm-offset-3 text-center">
            <div class="titulo-section wow animated bounceInRight slower">
                <h2>Quem somos?</h2>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <div class="box wow animated bounceInLeft slower">
                    <p class="text-justify lead">O Incentivados é uma iniciativa da YABÁ, consultoria especializada
                        em
                        Investimento Social
                        Privado, captação de recursos e monitoramento de resultados.
                        A plataforma tecnológica é uma estratégia para viabilizar a curadoria de projetos aprovados
                        nas Leis Incentivo Fiscal em âmbito federal, estadual e municipal.
                        Conectar empresas à bons projetos, é certeza de fazer a diferença na sociedade.

                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
<%--QUEM SOMOS--%>


<!--SERVIÇOS-->
<section class="gray-bg section-padding" id="feature-page">
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-sm-offset-3 text-center">
            <div class="titulo-section">
                <h2>Como fazemos?</h2>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <!-- CARDS DE ASSOSIAÇÕES -->
            <div class="col-lg-6">
                <div class="text-center lead">
                    <p class="h1 title-bg" style="color: #ffffff; border-radius: 15px;">PROPONENTES</p>
                </div>
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="box">
                            <div class="box-icon">
                                <img src="${path}/main/images/portfolio-icon-1.png" alt="">
                            </div>
                            <h3 style="border-bottom-color: red">Captação de recursos</h3>
                            <p>Conexão de projetos aprovados em Leis de Incentivo com empresas</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">

                        <div class="box">
                            <div class="box-icon">
                                <img src="${path}/main/images/portfolio-icon-2.png" alt="">
                            </div>
                            <h3>Monitoramento</h3>
                            <p>Consolidação dos resultados por meio de comunicação personalizada para
                                estimular/manter a parceria com as empresas apoiadoras.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="box">
                            <div class="box-icon">
                                <img src="${path}/main/images/portfolio-icon-3.png" alt="">
                            </div>
                            <h3>Articulação</h3>
                            <p>Identificação de oportunidades, eventos e sinergias entre projetos e empresas.
                            </p>
                        </div>
                    </div>
                </div>

            </div>
            <!-- CARD DE EMPRESAS -->
            <div class="col-lg-6">
                <div class="d-flex text-center lead">
                    <p class="h1 title-bg " style="color: #ffffff; border-radius: 15px;">EMPRESAS</p>
                </div>
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="box">
                            <div class="box-icon">
                                <img src="${path}/main/images/portfolio-icon-1.png" alt="">
                            </div>
                            <h3>Parceria</h3>
                            <p> Identificação de iniciativas de alto impacto social alinhadas às estratégias de
                                negócio e marca da empresa.</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="box">
                            <div class="box-icon">
                                <img src="${path}/main/images/portfolio-icon-3.png" alt="">
                            </div>
                            <h3>Engajamento</h3>
                            <p>Mobilização de públicos de interesse internos e externos a partir de comunicação
                                personalizada e alinhada às iniciativas apoiadas.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="box">
                            <div class="box-icon">
                                <img src="${path}/main/images/portfolio-icon-2.png" alt="">
                            </div>
                            <h3>Suporte técnico</h3>
                            <p>Gestão do processo operacional e o monitoramento da execução das iniciativas, é um
                                diferencial para garantir os resultados, mitigar riscos e assegurar sexigências de
                                Compliance e Auditoria.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%--SERVIÇOS--%>


<%--PLATAFORMA--%>
<section class="angle-bg bg-default section-padding" id="plataforma">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div id="caption_slide" class="carousel slide caption-slider" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="item active row">
                            <div class="v-center">
                                <div class="col-xs-12 col-md-6">
                                    <div class="caption-title" data-animation="animated fadeInUp">
                                        <h2>Conheça a platarfoma</h2>
                                    </div>
                                    <div class="caption-desc" data-animation="animated fadeInUp">
                                        <p>Para Acessar a plataforma realize seu cadastro, simples e rapido, assim que
                                            seu cadastro for feito
                                            realize seu login para assim ter acesso ao painel. </p>
                                    </div>
                                    <div class="caption-button" data-animation="animated fadeInUp">
                                        <a href="${path}/login" class="button white">Cadastre-se</a>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <div class="caption-photo one" data-animation="animated fadeInRight">
                                        <img src="${path}/main/images/cases-img/cadastro-1.png" alt="png">
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <div class="caption-photo two" data-animation="animated fadeInRight">
                                        <img src="${path}/main/images/cases-img/cadastro-2.png" alt="png">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item row">
                            <div class="v-center">
                                <div class="col-xs-12 col-md-6">
                                    <div class="caption-title" data-animation="animated fadeInUp">
                                        <h2>Gerencie suas atividades</h2>
                                    </div>
                                    <div class="caption-desc" data-animation="animated fadeInUp">
                                        <p>Criamos um painel intuitivo, onde você podera acomponhar todas as suas
                                            atividades e registros
                                            dos serviçõs disponibilizados</p>
                                    </div>
                                    <div class="caption-button" data-animation="animated fadeInUp">
                                        <a href="${path}/login" class="button white">Crie sua conta</a>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <div class="caption-photo one" data-animation="animated fadeInRight">
                                        <img src="${path}/main/images/cases-img/painel-1.png" alt="png">
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <div class="caption-photo two" data-animation="animated fadeInRight">
                                        <img src="${path}/main/images/cases-img/painel-2.png" alt="png">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item row">
                            <div class="v-center">
                                <div class="col-xs-12 col-md-6">
                                    <div class="caption-title" data-animation="animated fadeInUp">
                                        <h2>Cadastre seus projetos</h2>
                                    </div>
                                    <div class="caption-desc" data-animation="animated fadeInUp">
                                        <p>Cadastre seus projetos e entidades de maneira simple e facil</p>
                                    </div>
                                    <div class="caption-button" data-animation="animated fadeInUp">
                                        <a href="${path}/login" class="button white">Acesse o painel</a>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <div class="caption-photo one" data-animation="animated fadeInRight">
                                        <img src="${path}/main/images/cases-img/painel-1.png" alt="">
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <div class="caption-photo two" data-animation="animated fadeInRight">
                                        <img src="${path}/main/images/cases-img/painel-2.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Indicators -->
                    <ol class="carousel-indicators caption-indector">
                        <li data-target="#caption_slide" data-slide-to="0" class="active">
                            <strong>Cadastro</strong>Simples e rapido
                        </li>
                        <li data-target="#caption_slide" data-slide-to="1">
                            <strong>Painel Principal</strong>Todas as informações em um só lugar
                        </li>
                        <li data-target="#caption_slide" data-slide-to="2">
                            <strong>Solicitações</strong>Realize suas solicitações
                        </li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>
<%--PLATAFORMA--%>

<%--PERGUNTAS FREQUENTES--%>
<section class="gray-bg section-padding" id="faq-page">
    <div class="container">
        <div class="row justify-content-end">
            <div class="col-xs-12 col-sm-6 col-sm-offset-3 text-center">
                <div class="page-title">
                    <h2>Perguntas Frequentes</h2>
                    <!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit voluptates, temporibus at,
                        facere harum fugiat!</p> -->
                </div>
            </div>
        </div>
        <div class="row justify-content-start">
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
                <div class="panel-group" id="accordion">
                    <div class="panel">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"
                               aria-expanded="true">Posso cadastrar mais de um projeto na plataforma
                                Incentivados?</a>
                        </h4>
                        <div id="collapse1" class="panel-collapse collapse in">
                            <p>Sim. Depois de cadastrar a entidade na plataforma, os proponentes podem inscrever
                                quantos projetos quiserem desde que estejam homologados junto aos Ministérios e/ou
                                Conselhos de Direitos responsáveis.
                            </p>
                        </div>
                    </div>
                    <div class="panel">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Quais os canais que
                                podem ser utilizados para sanar dúvidas?</a>
                        </h4>
                        <div id="collapse2" class="panel-collapse collapse">
                            <p>Em casos de dúvidas, entre em contato através do telefone (11) 2389-5766 ou
                                comunicação@yabaconsultoria.com.br </p>
                        </div>
                    </div>
                    <div class="panel">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Quais documentos
                                são necessários para inscrever uma entidade? </a>
                        </h4>
                        <div id="collapse3" class="panel-collapse collapse">
                            <p>Para inscrever uma entidade devem ser submetidos a ata de eleição, o estatuto social,
                                a identidade do presidente e o cartão CNPJ da organização. </p>
                        </div>
                    </div>
                    <div class="panel">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Quais documentos
                                são necessários para inscrever um projeto?</a>
                        </h4>
                        <div id="collapse4" class="panel-collapse collapse">
                            <p>Para inscrever um projeto devem ser submetidos a proposta técnica, a proposta
                                orçamentária, a declaração de dados bancários e o diário oficial ou o certificado de
                                captação de recursos. </p>
                        </div>
                    </div>
                    <div class="panel">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">Qual o tempo de
                                avaliação do projeto inscrito na plataforma?</a>
                        </h4>
                        <div id="collapse5" class="panel-collapse collapse">
                            <p>Os projetos são avaliados conforme as regras de destinação de recursos de cada
                                empresa patrocinadora. </p>
                        </div>
                    </div>
                    <div class="panel">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">Existe um prazo
                                limite para inscrição do projeto?</a>
                        </h4>
                        <div id="collapse6" class="panel-collapse collapse">
                            <p>Não. Os projetos podem ser submetidos durante todo ano. Porém, é importante estar
                                atento (a) aos prazos de destinação de recursos de cada empresas patrocinadoras.
                            </p>
                        </div>
                    </div>
                    <div class="panel">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">Posso cadastrar um
                                projeto inscrito em leis estaduais/municipais?</a>
                        </h4>
                        <div id="collapse7" class="panel-collapse collapse">
                            <p>Sim. Podem ser cadastrados projetos inscritos nas leis de incentivo estaduais e
                                municipais. </p>
                        </div>
                    </div>
                    <div class="panel">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse8">Quais são os
                                percentuais de remuneração para a consultoria?</a>
                        </h4>
                        <div id="collapse8" class="panel-collapse collapse">
                            <p>De acordo com as respectivas legislações, segue tabela abaixo com os percentuais de
                                remuneração:
                            </p>
                            <img src="${path}/main/images/cases-img/tabela-fiscal.png" alt="tabela fiscal">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%--PERGUNTAS FREQUENTES--%>

<%--CAROSSEL DE PROJETOS--%>
<section class="section-padding bg-default client-area" id="client-page">
    <div class="container">
        <div class="row justify-content-end">
            <div class="col-xs-12 col-sm-6 col-sm-offset-3 text-center">
                <div class="page-title">
                    <h2 style="color: #FFFFFF;">Captar recursos é transformar sonhos em realidade.</h2>
                </div>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-xs-12">
                <div class="clients">
                    <div class="item">
                        <img src="${path}/main/images/cases-img/projeto1.jpg" alt="">
                        <div>
                            <p class="lead">1° Prêmio de Design Tomie Ohtake
                                Instituto Tomie Ohtake
                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/main/images/cases-img/projeto2.jpg" alt="">
                        <div>
                            <p class="lead">Novos Rumos
                                CEAP - Centro Educacional Assistencial Profissionalizante

                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/main/images/cases-img/projeto3.jpg" alt="">
                        <div>
                            <p class="lead">Cine Autorama Brazucah
                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/main/images/cases-img/projeto4.jpg" alt="">
                        <div>
                            <p class="lead">Doutores Cidadãos Canto Cidadão

                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/main/images/cases-img/projeto5.jpg" alt="">
                        <div>
                            <p class="lead">Primeiro Emprego
                                AFESU - Associação Feminina de Estudos Sociais e Universitários
                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/main/images/cases-img/projeto6.jpg" alt="">
                        <div>
                            <p class="lead">Programa Construcom
                                ITEVA - Instituto Tecnológico e Vocacional Avançado

                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/main/images/cases-img/projeto7.jpg" alt="">
                        <div>
                            <p class="lead">Equipes de Basquete em Cadeiras de Rodas
                                ADD - Associação Desportiva para Deficiente

                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/main/images/cases-img/projeto8.jpg" alt="">
                        <div>
                            <p class="lead">Fortaleza Cidade Amiga do Idoso
                                NUPROCE - Núcleo de Produções Culturais e Esportivas
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%--CAROSSEL DE PROJETOS--%>


<!--CONTATO-->
<footer class="footer-area relative sky-bg" id="contact-page">
    <div class="absolute "></div>
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-sm-offset-3 text-center">
                    <div class="page-title">
                        <h2 style="color:white">Contate-nos</h2>
                        <p style="color:white">Caso tenha qualquer duvida ou sugestão, entre em contato conosco</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-md-4">
                    <address class="side-icon-boxes">
                        <div class="side-icon-box">
                            <div class="side-icon">
                                <img src="${path}/main/images/location-arrow.png" alt="">
                            </div>
                            <p><strong>Endereço</strong>Rua Vicente Lotti, 37<br/>Vila Ema - São Paulo - SP,
                                03282-060</p>
                        </div>
                        <div class="side-icon-box">
                            <div class="side-icon">
                                <img src="${path}/main/images/phone-arrow.png" alt="">
                            </div>
                            <p><strong>Telefone </strong>
                                <a href="#">(11)2389-5766</a> <br/>
                            </p>
                        </div>
                        <div class="side-icon-box">
                            <div class="side-icon">
                                <img src="${path}/main/images/mail-arrow.png" alt="">
                            </div>
                            <p><strong>E-mail: </strong>
                                <a href="#">comunicacao@yabaconsultoria.com.br</a> <br/>
                            </p>
                        </div>
                    </address>
                </div>
                <div class="col-xs-12 col-md-8">
                    <form action="process.php" id="contact-form" method="post" class="contact-form">
                        <div class="form-double">
                            <input type="text" id="form-name" name="form-name" placeholder="Nome"
                                   class="form-control" required="required">
                            <input type="email" id="form-email" name="form-email" class="form-control"
                                   placeholder="Email" required="required">
                        </div>
                        <input type="text" id="form-subject" name="form-subject" class="form-control"
                               placeholder="Assunto ">
                        <textarea name="message" id="form-message" name="form-message" rows="5" class="form-control"
                                  placeholder="Escreve sua mensagem" required="required"></textarea>
                        <button type="sibmit" class="button">Enviar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-middle">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 pull-right">
                    <ul class="social-menu text-right x-left">
                        <li><a href="#"><i class="ti-facebook"></i></a></li>
                        <li><a href="#"><i class="ti-twitter"></i></a></li>
                    </ul>
                </div>
                <div class="col-xs-12 col-sm-6">
                    <p>Acompanhe a gente nas redes sociais</p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-center">
                    <p>&copy;Copyright 2019 Todos os direitos reservados Yaba Consultoria</p>
                </div>
            </div>
        </div>
    </div>
</footer>
<%--CONTATO--%>

<script>
    function typeWriter(elemento) {
        const textoArray = elemento.innerHTML.split('');
        elemento.innerHTML = '';
        textoArray.forEach((letra, i) => {
            setTimeout(() =>
                elemento.innerHTML += letra, 100 * i
            );
        });
    }

    const titulo = document.querySelector('.h2');
    typeWriter(titulo);
</script>


<!--Vendor-JS-->
<script src="${path}/main/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${path}/main/js/vendor/bootstrap.min.js"></script>
<!--Plugin-JS-->
<script src="${path}/main/js/owl.carousel.min.js"></script>
<script src="${path}/main/js/contact-form.js"></script>
<script src="${path}/main/js/jquery.parallax-1.1.3.js"></script>
<script src="${path}/main/js/scrollUp.min.js"></script>
<script src="${path}/main/js/magnific-popup.min.js"></script>
<script src="${path}/main/js/wow.min.js"></script>
<!-- WOW-JS -->
<!--Main-active-JS-->
<script src="${path}/main/js/script.js"></script>
</body>

</html>