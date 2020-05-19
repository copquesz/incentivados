<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Modal Login Permitido-->
<div class="modal fade" id="modal-welcome" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-blue">
        <h5 class="modal-title" style="color: #fff"><strong>BEM VINDO!</strong></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="" method="post" acceptcharset="UTF-8">
        <div class="modal-body">
          <div class="row">
            <div class="col-12 text-justify">
              <p>Olá, ${usuario.nome}.</p> 
              <p>Seja bem-vindo à Plataforma Incentivados da Claro.</p>
              <p>Para ter uma ótima experiência por aqui, preparamos um tutorial com informações sobre como navegar e suas funcionalidades.</p>
              <p>Nesta sua primeira visita você pode acessá-lo clicando no no botão abaixo. E, sempre que precisar pelo menu de navegação no canto esquerdo no item <strong style="color: #ED1C24;">TUTORIAL</strong>.
              <p>Ficamos felizes em ter você por aqui!</p>
              <p><small>Em caso de dúvida ou dificuldades entre em contato com o e-mail: <strong>claro@incentivados.com.br</strong>.</small>
            </div>
          </div> 
        </div>
        <div class="modal-footer">
          <a href="${path}/documentos/manual-do-usuario.pdf" class="btn btn-info" target="_blank">Acessar</a>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
        </div>
      </form>
    </div>
  </div>
</div>