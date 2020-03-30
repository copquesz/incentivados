<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Modal Alterar Senha-->
<div class="modal fade" id="modal-alterar-senha" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-blue">
        <h5 class="modal-title"><strong>ALTERAR SENHA</strong></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="${path}/usuarios/alterar-senha" method="post" acceptcharset="UTF-8">
        <div class="modal-body">                  
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                  <label><strong>Informe a sua nova senha:</strong></label>
                  <p>
                    <small><strong style="color: red;">Obrigatório o uso de no mínimo 6 caracteres.</br> Para sua segurança, recomendamos o uso de senhas alfanuméricas em conjunto com símbolos.</strong></small>
                  </p>                  
                  <input type="password" class="form-control" name="novaSenha" required>
              </div>
            </div>
            <div class="col-12">
            </div>
          </div>        
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-info">Enviar</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
        </div>
      </form>
    </div>
  </div>
</div>