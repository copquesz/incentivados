<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Modal Login Permitido-->
<div class="modal fade" id="modal-inscricoes-encerradas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-blue">
        <h5 class="modal-title" style="color: #fff"><strong>Inscrições Encerradas!</strong></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="" method="post" acceptcharset="UTF-8">
        <div class="modal-body">
          <div class="row">
            <div class="col-12 text-justify">
              <p>Olá, ${usuario.nome}.</p> 
              <p>O processo de inscrições de projetos está encerrado desde de 15/08/2020 - 23:59:59.</p>
              <p>A partir de agora a equipe Incentivados em conjunto com a Leroy Merlin dará sequência aos trâmites de triagem dos projetos, orientando-lhes referente a documentação que será encaminhada para o comitê de compliance.</p>
              <p>Entraremos em contato via e-mail referente ao processo de seleção.</p>
              <p>Em caso de dúvidas entre em contato com o e-mail: <strong>leroymerlin@yabaconsultoria.com.br</strong>.
            </div>
          </div> 
        </div>
        <div class="modal-footer">          
          <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
        </div>
      </form>
    </div>
  </div>
</div>