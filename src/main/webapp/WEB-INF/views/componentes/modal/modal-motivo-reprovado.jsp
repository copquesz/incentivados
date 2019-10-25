<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Modal Motivo Recusado -->
<c:forEach var="modalMotivoReprovado" items="${recusados}">
  <div class="modal fade" id="modal-motivo-reprovado-${modalMotivoReprovado.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header bg-info">
          <h5 class="modal-title text-white">Relatório de Pedido <strong>#${modalMotivoReprovado.id}</strong></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>      
        <div class="modal-body">
          <div class="row">
            <div class="col-12">
              <c:if test = "${usuario.tipoUsuario.id != 0}">
                <label><strong>Data de Análise:</strong></label>
                <p class="text-justify"><fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${modalMotivoReprovado.observacaoPedido.dataCadastro}"/></p>
                <hr>
              </c:if>
              <c:if test = "${usuario.tipoUsuario.id != 0}">
                <label><strong>Analisado por:</strong></label>
                <p class="text-justify">${modalMotivoReprovado.observacaoPedido.usuario.nome} ${modalMotivoReprovado.observacaoPedido.usuario.sobrenome}</p>
                <hr>
              </c:if>
              <label><strong>Motivo:</strong></label>
              <p class="text-justify">${modalMotivoReprovado.observacaoPedido.avaliacao}</p>
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