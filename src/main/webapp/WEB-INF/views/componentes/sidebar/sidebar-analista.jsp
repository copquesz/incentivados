<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="sidebar" data-color="black" data-active-color="info">
  <div class="logo">
    <a href="#" class="simple-text logo-mini">
      <div class="logo-image-small">
        <img src="${path}/assets/img/user-avatar.png">
      </div>
    </a>
    <a href="${path}/painel/perfil" class="logo-normal">Bem vindo, ${usuario.nome}.</a>
  </div>
  <div class="sidebar-wrapper">
    <ul class="nav">
      <li class="active ">
        <a href="${path}/painel/dashboard">
          <i class="fas fa-desktop"></i>
          Painel Principal
        </a>
      </li>
    </ul>
  </div>
</div>