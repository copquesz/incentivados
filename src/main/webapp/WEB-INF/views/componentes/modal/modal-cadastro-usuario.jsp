<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Modal Login Permitido-->
<div class="modal fade" id="modal-cadastro-usuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header bg-blue">
                <h5 class="modal-title text-white">REGISTRAR-SE</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span style="color: white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${path}/usuarios/cadastro" method="post" acceptcharset="UTF-8">
                <div class="modal-body">
                    <input type="hidden" name="redirect" value="${redirect}">
                    <input type="hidden" name="tipoUsuario" value="ENTIDADE">
                    <fieldset>
                        <legend>Informações Gerais:</legend>
                        <div class="row mt-3 mt-3">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Nome:</label>
                                    <input type="text" class="form-control" name="nome" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Sobrenome:</label>
                                    <input type="text" class="form-control" name="sobrenome" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <label>CPF:</label>
                                    <input type="text" class="form-control" id="cpf" name="cpf"
                                           onchange="if(!validarCPF(this.value)){alert('CPF inválido!'); this.value='';}"
                                           required>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label>E-mail:</label>
                                    <input type="email" class="form-control" name="email" required>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label>Telefone:</label>
                                    <input type="text" class="form-control" id="telefone" name="telefone" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="form-group">
                                    <label>Senha de Acesso à Plataforma:</label>
                                    <input type="password" class="form-control" name="senha" required minlength="6">
                                </div>
                            </div>
                        </div>
                    </fieldset>

                    <hr>

                    <fieldset class="mt-3 mt-3">
                        <legend>Endereço:</legend>
                        <div class="row">
                            <div class="col-sm-6 col-md-4">
                                <div class="form-group">
                                    <label>CEP:</label>
                                    <input type="text" class="form-control" id="cep" name="endereco.cep" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-10 col-md-7">
                                <div class="form-group">
                                    <label>Logradouro:</label>
                                    <input type="text" class="form-control" id="logradouro" name="endereco.logradouro"
                                           required>
                                </div>
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <div class="form-group">
                                    <label>Nº:</label>
                                    <input type="text" class="form-control" name="endereco.numero">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="form-group">
                                    <label>Complemento:</label>
                                    <input type="text" class="form-control" name="endereco.complemento">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-4">
                                <div class="form-group">
                                    <label>Bairro:</label>
                                    <input type="text" class="form-control" id="bairro" name="endereco.bairro" required>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div class="form-group">
                                    <label>Cidade</label>
                                    <input type="text" class="form-control" id="cidade" name="endereco.cidade" required>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div class="form-group">
                                    <label>Estado:</label>
                                    <select class="form-control" id="estado" name="endereco.estado" required>
                                        <option value="Não Informado">Selecione um Estado</option>
                                        <option value="Acre">Acre</option>
                                        <option value="Alagoas">Alagoas</option>
                                        <option value="Amapá">Amapá</option>
                                        <option value="Amazonas">Amazonas</option>
                                        <option value="Bahia">Bahia</option>
                                        <option value="Ceará">Ceará</option>
                                        <option value="Distrito Federal">Distrito Federal</option>
                                        <option value="Espírito Santo">Espírito Santo</option>
                                        <option value="Goiás">Goiás</option>
                                        <option value="Maranhão">Maranhão</option>
                                        <option value="Mato Grosso">Mato Grosso</option>
                                        <option value="Mato Grosso do Sul">Mato Grosso do Sul</option>
                                        <option value="Minas Gerais">Minas Gerais</option>
                                        <option value="Pará">Pará</option>
                                        <option value="Paraíba">Paraíba</option>
                                        <option value="Paraná">Paraná</option>
                                        <option value="Pernambuco">Pernambuco</option>
                                        <option value="Piauí">Piauí</option>
                                        <option value="Rio de Janeiro">Rio de Janeiro</option>
                                        <option value="Rio Grane do Norte">Rio Grande do Norte</option>
                                        <option value="Rio Grande do Sul">Rio Grande do Sul</option>
                                        <option value="Rondônia">Rondônia</option>
                                        <option value="Roraima">Roraima</option>
                                        <option value="Santa Catarina">Santa Catarina</option>
                                        <option value="São Paulo">São Paulo</option>
                                        <option value="Sergipe">Sergipe</option>
                                        <option value="Tocantins">Tocantins</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="su" class="btn btn-info">Cadastrar</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                </div>
            </form>
        </div>
    </div>
</div>