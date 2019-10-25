<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Modal Login Permitido-->
<div class="modal fade" id="modal-ods" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-white">Adicionar Selo ODS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="${path}/painel/projetos/ods" method="post" acceptcharset="UTF-8"> 
        <div class="modal-body">
          <input type="hidden" name="projetoId" value="${projeto.id}">
          <label>Selecione ODS que deseja adicionar neste projeto:</label>
          <select class="selectpicker form-control" name="ods" title="Selecione ..." multiple data-live-search="true" data-style="btn-neutral" required>
            <c:forEach var="listaOds" items="${listaOds}">
              <c:set var = "existsOds" value = "false"/>
              <c:forEach var="projetoOds" items="${projeto.ods}">
                <c:if test = "${listaOds.id eq projetoOds.id}">
                  <c:set var = "existsOds" value = "true"/>
                </c:if>
              </c:forEach>
              <c:if test = "${existsOds}">
                <option value="${listaOds}" style="background-color: #e74c3c; color: #fff; font-weight: bold; border-radius: 0%; border: 1px solid #fff;" disabled>${listaOds.id + 1} - ${listaOds.descricao}</option>
              </c:if>
              <c:if test = "${!existsOds}">
                <option value="${listaOds}">${listaOds.id + 1} - ${listaOds.descricao}</option>
              </c:if>
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