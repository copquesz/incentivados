<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Modal Observação Pedido -->
<c:forEach var="modalPedidoPreAprovadoUsuario" items="${pedidos.content}">
  <div class="modal fade" id="modal-observacao-pedido-pre-aprovado-admin-${modalPedidoPreAprovadoUsuario.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header bg-info">
          <h5 class="modal-title text-white">Relatório de Pedido <strong>#${modalPedidoPreAprovadoUsuario.id}</strong></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>      
        <div class="modal-body">
          <div class="row">
            <div class="col-12">
              <p class="text-justify"><strong>Este pedido foi pré-aprovado. A partir de agora é necessário aguardar os trâmites internos para finalizarmos o processo de aprovação.</strong></p>
            </div>
          </div>
          <hr>
          <div class="row">
            <div class="col-12">
              <c:if test = "${usuario.tipoUsuario.id != 0}">
                <label><strong>Data de Análise:</strong></label>
                <p class="text-justify"><fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${modalPedidoPreAprovadoUsuario.observacaoPedido.dataCadastro}"/></p>
                <hr>          
                <label><strong>Analisado por:</strong></label>
                <p class="text-justify">${modalPedidoPreAprovadoUsuario.observacaoPedido.usuario.nome} ${modalPedidoPreAprovadoUsuario.observacaoPedido.usuario.sobrenome}</p>   
                <hr>           
              </c:if>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <label><strong>Parecer:</strong></label>
              <p class="text-justify">${modalPedidoPreAprovadoUsuario.observacaoPedido.avaliacao}</p>
            </div>
          </div>          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
        </div>      
      </div>
    </div>
  </div>
</c:forEach>