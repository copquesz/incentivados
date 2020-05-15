package br.com.incentivados.service;

import br.com.incentivados.model.Empresa;
import br.com.incentivados.model.Projeto;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.repository.EmpresaRepository;
import br.com.incentivados.utility.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class EmpresaService {
    private EmpresaRepository empresaRepository;

    @Autowired
    public EmpresaService(EmpresaRepository empresaRepository) {
        this.empresaRepository = empresaRepository;
    }

    public Empresa save(Empresa empresa, Usuario usuario, HttpServletRequest request) {
        empresa.setDataCadastro(new Date());
        empresa.setUsuario(usuario);
        empresa = this.uploadDocumentos(empresa, request);
        empresa = this.empresaRepository.save(empresa);
        return empresa;
    }

    public boolean existsbyCnpj(String cnpj) {
        return this.empresaRepository.existsByCnpj(cnpj);
    }

    public boolean isIndicacao(Empresa empresa, Projeto projeto) {
        return this.empresaRepository.isIndicacao(empresa.getId(), projeto.getId()) != 0L;
    }

    public Empresa adcionaAnalista(Empresa empresa, Usuario usuario) {
        empresa.getAnalistas().add(usuario);
        return this.empresaRepository.save(empresa);
    }

    public Empresa adicionaResponsavel(Empresa empresa, Usuario usuario) {
        empresa.getResponsaveis().add(usuario);
        return this.empresaRepository.save(empresa);
    }

    public Empresa adicionaProjeto(Empresa empresa, Projeto projeto) {
        empresa.getProjetos().add(projeto);
        return this.empresaRepository.save(empresa);
    }

    public Optional<Empresa> findById(Long id) {
        return this.empresaRepository.findById(id);
    }

    public Optional<Empresa> findByCnpj(String cnpj) {
        return this.empresaRepository.findByCnpj(cnpj);
    }

    public List<Empresa> findAll() {
        return this.empresaRepository.findAll();
    }

    public Page<Empresa> findAll(Pageable page) {
        return this.empresaRepository.findAll(page);
    }

    public Page<Empresa> findAllByNomeFantasiaOrCnpjContaining(Pageable pageable, String key) {
        return this.empresaRepository.findAllByNomeFantasiaOrCnpjContaining(pageable, key);
    }

    public Long count() {
        return this.empresaRepository.count();
    }

    public Long verifyRelacionamentoAnalista(Long empresaId, Long usuarioId) {
        return this.empresaRepository.verifyRelacionamentoAnalista(empresaId, usuarioId);
    }

    public Long verifyRelacionamentoResponsavel(Long empresaId, Long usuarioId) {
        return this.empresaRepository.verifyRelacionamentoResponsavel(empresaId, usuarioId);
    }

    private Empresa uploadDocumentos(Empresa empresa, HttpServletRequest request) {
        empresa.getDocumentosEmpresa().getLogo().setPath(FileUpload.upload(request, empresa.getDocumentosEmpresa().getLogo().getFile(), "logo", "documentos/empresas/" + empresa.getNomeFantasia()));
        return empresa;
    }
}
