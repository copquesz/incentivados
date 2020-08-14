package br.com.incentivados.service;

import br.com.incentivados.enumerated.Ods;
import br.com.incentivados.enumerated.StatusArquivo;
import br.com.incentivados.enumerated.TipoAvaliacao;
import br.com.incentivados.model.*;
import br.com.incentivados.repository.ProjetoRepository;
import br.com.incentivados.utility.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import static br.com.incentivados.enumerated.StatusArquivo.NAO_SE_APLICA;

@Service
public class ProjetoService {
    private final ProjetoRepository projetoRepository;

    @Autowired
    public ProjetoService(ProjetoRepository projetoRepository) {
        this.projetoRepository = projetoRepository;
    }

    public Projeto save(Projeto projeto, Usuario usuario, HttpServletRequest request) {
        projeto.setUsuario(usuario);
        projeto = this.uploadDocumentos(request, projeto);
        return this.projetoRepository.save(projeto);
    }

    public Projeto adicionaOds(Projeto projeto, List<Ods> ods) {
        if (projeto.getOds().size() == 0) {
            projeto.setOds(ods);
        } else {
            Iterator var3 = ods.iterator();

            while (var3.hasNext()) {
                Ods odsAux = (Ods) var3.next();
                projeto.getOds().add(odsAux);
            }
        }

        return this.projetoRepository.save(projeto);
    }

    public boolean existsByTitulo(String titulo) {
        return this.projetoRepository.existsByTitulo(titulo);
    }

    public Projeto setAvaliacao(Projeto projeto, Avaliacao avaliacao) {
        Double media = 0.0D;

        Double nota;
        for (Iterator var4 = avaliacao.getNotas().iterator(); var4.hasNext(); media = media + nota) {
            nota = (Double) var4.next();
        }

        media = media / (double) avaliacao.getNotas().size();
        avaliacao.setNota(media);
        projeto.getAvaliacoes().add(avaliacao);
        if (avaliacao.getTipoAvaliacao() == TipoAvaliacao.TECNICA) {
            if (projeto.getNotaTecnica().equals(new Double(0.0D))) {
                projeto.setNotaTecnica(avaliacao.getNota());
            } else {
                projeto.setNotaTecnica((projeto.getNotaTecnica() + avaliacao.getNota()) / 2.0D);
            }
        } else if (projeto.getNotaInstitucional().equals(new Double(0.0D))) {
            projeto.setNotaInstitucional(avaliacao.getNota());
        } else {
            projeto.setNotaInstitucional((projeto.getNotaInstitucional() + avaliacao.getNota()) / 2.0D);
        }

        projeto.setNotaGeral((projeto.getNotaTecnica() + projeto.getNotaInstitucional()) / 2.0D);
        projeto.setQtdAvaliacoes(projeto.getQtdAvaliacoes() + 1);
        projeto = this.projetoRepository.save(projeto);
        return projeto;
    }

    public Optional<Projeto> findById(Long id) {
        return this.projetoRepository.findById(id);
    }

    public Page<Projeto> findAll(Pageable page) {
        return this.projetoRepository.findAll(page);
    }

    public Page<Projeto> findAll(Pageable page, String key) {
        return this.projetoRepository.findAll(page, key);
    }

    public Page<Projeto> findAllByDocumentosProjetoStatusDocumentacao(Pageable pageable, StatusArquivo statusArquivo) {
        return projetoRepository.findAllByDocumentosProjetoStatusDocumentacao(pageable, statusArquivo);
    }

    public Page<Projeto> findAllByUsuarioAndAndDocumentosProjetoStatusDocumentacao(Pageable pageable, Usuario usuario, StatusArquivo statusArquivo) {
        return projetoRepository.findAllByUsuarioAndAndDocumentosProjetoStatusDocumentacao(pageable, usuario, statusArquivo);
    }

    public Page<Projeto> findAllByTituloContainingAndIncentivosFiscaisContaining(Pageable page, String key, IncentivoFiscal incentivoFiscal) {
        return this.projetoRepository.findAllByTituloContainingAndIncentivosFiscaisContaining(page, key, incentivoFiscal);
    }

    public Page<Projeto> findAllByUsuario(Usuario usuario, Pageable page) {
        return this.projetoRepository.findAllByUsuario(usuario, page);
    }

    public Page<Projeto> findAllByEntidade(Entidade entidade, Pageable pageable){
        return this.projetoRepository.findAllByEntidade(entidade, pageable);
    }

    public Page<Projeto> findAllByUsuario(Usuario usuario, Pageable page, String key) {
        return this.projetoRepository.findAllByUsuario(usuario, page, key);
    }

    public Page<Projeto> getRanking(Pageable page) {
        return this.projetoRepository.getRanking(page);
    }

    public Long count() {
        return this.projetoRepository.count();
    }

    public Long countByUsuario(Usuario usuario) {
        return this.projetoRepository.countByUsuario(usuario);
    }

    public Long countByIncentivosFiscais(IncentivoFiscal incentivoFiscal) {
        return this.projetoRepository.countByIncentivosFiscais(incentivoFiscal);
    }

    public Long countByEntidadeEnderecoEstado(String estado){
        return this.projetoRepository.countByEntidadeEnderecoEstado(estado);
    }

    public Long countProjetosAvaliados(Long idAnalista) {
        return this.projetoRepository.countProjetosAvaliados(idAnalista);
    }

    public boolean verifyAvaliacao(Long idProjeto, Long idUsuario) {
        Long verify = this.projetoRepository.verifyAvaliacao(idProjeto, idUsuario);
        return verify.intValue() == 1;
    }

    private Projeto uploadDocumentos(HttpServletRequest request, Projeto projeto) {
        String path = "documentos/entidades/" + projeto.getEntidade().getNomeFantasia() + "/" + projeto.getTitulo();
        Arquivo logo = projeto.getDocumentosProjeto().getLogo();
        Arquivo propostaTecnica = projeto.getDocumentosProjeto().getPropostaTecnica();
        Arquivo propostaOrcamentaria = projeto.getDocumentosProjeto().getPropostOrcamentaria();
        Arquivo dadosBancarios = projeto.getDocumentosProjeto().getDadosBancariosFundo();
        Arquivo certificado = projeto.getDocumentosProjeto().getCertificado();

        if(dadosBancarios.getFile().isEmpty()){
            projeto.getDocumentosProjeto().getDadosBancariosFundo().setStatus(NAO_SE_APLICA);
            projeto.getDocumentosProjeto().getDadosBancariosFundo().setPath(null);
        }

        projeto.getDocumentosProjeto().getLogo().setPath(FileUpload.upload(request, logo.getFile(), "logo", path));
        projeto.getDocumentosProjeto().getPropostaTecnica().setPath(FileUpload.upload(request, propostaTecnica.getFile(), "proposta-tecnica", path));
        projeto.getDocumentosProjeto().getPropostOrcamentaria().setPath(FileUpload.upload(request, propostaOrcamentaria.getFile(), "proposta-orcamentaria", path));
        projeto.getDocumentosProjeto().getDadosBancariosFundo().setPath(FileUpload.upload(request, dadosBancarios.getFile(), "dados-bancarios", path));
        projeto.getDocumentosProjeto().getCertificado().setPath(FileUpload.upload(request, certificado.getFile(), "certificado", path));
        return projeto;
    }
}
