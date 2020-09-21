<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Modal CPF Inválido -->
<div class="modal fade" id="modal-cpf-invalido" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgba(255, 0, 0, 0.3);">
                <h5 class="modal-title">CPF INVÁLIDO</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>O CPF digitado não é válido.<br>Verifique os dados informados e digite novamente.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-alert" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>