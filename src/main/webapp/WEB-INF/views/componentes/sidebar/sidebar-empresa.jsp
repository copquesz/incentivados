<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="sidebar" data-color="verde" data-active-color="info">
    <div class="logo">
        <a href="http://www.creative-tim.com" class="simple-text logo-mini">
            <div class="logo-image-small">
                <%--        <img src="${path}/assets/img/user-avatar.png">--%>
                <i class="far fa-user"></i>
            </div>
        </a>
        <a href="${path}/painel/perfil" class="text-white">Bem vindo, ${usuario.nome}.</a>
    </div>
    <div class="sidebar-wrapper">
        <ul class="nav">
            <li class="">
                <a href="${path}/painel/dashboard"><i class="fas fa-desktop"></i>Painel Principal</a>
            </li>
            <li>
                <a href="${path}/painel/analistas"><i class="fas fa-desktop"></i>Analistas</a>
            </li>
        </ul>
    </div>
</div>