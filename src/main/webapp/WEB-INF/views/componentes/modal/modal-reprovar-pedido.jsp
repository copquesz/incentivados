<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Modal Aprovar Pedido -->
<div class="modal fade" id="modal-reprovar-pedido" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
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
                            <textarea class="form-control text-justify" name="avaliacao"
                                      rows="8">Prezado(a), ${pedido.usuario.nome}. Obrigado(a) por cadastrar seus dados e registrar o pedido em nossa plataforma! Sabemos que os produtos e materiais de construção são fundamentais para garantir a qualidade do atendimento social. A sua solicitação foi avaliada pelo Comitê Interno e, neste momento, não foi possível atendê-la. Destacamos que a entidade ficará registrada em nosso banco de dados e caso surjam oportunidades em ocasiões futuras, entraremos em contato. A plataforma está disponível o ano inteiro para recepcionar futuros pedidos de doação, cadastros de projetos incentivados ou pedidos de patrocínio.</textarea>
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