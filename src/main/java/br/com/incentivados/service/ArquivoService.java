package br.com.incentivados.service;

import br.com.incentivados.model.*;
import br.com.incentivados.repository.ArquivoRepository;
import br.com.incentivados.repository.DocumentosProjetoRepository;
import br.com.incentivados.utility.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

import static br.com.incentivados.enumerated.StatusArquivo.*;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 01/04/2020
 */
@Service
public class ArquivoService {

    private final ArquivoRepository arquivoRepositoryrepository;
    private final DocumentosEntidadeService documentosEntidadeService;
    private final DocumentosProjetoServie documentosProjetoService;

    @Autowired
    public ArquivoService(ArquivoRepository arquivoRepositoryrepository, DocumentosEntidadeService documentosEntidadeService, DocumentosProjetoServie documentosProjetoService) {
        this.arquivoRepositoryrepository = arquivoRepositoryrepository;
        this.documentosEntidadeService = documentosEntidadeService;
        this.documentosProjetoService = documentosProjetoService;
    }

    public void atualiza(Arquivo arquivo) {
        this.arquivoRepositoryrepository.save(arquivo);
    }

    @Transactional
    public void analisaDocumentacaoEntidade(DocumentosEntidade documentosEntidade, ParecerDocumentacao parecerDocumentacao) {

        Arquivo logo = documentosEntidade.getLogo();
        this.arquivoRepositoryrepository.atualizaStatus(logo.getId(), logo.getStatus());

        Arquivo estatutoSocial = documentosEntidade.getEstatutoSocial();
        this.arquivoRepositoryrepository.atualizaStatus(estatutoSocial.getId(), estatutoSocial.getStatus());

        Arquivo identidade = documentosEntidade.getIdentidade();
        this.arquivoRepositoryrepository.atualizaStatus(identidade.getId(), identidade.getStatus());

        Arquivo cartaoCnpj = documentosEntidade.getCartaoCnpj();
        this.arquivoRepositoryrepository.atualizaStatus(cartaoCnpj.getId(), cartaoCnpj.getStatus());

        Arquivo dadosBancarios = documentosEntidade.getDadosBancarios();
        this.arquivoRepositoryrepository.atualizaStatus(dadosBancarios.getId(), dadosBancarios.getStatus());

        if (documentosEntidade.getAtaEleicao() != null) {
            Arquivo ataEleicao = documentosEntidade.getAtaEleicao();
            this.arquivoRepositoryrepository.atualizaStatus(ataEleicao.getId(), ataEleicao.getStatus());
        }

        // Altera o estado da documentação para APROVADO com Ata de Eleição == null
        if ((logo.getStatus() == APROVADO && estatutoSocial.getStatus() == APROVADO && cartaoCnpj.getStatus() == APROVADO
                && identidade.getStatus() == APROVADO && dadosBancarios.getStatus() == APROVADO)
                && documentosEntidade.getAtaEleicao() == null) {
            documentosEntidadeService.atualizaStatus(documentosEntidade.getId(), APROVADO);
        }

        // Altera o estado da documentação para APROVADO com Ata de Eleição != null
        else if ((logo.getStatus() == APROVADO && estatutoSocial.getStatus() == APROVADO && cartaoCnpj.getStatus() == APROVADO
                && identidade.getStatus() == APROVADO && dadosBancarios.getStatus() == APROVADO
                && documentosEntidade.getAtaEleicao().getStatus() == APROVADO)
                && documentosEntidade.getAtaEleicao() != null) {
            documentosEntidadeService.atualizaStatus(documentosEntidade.getId(), APROVADO);
        }

        // Altera o estado da documentação para NEGADO sem Ata de Eleição == null
        else if ((logo.getStatus() == NEGADO || estatutoSocial.getStatus() == NEGADO || cartaoCnpj.getStatus() == NEGADO
                || identidade.getStatus() == NEGADO || dadosBancarios.getStatus() == NEGADO)
                && documentosEntidade.getAtaEleicao() == null) {
            documentosEntidadeService.atualizaStatus(documentosEntidade.getId(), NEGADO);
            DocumentosEntidade documentosEntidade1 = documentosEntidadeService.getOne(documentosEntidade.getId());
            documentosEntidade1.getPareceresDocumentacao().add(parecerDocumentacao);
            documentosEntidadeService.atualiza(documentosEntidade1);
        }

        // Altera o estado da documentação para NEGADO com Ata de Eleição == null
        else if ((logo.getStatus() == NEGADO || estatutoSocial.getStatus() == NEGADO || cartaoCnpj.getStatus() == NEGADO
                || identidade.getStatus() == NEGADO || dadosBancarios.getStatus() == NEGADO
                || documentosEntidade.getAtaEleicao().getStatus() == NEGADO)
                && documentosEntidade.getAtaEleicao() != null) {

            documentosEntidade.setStatusDocumentacao(NEGADO);
            documentosEntidadeService.atualizaStatus(documentosEntidade.getId(), NEGADO);

            DocumentosEntidade documentosEntidade1 = documentosEntidadeService.getOne(documentosEntidade.getId());
            documentosEntidade1.getPareceresDocumentacao().add(parecerDocumentacao);
            documentosEntidadeService.atualiza(documentosEntidade1);
        }

    }

    @Transactional
    public void analisaDocumentacaoProjeto(DocumentosProjeto documentosProjeto, ParecerDocumentacao parecerDocumentacao) {

        Arquivo logo = documentosProjeto.getLogo();
        this.arquivoRepositoryrepository.atualizaStatus(logo.getId(), logo.getStatus());

        Arquivo propostaTecnica = documentosProjeto.getPropostaTecnica();
        this.arquivoRepositoryrepository.atualizaStatus(propostaTecnica.getId(), propostaTecnica.getStatus());

        Arquivo propostaOrcamentaria = documentosProjeto.getPropostOrcamentaria();
        this.arquivoRepositoryrepository.atualizaStatus(propostaOrcamentaria.getId(), propostaOrcamentaria.getStatus());

        Arquivo certificado = documentosProjeto.getCertificado();
        this.arquivoRepositoryrepository.atualizaStatus(certificado.getId(), certificado.getStatus());

        if (documentosProjeto.getDadosBancariosFundo() != null) {
            Arquivo dadosBancariosFundo = documentosProjeto.getDadosBancariosFundo();
            this.arquivoRepositoryrepository.atualizaStatus(dadosBancariosFundo.getId(), dadosBancariosFundo.getStatus());
        }

        // Altera o estado da documentação para APROVADO com Dados Bancários do Fundo == null
        if ((logo.getStatus() == APROVADO && propostaTecnica.getStatus() == APROVADO && propostaOrcamentaria.getStatus() == APROVADO
                && certificado.getStatus() == APROVADO)
                && documentosProjeto.getDadosBancariosFundo() == null) {
            documentosProjetoService.atualizaStatus(documentosProjeto.getId(), APROVADO);
        }

        // Altera o estado da documentação para APROVADO com Dados Bancários do Fundo != null
        else if ((logo.getStatus() == APROVADO && propostaTecnica.getStatus() == APROVADO && propostaOrcamentaria.getStatus() == APROVADO
                && certificado.getStatus() == APROVADO && documentosProjeto.getDadosBancariosFundo().getStatus() == APROVADO)
                && documentosProjeto.getDadosBancariosFundo() != null) {
            documentosProjetoService.atualizaStatus(documentosProjeto.getId(), APROVADO);
        }

        // Altera o estado da documentação para NEGADO sem Dados Bancários do Fundo == null
        else if ((logo.getStatus() == NEGADO || propostaTecnica.getStatus() == NEGADO || propostaOrcamentaria.getStatus() == NEGADO
                || certificado.getStatus() == NEGADO)
                && documentosProjeto.getDadosBancariosFundo() == null) {
            documentosProjetoService.atualizaStatus(documentosProjeto.getId(), NEGADO);
            DocumentosProjeto documentosProjeto1 = documentosProjetoService.getOne(documentosProjeto.getId());
            documentosProjeto1.getPareceresDocumentacao().add(parecerDocumentacao);
            documentosProjetoService.atualiza(documentosProjeto1);
        }

        // Altera o estado da documentação para NEGADO com Dados Bancários do Fundo == null
        else if ((logo.getStatus() == NEGADO || propostaTecnica.getStatus() == NEGADO || propostaOrcamentaria.getStatus() == NEGADO
                || certificado.getStatus() == NEGADO
                || documentosProjeto.getDadosBancariosFundo().getStatus() == NEGADO)
                && documentosProjeto.getDadosBancariosFundo() != null) {

            documentosProjeto.setStatusDocumentacao(NEGADO);
            documentosProjetoService.atualizaStatus(documentosProjeto.getId(), NEGADO);

            DocumentosProjeto documentosProjeto1 = documentosProjetoService.getOne(documentosProjeto.getId());
            documentosProjeto1.getPareceresDocumentacao().add(parecerDocumentacao);
            documentosProjetoService.atualiza(documentosProjeto1);
        }

    }

    @Transactional
    public void reenviarDocumentacaoEntidade(Entidade entidade, DocumentosEntidade documentosEntidade, HttpServletRequest request){

        final String path = "documentos/entidades/" + entidade.getNomeFantasia();;

        if(documentosEntidade.getLogo() != null){
            Arquivo logo = arquivoRepositoryrepository.getOne(documentosEntidade.getLogo().getId());
            FileUpload.deletar(request, entidade.getDocumentosEntidade().getLogo().getPath());
            this.arquivoRepositoryrepository.atualizaStatusAndPath(logo.getId(), PENDENTE, FileUpload.upload(request, documentosEntidade.getLogo().getFile(), "logo", path));
        }

        if(documentosEntidade.getAtaEleicao() != null){
            Arquivo ataEleicao = arquivoRepositoryrepository.getOne(documentosEntidade.getAtaEleicao().getId());
            FileUpload.deletar(request, entidade.getDocumentosEntidade().getAtaEleicao().getPath());
            this.arquivoRepositoryrepository.atualizaStatusAndPath(ataEleicao.getId(), PENDENTE, FileUpload.upload(request, documentosEntidade.getAtaEleicao().getFile(), "ata-de-eleicao", path));
        }

        if(documentosEntidade.getDadosBancarios() != null){
            Arquivo dadosBancarios = arquivoRepositoryrepository.getOne(documentosEntidade.getDadosBancarios().getId());
            FileUpload.deletar(request, entidade.getDocumentosEntidade().getDadosBancarios().getPath());
            this.arquivoRepositoryrepository.atualizaStatusAndPath(dadosBancarios.getId(), PENDENTE, FileUpload.upload(request, documentosEntidade.getDadosBancarios().getFile(), "dados-bancarios", path));
        }

        if(documentosEntidade.getIdentidade() != null){
            Arquivo identidade = arquivoRepositoryrepository.getOne(documentosEntidade.getIdentidade().getId());
            FileUpload.deletar(request, entidade.getDocumentosEntidade().getIdentidade().getPath());
            this.arquivoRepositoryrepository.atualizaStatusAndPath(identidade.getId(), PENDENTE, FileUpload.upload(request, documentosEntidade.getIdentidade().getFile(), "identidade", path));
        }

        if(documentosEntidade.getCartaoCnpj() != null){
            Arquivo cartaoCnpj = arquivoRepositoryrepository.getOne(documentosEntidade.getCartaoCnpj().getId());
            FileUpload.deletar(request, entidade.getDocumentosEntidade().getCartaoCnpj().getPath());
            this.arquivoRepositoryrepository.atualizaStatusAndPath(cartaoCnpj.getId(), PENDENTE, FileUpload.upload(request, documentosEntidade.getCartaoCnpj().getFile(), "cartao-cnpj", path));
        }

        if(documentosEntidade.getEstatutoSocial() != null){
            Arquivo estatutoSocial = arquivoRepositoryrepository.getOne(documentosEntidade.getEstatutoSocial().getId());
            FileUpload.deletar(request, entidade.getDocumentosEntidade().getEstatutoSocial().getPath());
            this.arquivoRepositoryrepository.atualizaStatusAndPath(estatutoSocial.getId(), PENDENTE, FileUpload.upload(request, documentosEntidade.getEstatutoSocial().getFile(), "estatuto-social", path));
        }

        documentosEntidadeService.atualizaStatus(documentosEntidade.getId(), PENDENTE);
    }

    @Transactional
    public void reenviarDocumentacaoProjeto(Projeto projeto, DocumentosProjeto documentosProjeto, HttpServletRequest request){

        final String path = "documentos/entidades/" + projeto.getEntidade().getNomeFantasia() + "/" + projeto.getTitulo();;

        if(documentosProjeto.getLogo() != null){
            Arquivo logo = arquivoRepositoryrepository.getOne(documentosProjeto.getLogo().getId());
            FileUpload.deletar(request, projeto.getDocumentosProjeto().getLogo().getPath());
            this.arquivoRepositoryrepository.atualizaStatusAndPath(logo.getId(), PENDENTE, FileUpload.upload(request, documentosProjeto.getLogo().getFile(), "logo", path));
        }

        if(documentosProjeto.getPropostaTecnica() != null){
            Arquivo propostaTecnica = arquivoRepositoryrepository.getOne(documentosProjeto.getPropostaTecnica().getId());
            FileUpload.deletar(request, projeto.getDocumentosProjeto().getPropostaTecnica().getPath());
            this.arquivoRepositoryrepository.atualizaStatusAndPath(propostaTecnica.getId(), PENDENTE, FileUpload.upload(request, documentosProjeto.getPropostaTecnica().getFile(), "ata-de-eleicao", path));
        }

        if(documentosProjeto.getPropostOrcamentaria() != null){
            Arquivo propostaOrcamentaria = arquivoRepositoryrepository.getOne(documentosProjeto.getPropostOrcamentaria().getId());
            FileUpload.deletar(request, projeto.getDocumentosProjeto().getPropostOrcamentaria().getPath());
            this.arquivoRepositoryrepository.atualizaStatusAndPath(propostaOrcamentaria.getId(), PENDENTE, FileUpload.upload(request, documentosProjeto.getPropostOrcamentaria().getFile(), "dados-bancarios", path));
        }

        if(documentosProjeto.getCertificado() != null){
            Arquivo certificado = arquivoRepositoryrepository.getOne(documentosProjeto.getCertificado().getId());
            FileUpload.deletar(request, projeto.getDocumentosProjeto().getCertificado().getPath());
            this.arquivoRepositoryrepository.atualizaStatusAndPath(certificado.getId(), PENDENTE, FileUpload.upload(request, documentosProjeto.getCertificado().getFile(), "identidade", path));
        }

        if(documentosProjeto.getDadosBancariosFundo() != null){
            Arquivo dadosBancariosFundo = arquivoRepositoryrepository.getOne(documentosProjeto.getDadosBancariosFundo().getId());
            FileUpload.deletar(request, projeto.getDocumentosProjeto().getDadosBancariosFundo().getPath());
            this.arquivoRepositoryrepository.atualizaStatusAndPath(dadosBancariosFundo.getId(), PENDENTE, FileUpload.upload(request, documentosProjeto.getDadosBancariosFundo().getFile(), "cartao-cnpj", path));
        }

        documentosProjetoService.atualizaStatus(documentosProjeto.getId(), PENDENTE);
    }

    public boolean exists(Long id) {
        return this.arquivoRepositoryrepository.existsById(id);
    }
}
