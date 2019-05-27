<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Modal Login Permitido-->
<div class="modal fade" id="modal-indicacao" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Indicar Projeto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="${path}/painel/projetos/indicar" method="post" acceptcharset="UTF-8"> 
        <div class="modal-body">
          <input type="hidden" id="id-projeto" name="projetoId">
          <label>Selecione a empresa para qual você deseja indicar este projeto:</label>
          <select class="selectpicker form-control" name="empresaId" title="Selecione ..." data-live-search="true" data-style="btn-neutral" required>
            <c:forEach var="empresa" items="${empresas}">
              <c:choose>
                <c:when test = "${empresa.indicacao}">
                  <option disabled >${empresa.nomeFantasia}</option>
                </c:when>
                <c:otherwise>
                  <option value="${empresa.id}">${empresa.nomeFantasia}</option>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </select>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Sim</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Não</button>
        </div>
      </form>
    </div>
  </div>
</div>