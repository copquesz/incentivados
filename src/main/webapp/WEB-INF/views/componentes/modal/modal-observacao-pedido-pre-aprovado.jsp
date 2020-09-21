<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Modal Observação Pedido Pré-Aprovado -->
<c:forEach var="modalPedidoPreAprovado" items="${preAprovados.content}">
    <form action="${path}/painel/pedido/${modalPedidoPreAprovado.id}/nota-fiscal" method="post"
          enctype="multipart/form-data" acceptcharset="UTF-8">
        <div class="modal fade" id="modal-observacao-pedido-pre-aprovado-${modalPedidoPreAprovado.id}" tabindex="-1"
             role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-info">
                        <h5 class="modal-title">Relatório de Pedido <strong>#${modalPedidoPreAprovado.id}</strong></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-12">
                                <c:if test="${usuario.tipoUsuario.id != 0}">
                                    <label><strong>Data de Análise:</strong></label>
                                    <p class="text-justify"><fmt:formatDate type="both" dateStyle="short"
                                                                            timeStyle="short"
                                                                            value="${modalPedidoPreAprovado.observacaoPedido.dataCadastro}"/></p>
                                    <hr>
                                </c:if>
                                <c:if test="${usuario.tipoUsuario.id != 0}">
                                    <label><strong>Analisado por:</strong></label>
                                    <p class="text-justify">${modalPedidoPreAprovado.observacaoPedido.usuario.nome} ${modalPedidoPreAprovado.observacaoPedido.usuario.sobrenome}</p>
                                    <hr>
                                </c:if>
                                <label><strong>Parecer:</strong></label>
                                <p class="text-justify">${modalPedidoPreAprovado.observacaoPedido.avaliacao}</p>
                                <hr>
                                <div class="row justify-content-start">
                                    <div class="col-md-12 mt-3">
                                        <div class="form-group">
                                            <h5>Submeter Nota Fiscal: </h5>
                                            <input type="file" id="nota-fiscal" name="notaFiscal"
                                                   onchange="validaPdf(this, this.id)" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary float-right"><i class="far fa-share-square"></i>
                            Enviar
                        </button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</c:forEach>