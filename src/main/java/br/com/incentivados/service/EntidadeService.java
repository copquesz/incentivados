package br.com.incentivados.service;

import br.com.incentivados.enumerated.StatusArquivo;
import br.com.incentivados.model.Arquivo;
import br.com.incentivados.model.Entidade;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.repository.EntidadeRepository;
import br.com.incentivados.utility.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

import static br.com.incentivados.enumerated.StatusArquivo.*;

@Service
public class EntidadeService {
    private EntidadeRepository entidadeRepository;

    @Autowired
    EntidadeService(EntidadeRepository entidadeRepository) {
        this.entidadeRepository = entidadeRepository;
    }

    public Entidade save(Entidade entidade, Usuario usuario, HttpServletRequest request) {
        entidade.setUsuario(usuario);
        entidade = this.uploadDocumentos(entidade, request);
        entidade = this.entidadeRepository.save(entidade);
        return entidade;
    }

    public Entidade update(Entidade entidade) {
        return this.entidadeRepository.save(entidade);
    }

    public boolean existsById(Long id) {
        return this.entidadeRepository.existsById(id);
    }

    public boolean existsByCnpj(String cnpj) {
        return this.entidadeRepository.existsByCnpj(cnpj);
    }

    public boolean existsByUsuario(Usuario usuario) {
        return this.entidadeRepository.existsByUsuario(usuario);
    }

    public Optional<Entidade> findById(Long id) {
        return this.entidadeRepository.findById(id);
    }

    public List<Entidade> findAllByUsuario(Usuario usuario) {
        return this.entidadeRepository.findAllByUsuario(usuario);
    }

    public Page<Entidade> findAll(Pageable page) {
        return this.entidadeRepository.findAll(page);
    }

    public Page<Entidade> findAll(Pageable page, String key) {
        return this.entidadeRepository.findAll(page, key);
    }

    public Page<Entidade> findAllByUsuario(Usuario usuario, Pageable page) {
        return this.entidadeRepository.findAllByUsuario(usuario, page);
    }

    public Page<Entidade> findAllByUsuarioAndCnpjOrNomeFantasia(Usuario usuario, Pageable page, String key) {
        return this.entidadeRepository.findAllByUsuarioAndCnpjOrNomeFantasia(usuario, page, key);
    }

    public Page<Entidade> findAllByDocumentosEntidadeStatusDocumentacao(Pageable pageable, StatusArquivo statusArquivo) {
        return entidadeRepository.findAllByDocumentosEntidadeStatusDocumentacao(pageable, statusArquivo);
    }

    public Page<Entidade> findAllByUsuarioAndAndDocumentosEntidadeStatusDocumentacao(Pageable pageable, Usuario usuario, StatusArquivo statusArquivo) {
        return entidadeRepository.findAllByUsuarioAndAndDocumentosEntidadeStatusDocumentacao(pageable, usuario, statusArquivo);
    }

    public Long count() {
        return this.entidadeRepository.count();
    }

    public Long countByUsuario(Usuario usuario) {
        return this.entidadeRepository.countByUsuario(usuario);
    }

    private Long countByIdAndDataCadastroBetween(Date inicio, Date fim) {
        return this.entidadeRepository.countByDataCadastroBetween(inicio, fim);
    }

    public List<Long> buildChart() {
        int ANO_ATUAL = GregorianCalendar.getInstance().get(1);
        List<Long> array = new ArrayList();

        for (int i = 0; i < 12; ++i) {
            Calendar data = new GregorianCalendar(ANO_ATUAL, i, 1);
            array.add(this.countByIdAndDataCadastroBetween((new GregorianCalendar(ANO_ATUAL, i, data.getActualMinimum(5))).getTime(), (new GregorianCalendar(ANO_ATUAL, i, data.getActualMaximum(5))).getTime()));
        }

        return array;
    }

    private Entidade uploadDocumentos(Entidade entidade, HttpServletRequest request) {
        String path = "documentos/entidades/" + entidade.getNomeFantasia();
        Arquivo logo = entidade.getDocumentosEntidade().getLogo();
        Arquivo ataEleicao = entidade.getDocumentosEntidade().getAtaEleicao();
        Arquivo estatutoSocial = entidade.getDocumentosEntidade().getEstatutoSocial();
        Arquivo identidade = entidade.getDocumentosEntidade().getIdentidade();
        Arquivo cartaoCnpj = entidade.getDocumentosEntidade().getCartaoCnpj();
        Arquivo dadosBancarios = entidade.getDocumentosEntidade().getDadosBancarios();
        entidade.getDocumentosEntidade().getLogo().setPath(FileUpload.upload(request, logo.getFile(), "logo", path));

        entidade.getDocumentosEntidade().getAtaEleicao().setPath(FileUpload.upload(request, ataEleicao.getFile(), "ata-de-eleicao", path));
        entidade.getDocumentosEntidade().getDadosBancarios().setPath(FileUpload.upload(request, dadosBancarios.getFile(), "dados-bancarios", path));
        entidade.getDocumentosEntidade().getEstatutoSocial().setPath(FileUpload.upload(request, estatutoSocial.getFile(), "estatuto-social", path));
        entidade.getDocumentosEntidade().getIdentidade().setPath(FileUpload.upload(request, identidade.getFile(), "identidade", path));
        entidade.getDocumentosEntidade().getCartaoCnpj().setPath(FileUpload.upload(request, cartaoCnpj.getFile(), "cartao-cnpj", path));
        return entidade;
    }
}
