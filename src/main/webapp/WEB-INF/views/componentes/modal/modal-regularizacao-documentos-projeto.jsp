<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Modal Alterar Senha-->
<div class="modal fade" id="modal-regularizacao-documentos-projeto" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header bg-blue">
                <h5 class="modal-title text-white"><strong>REGULARIZAÇÃO DE DOCUMENTOS</strong></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${path}/painel/projetos/${projeto.id}/documentos/reenviar" method="post"
                  enctype="multipart/form-data" acceptcharset="UTF-8">
                <input type="hidden" name="id" value="${projeto.documentosProjeto.id}">
                <div class="modal-body" style="overflow-y: auto;">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label><strong>O sistema apresentou as seguintes observações referente a sua
                                    documentação:</strong></label>
                                <textarea class="form-control text-justify" name="analise" rows="7" maxlength="3000"
                                          placeholder=""
                                          readonly>${projeto.documentosProjeto.pareceresDocumentacao[0].analise}</textarea>
                            </div>
                            <fieldset class="mt-2 mb-2">
                                <p><strong>Para regularizar, faça uma nova submissão do(s) documento(s) abaixo:</strong>
                                </p>
                                <div class="row justify-content-start'">
                                    <c:if test="${projeto.documentosProjeto.logo.status eq 'NEGADO'}">
                                        <input type="hidden" name="logo.id"
                                               value="${projeto.documentosProjeto.logo.id}">
                                        <div class="col-xl-6 text-center pt-3">
                                            <div class="form-group">
                                                <label for="logo"><i class="far fa-file-image text-primary"
                                                                     style="font-size: 56px;"></i></label>
                                                <hr>
                                                <h5 class="text-center">Logo</h5>
                                                <input type="file" id="logo" name="logo.file"
                                                       onchange="validaImg(this, this.id)" required>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${projeto.documentosProjeto.propostaTecnica.status eq 'NEGADO'}">
                                        <input type="hidden" name="propostaTecnica.id"
                                               value="${projeto.documentosProjeto.propostaTecnica.id}">
                                        <div class="col-xl-6 text-center pt-3">
                                            <div class="form-group">
                                                <label for="propostaTecnica"><i class="far fa-file-pdf text-primary"
                                                                                style="font-size: 56px;"></i></label>
                                                <hr>
                                                <h5 class="text-center">Proposta Técnica</h5>
                                                <input type="file" id="propostaTecnica" name="propostaTecnica.file"
                                                       onchange="validaPdf(this, this.id)" required>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${projeto.documentosProjeto.propostOrcamentaria.status eq 'NEGADO'}">
                                        <input type="hidden" name="propostOrcamentaria.id"
                                               value="${projeto.documentosProjeto.propostOrcamentaria.id}">
                                        <div class="col-xl-6 text-center pt-3">
                                            <div class="form-group">
                                                <label for="propostOrcamentaria"><i class="far fa-file-pdf text-primary"
                                                                                    style="font-size: 56px;"></i></label>
                                                <hr>
                                                <h5 class="text-center">Planilha Orçamentária</h5>
                                                <input type="file" id="propostOrcamentaria"
                                                       name="propostOrcamentaria.file"
                                                       onchange="validaImgPdf(this, this.id)" required>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${projeto.documentosProjeto.certificado.status eq 'NEGADO'}">
                                        <input type="hidden" name="certificado.id"
                                               value="${projeto.documentosProjeto.certificado.id}">
                                        <div class="col-xl-6 text-center pt-3">
                                            <div class="form-group">
                                                <label for="certificado"><i class="far fa-file-pdf text-primary"
                                                                            style="font-size: 56px;"></i></label>
                                                <hr>
                                                <h5 class="text-center">Certificado</h5>
                                                <input type="file" id="certificado" name="certificado.file"
                                                       onchange="validaImgPdf(this, this.id)" required>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${projeto.documentosProjeto.dadosBancariosFundo.status eq 'NEGADO'}">
                                        <input type="hidden" name="dadosBancariosFundo.id"
                                               value="${projeto.documentosProjeto.dadosBancariosFundo.id}">
                                        <div class="col-xl-6 text-center pt-3">
                                            <div class="form-group">
                                                <label for="dadosBancariosFundo"><i class="far fa-file-pdf text-primary"
                                                                                    style="font-size: 56px;"></i></label>
                                                <hr>
                                                <h5 class="text-center">Dados Bancários do Fundo</h5>
                                                <input type="file" id="dadosBancariosFundo"
                                                       name="dadosBancariosFundo.file"
                                                       onchange="validaImgPdf(this, this.id)" required>
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