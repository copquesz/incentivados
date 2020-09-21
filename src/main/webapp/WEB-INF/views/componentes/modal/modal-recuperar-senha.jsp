<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Modal Recuperar Senha -->
<div class="modal fade" id="modal-recuperar-senha" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header bg-blue">
                <h5 class="modal-title">RECUPERAR SENHA</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${path}/usuarios/recuperar-senha" method="post" acceptcharset="UTF-8">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12">
                            <p>Informe o e-mail de acesso ao painel no campo abaixo para redefinir sua senha.</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label>E-mail:</label>
                                <input type="email" class="form-control" name="email" required
                                       style="text-transform: lowercase;">
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