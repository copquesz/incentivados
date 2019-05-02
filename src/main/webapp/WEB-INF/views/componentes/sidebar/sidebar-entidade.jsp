<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="sidebar" data-color="verde" data-active-color="info">
  <div class="logo">
    <a href="#" class="simple-text logo-mini">
      <div class="logo-image-small">
<%--        <img src="${path}/assets/img/user-avatar.png" style="color: #00bbff">--%>
  <i class="far fa-user"></i>
      </div>
    </a>
    <a href="${path}/painel/perfil" class="text-white">Bem vindo, ${usuario.nome}.</a>
  </div>
  <div class="sidebar-wrapper">
    <ul class="nav">
      <li class="">
        <a href="${path}/painel/dashboard">
          <i class="fas fa-desktop"></i>
          Painel Principal
        </a>
      </li>
      <li>
        <a href="${path}/painel/entidades">
          <i class="fas fa-users"></i>
          Entidades
        </a>
      </li>
      <li>
        <a href="${path}/painel/projetos">
          <i class="fas fa-project-diagram"></i>
          Projetos
        </a>
      </li>
    </ul>
  </div>
</div>