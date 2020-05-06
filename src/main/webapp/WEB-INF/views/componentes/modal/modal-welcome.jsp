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
              <p>Seja muito bem vindo à Plataforma Incentivados - Leroy Merlin.</p>
              <p>Ficamos muito felizes em saber que temos você conosco e para te garantir uma boa experiência na navegabilidade em nossa plataforma, nós preparamos um tutorial que irá auxiliá-lo nas funcionalidades. Para acessá-lo, clique no botão abaixo ou você pode acessá-lo à qualquer momento em seu menu de navegação do canto esquerdo no item <strong style="color: #72bf44"><i class="far fa-question-circle"></i> TUTORIAL</strong>.</p>
              <p><small>Em caso de alguma dúvida ou dificuldades entre em contato com o e-mail: <strong>leroymerlin@yabaconsultoria.com.br</strong>.</small>
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