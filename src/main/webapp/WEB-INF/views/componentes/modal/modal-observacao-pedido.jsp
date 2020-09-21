<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Modal Observação Pedido -->
<c:forEach var="modalPedido" items="${pedidos.content}">
    <div class="modal fade" id="modal-observacao-pedido-${modalPedido.id}" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-info">
                    <h5 class="modal-title">Relatório de Pedido <strong>#${modalPedido.id}</strong></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12">
                            <c:if test="${usuario.tipoUsuario.id != 0}">
                                <label><strong>Data de Análise:</strong></label>
                                <p class="text-justify"><fmt:formatDate type="both" dateStyle="short" timeStyle="short"
                                                                        value="${modalPedido.observacaoPedido.dataCadastro}"/></p>
                                <hr>
                            </c:if>
                            <c:if test="${usuario.tipoUsuario.id != 0}">
                                <label><strong>Analisado por:</strong></label>
                                <p class="text-justify">${modalPedido.observacaoPedido.usuario.nome} ${modalPedido.observacaoPedido.usuario.sobrenome}</p>
                                <hr>
                            </c:if>
                            <label><strong>Parecer:</strong></label>
                            <p class="text-justify">${modalPedido.observacaoPedido.avaliacao}</p>
                            <c:if test="${modalPedido.status.id == 2}">
                                <p class="my-3"><a href="#"><i class="fas fa-file-invoice-dollar"></i> <strong>Baixar
                                    Nota Fiscal</strong> </a></p>
                            </c:if>
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