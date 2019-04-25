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
      <li class="active">
        <a href="${path}/painel/dashboard">
          <i class="nc-icon nc-bank"></i>
          Painel Principal
        </a>        
      </li>
      <li>
        <a href="${path}/painel/empresas">
          <i class="fas fa-city"></i>
          Empresas
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
      <li>
      	<a href="${path}/painel/incentivos-fiscais">
          <i class="fas fa-gavel"></i>
          Incentivos Fiscais
        </a>
      </li>
      <li>
      	<a href="${path}/painel/pedidos">
          <i class="fas fa-praying-hands"></i>
          Pedidos
        </a>
      </li>
    </ul>
  </div>
</div>