<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Modal Login Permitido-->
<div class="modal fade" id="modal-aprovar-pedido" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-info">
        <h5 class="modal-title">Aprovar Pedido <strong>#${pedido.id}</strong></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="${path}/painel/pedido/${pedido.id}/avaliar" method="post" acceptcharset="UTF-8"> 
        <div class="modal-body">          
          <input type="hidden" name="status" value="APROVADO">
          <p>Você deseja realmente aprovar este pedido?</p>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Sim</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Não</button>
        </div>
      </form>
    </div>
  </div>
</div>