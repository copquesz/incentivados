<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Modal Login Permitido-->
<div class="modal fade" id="modal-reprovar-pedido" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-info">
        <h5 class="modal-title">Recusar Pedido <strong>#${pedido.id}</strong></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="${path}/painel/pedido/${pedido.id}/avaliar" method="post" acceptcharset="UTF-8"> 
        <div class="modal-body">          
          <input type="hidden" name="status" value="RECUSADO">
          <div class="row">
            <div class="col-12">
              <label>Informe o motivo pelo qual está recusando o pedido:</label>
              <textarea class="form-control" name="avaliacao" rows="5"></textarea>
            </div>
          </div>          
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">OK</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
        </div>
      </form>
    </div>
  </div>
</div>