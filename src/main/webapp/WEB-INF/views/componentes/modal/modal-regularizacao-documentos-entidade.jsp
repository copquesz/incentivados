<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Modal Alterar Senha-->
<div class="modal fade" id="modal-regularizacao-documentos-entidade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-blue">
        <h5 class="modal-title text-white"><strong>REGULARIZAÇÃO DE DOCUMENTOS</strong></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="${path}/painel/entidades/${entidade.id}/documentos/reenviar" method="post" enctype="multipart/form-data" acceptcharset="UTF-8">
        <input type="hidden" name="id" value="${entidade.documentosEntidade.id}">
        <div class="modal-body" style="overflow-y: auto;">                  
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label><strong>O sistema apresentou as seguintes observações referente a sua documentação:</strong></label>             
                <textarea class="form-control text-justify" name="analise" rows="7" maxlength="3000" placeholder="" readonly>${entidade.documentosEntidade.pareceresDocumentacao[0].analise}</textarea>
              </div>
              <fieldset class="mt-2 mb-2">
                <p><strong>Para regularizar, faça uma nova submissão do(s) documento(s) abaixo:</strong></p>
                <div class="row justify-content-start'">
                  <c:if test="${entidade.documentosEntidade.logo.status eq 'NEGADO'}">
                    <input type="hidden" name="logo.id" value="${entidade.documentosEntidade.logo.id}">
                    <div class="col-xl-6 text-center pt-3">
                        <div class="form-group">
                            <label for="logo"><i class="far fa-file-image text-primary" style="font-size: 56px;"></i></label>
                            <hr>
                            <h5 class="text-center">Logo</h5>
                            <input type="file" id="logo" name="logo.file" onchange="validaImg(this, this.id)" required>
                        </div>
                    </div>                  
                  </c:if>
                  <c:if test="${entidade.documentosEntidade.ataEleicao.status eq 'NEGADO'}">
                    <input type="hidden" name="ataEleicao.id" value="${entidade.documentosEntidade.ataEleicao.id}">
                    <div class="col-xl-6 text-center pt-3">
                        <div class="form-group">
                            <label for="ataEleicao"><i class="far fa-file-pdf text-primary" style="font-size: 56px;"></i></label>
                            <hr>
                            <h5 class="text-center">Ata de Eleição</h5>
                            <input type="file" id="ataEleicao" name="ataEleicao.file" onchange="validaPdf(this, this.id)" required>
                        </div>
                    </div>                  
                  </c:if>
                  <c:if test="${entidade.documentosEntidade.estatutoSocial.status eq 'NEGADO'}">
                    <input type="hidden" name="estatutoSocial.id" value="${entidade.documentosEntidade.estatutoSocial.id}">
                    <div class="col-xl-6 text-center pt-3">
                        <div class="form-group">
                            <label for="estatutoSocial"><i class="far fa-file-pdf text-primary" style="font-size: 56px;"></i></label>
                            <hr>
                            <h5 class="text-center">Estatuto Social ou Contrato Social</h5>
                            <input type="file" id="estatutoSocial" name="estatutoSocial.file" onchange="validaPdf(this, this.id)" required>
                        </div>
                    </div>
                  </c:if>
                  <c:if test="${entidade.documentosEntidade.identidade.status eq 'NEGADO'}">
                    <input type="hidden" name="identidade.id" value="${entidade.documentosEntidade.identidade.id}">
                    <div class="col-xl-6 text-center pt-3">
                        <div class="form-group">
                            <label for="identidade"><i class="far fa-file-pdf text-primary" style="font-size: 56px;"></i></label>
                            <hr>
                            <h5 class="text-center">Identidade Presidente</h5>
                            <input type="file" id="identidade" name="identidade.file" onchange="validaImgPdf(this, this.id)" required>
                        </div>
                    </div>
                  </c:if>
                  <c:if test="${entidade.documentosEntidade.cartaoCnpj.status eq 'NEGADO'}">
                    <input type="hidden" name="cartaoCnpj.id" value="${entidade.documentosEntidade.cartaoCnpj.id}">
                    <div class="col-xl-6 text-center pt-3">
                        <div class="form-group">
                            <label for="cartaoCnpj"><i class="far fa-file-pdf text-primary" style="font-size: 56px;"></i></label>
                            <hr>
                            <h5 class="text-center">Cartão CNPJ</h5>
                            <input type="file" id="cartaoCnpj" name="cartaoCnpj.file" onchange="validaImgPdf(this, this.id)" required>
                        </div>
                    </div>
                  </c:if>
                  <c:if test="${entidade.documentosEntidade.dadosBancarios.status eq 'NEGADO'}">
                    <input type="hidden" name="dadosBancarios.id" value="${entidade.documentosEntidade.dadosBancarios.id}">
                    <div class="col-xl-6 text-center pt-3">
                        <div class="form-group">
                            <label for="dadosBancarios"><i class="far fa-file-pdf text-primary" style="font-size: 56px;"></i></label>
                            <hr>
                            <h5 class="text-center">Dados Bancários</h5>
                            <input type="file" id="dadosBancarios" name="dadosBancarios.file" onchange="validaImgPdf(this, this.id)" required>
                        </div>
                    </div>
                  </c:if>
                </div>
              </fieldset>
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