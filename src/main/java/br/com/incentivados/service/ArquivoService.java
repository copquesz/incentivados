package br.com.incentivados.service;

import br.com.incentivados.model.*;
import br.com.incentivados.repository.ArquivoRepository;
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
    private final DocumentosProjetoService documentosProjetoService;
    private final EntidadeService entidadeService;
    private final ProjetoService projetoService;
    private final JavaMailService javaMailService;

    @Autowired
    public ArquivoService(ArquivoRepository arquivoRepositoryrepository, DocumentosEntidadeService documentosEntidadeService, DocumentosProjetoService documentosProjetoService, EntidadeService entidadeService, ProjetoService projetoService, JavaMailService javaMailService) {
        this.arquivoRepositoryrepository = arquivoRepositoryrepository;
        this.documentosEntidadeService = documentosEntidadeService;
        this.documentosProjetoService = documentosProjetoService;
        this.entidadeService = entidadeService;
        this.projetoService = projetoService;
        this.javaMailService = javaMailService;
    }

    @Transactional
    public void analisaDocumentacaoEntidade(Entidade entidade, DocumentosEntidade documentosEntidade, ParecerDocumentacao parecerDocumentacao) {

        Arquivo logo = documentosEntidade.getLogo();
        entidade.getDocumentosEntidade().getLogo().setStatus(logo.getStatus());
        this.arquivoRepositoryrepository.atualizaStatus(logo.getId(), logo.getStatus());

        Arquivo estatutoSocial = documentosEntidade.getEstatutoSocial();
        entidade.getDocumentosEntidade().getEstatutoSocial().setStatus(estatutoSocial.getStatus());
        this.arquivoRepositoryrepository.atualizaStatus(estatutoSocial.getId(), estatutoSocial.getStatus());

        Arquivo identidade = documentosEntidade.getIdentidade();
        entidade.getDocumentosEntidade().getIdentidade().setStatus(identidade.getStatus());
        this.arquivoRepositoryrepository.atualizaStatus(identidade.getId(), identidade.getStatus());

        Arquivo cartaoCnpj = documentosEntidade.getCartaoCnpj();
        entidade.getDocumentosEntidade().getCartaoCnpj().setStatus(cartaoCnpj.getStatus());
        this.arquivoRepositoryrepository.atualizaStatus(cartaoCnpj.getId(), cartaoCnpj.getStatus());

        Arquivo dadosBancarios = documentosEntidade.getDadosBancarios();
        entidade.getDocumentosEntidade().getDadosBancarios().setStatus(dadosBancarios.getStatus());
        this.arquivoRepositoryrepository.atualizaStatus(dadosBancarios.getId(), dadosBancarios.getStatus());

        // Se a ata de eleição for diferente de nula atualiza o status dela vinda da requisição
        if (entidade.getDocumentosEntidade().getAtaEleicao().getStatus() != NAO_SE_APLICA) {
            Arquivo ataEleicao = documentosEntidade.getAtaEleicao();
            entidade.getDocumentosEntidade().getAtaEleicao().setStatus(ataEleicao.getStatus());
            this.arquivoRepositoryrepository.atualizaStatus(ataEleicao.getId(), ataEleicao.getStatus());
        }

        // Altera o estado da documentação para APROVADO com Ata de Eleição == null
        if (logo.getStatus() == APROVADO && estatutoSocial.getStatus() == APROVADO && cartaoCnpj.getStatus() == APROVADO
                && identidade.getStatus() == APROVADO && dadosBancarios.getStatus() == APROVADO
                && entidade.getDocumentosEntidade().getAtaEleicao().getStatus() == NAO_SE_APLICA) {
            documentosEntidadeService.atualizaStatus(entidade.getDocumentosEntidade(), APROVADO);
        }

        // Altera o estado da documentação para APROVADO com Ata de Eleição != null
        else if (logo.getStatus() == APROVADO && estatutoSocial.getStatus() == APROVADO && cartaoCnpj.getStatus() == APROVADO
                && identidade.getStatus() == APROVADO && dadosBancarios.getStatus() == APROVADO
                && entidade.getDocumentosEntidade().getAtaEleicao().getStatus() == APROVADO) {
            documentosEntidadeService.atualizaStatus(entidade.getDocumentosEntidade(), APROVADO);
        }

        // Altera o estado da documentação para NEGADO sem Ata de Eleição == null
        else if (logo.getStatus() == NEGADO || estatutoSocial.getStatus() == NEGADO || cartaoCnpj.getStatus() == NEGADO
                || identidade.getStatus() == NEGADO || dadosBancarios.getStatus() == NEGADO && entidade.getDocumentosEntidade().getAtaEleicao().getStatus() == NAO_SE_APLICA) {

            documentosEntidadeService.atualizaStatus(entidade.getDocumentosEntidade(), NEGADO);
            entidade.getDocumentosEntidade().getPareceresDocumentacao().add(parecerDocumentacao);
            documentosEntidadeService.atualiza(entidade.getDocumentosEntidade());
        }

        // Altera o estado da documentação para NEGADO com Ata de Eleição == null
        else if (logo.getStatus() == NEGADO || estatutoSocial.getStatus() == NEGADO || cartaoCnpj.getStatus() == NEGADO
                || identidade.getStatus() == NEGADO || dadosBancarios.getStatus() == NEGADO
                || entidade.getDocumentosEntidade().getAtaEleicao().getStatus() == NEGADO) {

            documentosEntidadeService.atualizaStatus(entidade.getDocumentosEntidade(), NEGADO);
            entidade.getDocumentosEntidade().getPareceresDocumentacao().add(parecerDocumentacao);
            documentosEntidadeService.atualiza(entidade.getDocumentosEntidade());
        }

        javaMailService.enviarEmailRelatorioDocumentosEntidade(entidade);
    }

    @Transactional
    public void analisaDocumentacaoProjeto(Projeto projeto, DocumentosProjeto documentosProjeto, ParecerDocumentacao parecerDocumentacao) {

        Arquivo logo = documentosProjeto.getLogo();
        projeto.getDocumentosProjeto().getLogo().setStatus(logo.getStatus());
        this.arquivoRepositoryrepository.atualizaStatus(logo.getId(), logo.getStatus());

        Arquivo propostaTecnica = documentosProjeto.getPropostaTecnica();
        projeto.getDocumentosProjeto().getPropostaTecnica().setStatus(propostaTecnica.getStatus());
        this.arquivoRepositoryrepository.atualizaStatus(propostaTecnica.getId(), propostaTecnica.getStatus());

        Arquivo propostaOrcamentaria = documentosProjeto.getPropostOrcamentaria();
        projeto.getDocumentosProjeto().getPropostOrcamentaria().setStatus(propostaOrcamentaria.getStatus());
        this.arquivoRepositoryrepository.atualizaStatus(propostaOrcamentaria.getId(), propostaOrcamentaria.getStatus());

        Arquivo certificado = documentosProjeto.getCertificado();
        projeto.getDocumentosProjeto().getCertificado().setStatus(certificado.getStatus());
        this.arquivoRepositoryrepository.atualizaStatus(certificado.getId(), certificado.getStatus());

        if (projeto.getDocumentosProjeto().getDadosBancariosFundo().getStatus() != NAO_SE_APLICA) {
            Arquivo dadosBancariosFundo = documentosProjeto.getDadosBancariosFundo();
            projeto.getDocumentosProjeto().getDadosBancariosFundo().setStatus(dadosBancariosFundo.getStatus());
            this.arquivoRepositoryrepository.atualizaStatus(dadosBancariosFundo.getId(), dadosBancariosFundo.getStatus());
            ;
        }

        // Altera o estado da documentação para APROVADO com Dados Bancários do Fundo == null
        if (logo.getStatus() == APROVADO && propostaTecnica.getStatus() == APROVADO && propostaOrcamentaria.getStatus() == APROVADO
                && certificado.getStatus() == APROVADO && projeto.getDocumentosProjeto().getDadosBancariosFundo().getStatus() == NAO_SE_APLICA) {
            projeto.getDocumentosProjeto().setStatusDocumentacao(APROVADO);
            documentosProjetoService.atualizaStatus(projeto.getDocumentosProjeto(), APROVADO);
        }

        // Altera o estado da documentação para APROVADO com Dados Bancários do Fundo != null
        else if (logo.getStatus() == APROVADO && propostaTecnica.getStatus() == APROVADO && propostaOrcamentaria.getStatus() == APROVADO
                && certificado.getStatus() == APROVADO && projeto.getDocumentosProjeto().getDadosBancariosFundo().getStatus() == APROVADO) {
            projeto.getDocumentosProjeto().setStatusDocumentacao(APROVADO);
            documentosProjetoService.atualizaStatus(projeto.getDocumentosProjeto(), APROVADO);
        }

        // Altera o estado da documentação para NEGADO sem Dados Bancários do Fundo == null
        else if (logo.getStatus() == NEGADO || propostaTecnica.getStatus() == NEGADO || propostaOrcamentaria.getStatus() == NEGADO
                || certificado.getStatus() == NEGADO && projeto.getDocumentosProjeto().getDadosBancariosFundo().getStatus() == NAO_SE_APLICA) {
            projeto.getDocumentosProjeto().setStatusDocumentacao(NEGADO);
            documentosProjetoService.atualizaStatus(projeto.getDocumentosProjeto(), NEGADO);
            projeto.getDocumentosProjeto().getPareceresDocumentacao().add(parecerDocumentacao);
            documentosProjetoService.atualiza(projeto.getDocumentosProjeto());
        }

        // Altera o estado da documentação para NEGADO com Dados Bancários do Fundo != null
        else if (logo.getStatus() == NEGADO || propostaTecnica.getStatus() == NEGADO || propostaOrcamentaria.getStatus() == NEGADO
                || certificado.getStatus() == NEGADO || projeto.getDocumentosProjeto().getDadosBancariosFundo().getStatus() == NEGADO) {
            projeto.getDocumentosProjeto().setStatusDocumentacao(NEGADO);
            documentosProjetoService.atualizaStatus(projeto.getDocumentosProjeto(), NEGADO);
            projeto.getDocumentosProjeto().getPareceresDocumentacao().add(parecerDocumentacao);
            documentosProjetoService.atualiza(projeto.getDocumentosProjeto());
        }
        javaMailService.enviarEmailRelatorioDocumentosProjeto(projeto);
    }

    @Transactional
    public void reenviarDocumentacaoEntidade(Entidade entidade, DocumentosEntidade documentosEntidade, HttpServletRequest request) {

        final String path = "documentos/entidades/" + entidade.getNomeFantasia();

        if (documentosEntidade.getLogo() != null) {
            Arquivo logo = arquivoRepositoryrepository.getOne(documentosEntidade.getLogo().getId());
            FileUpload.deletar(request, entidade.getDocumentosEntidade().getLogo().getPath());
            entidade.getDocumentosEntidade().getLogo().setStatus(PENDENTE);
            this.arquivoRepositoryrepository.atualizaStatusAndPath(logo.getId(), PENDENTE, FileUpload.upload(request, documentosEntidade.getLogo().getFile(), "logo", path));
        }

        if (documentosEntidade.getAtaEleicao() != null) {
            Arquivo ataEleicao = arquivoRepositoryrepository.getOne(documentosEntidade.getAtaEleicao().getId());
            FileUpload.deletar(request, entidade.getDocumentosEntidade().getAtaEleicao().getPath());
            entidade.getDocumentosEntidade().getAtaEleicao().setStatus(PENDENTE);
            this.arquivoRepositoryrepository.atualizaStatusAndPath(ataEleicao.getId(), PENDENTE, FileUpload.upload(request, documentosEntidade.getAtaEleicao().getFile(), "ata-de-eleicao", path));
        }

        if (documentosEntidade.getDadosBancarios() != null) {
            Arquivo dadosBancarios = arquivoRepositoryrepository.getOne(documentosEntidade.getDadosBancarios().getId());
            FileUpload.deletar(request, entidade.getDocumentosEntidade().getDadosBancarios().getPath());
            entidade.getDocumentosEntidade().getDadosBancarios().setStatus(PENDENTE);
            this.arquivoRepositoryrepository.atualizaStatusAndPath(dadosBancarios.getId(), PENDENTE, FileUpload.upload(request, documentosEntidade.getDadosBancarios().getFile(), "dados-bancarios", path));
        }

        if (documentosEntidade.getIdentidade() != null) {
            Arquivo identidade = arquivoRepositoryrepository.getOne(documentosEntidade.getIdentidade().getId());
            FileUpload.deletar(request, entidade.getDocumentosEntidade().getIdentidade().getPath());
            entidade.getDocumentosEntidade().getIdentidade().setStatus(PENDENTE);
            this.arquivoRepositoryrepository.atualizaStatusAndPath(identidade.getId(), PENDENTE, FileUpload.upload(request, documentosEntidade.getIdentidade().getFile(), "identidade", path));
        }

        if (documentosEntidade.getCartaoCnpj() != null) {
            Arquivo cartaoCnpj = arquivoRepositoryrepository.getOne(documentosEntidade.getCartaoCnpj().getId());
            FileUpload.deletar(request, entidade.getDocumentosEntidade().getCartaoCnpj().getPath());
            entidade.getDocumentosEntidade().getCartaoCnpj().setStatus(PENDENTE);
            this.arquivoRepositoryrepository.atualizaStatusAndPath(cartaoCnpj.getId(), PENDENTE, FileUpload.upload(request, documentosEntidade.getCartaoCnpj().getFile(), "cartao-cnpj", path));
        }

        if (documentosEntidade.getEstatutoSocial() != null) {
            Arquivo estatutoSocial = arquivoRepositoryrepository.getOne(documentosEntidade.getEstatutoSocial().getId());
            FileUpload.deletar(request, entidade.getDocumentosEntidade().getEstatutoSocial().getPath());
            entidade.getDocumentosEntidade().getEstatutoSocial().setStatus(PENDENTE);
            this.arquivoRepositoryrepository.atualizaStatusAndPath(estatutoSocial.getId(), PENDENTE, FileUpload.upload(request, documentosEntidade.getEstatutoSocial().getFile(), "estatuto-social", path));
        }

        documentosEntidadeService.atualizaStatus(documentosEntidade, PENDENTE);
        javaMailService.enviarEmailNotificacaoDocumentosEntidadePendenteAnalise(entidade);
    }

    @Transactional
    public void reenviarDocumentacaoProjeto(Projeto projeto, DocumentosProjeto documentosProjeto, HttpServletRequest request) {

        final String path = "documentos/entidades/" + projeto.getEntidade().getNomeFantasia() + "/" + projeto.getTitulo();

        if (documentosProjeto.getLogo() != null) {
            Arquivo logo = arquivoRepositoryrepository.getOne(documentosProjeto.getLogo().getId());
            FileUpload.deletar(request, projeto.getDocumentosProjeto().getLogo().getPath());
            projeto.getDocumentosProjeto().getLogo().setStatus(PENDENTE);
            this.arquivoRepositoryrepository.atualizaStatusAndPath(logo.getId(), PENDENTE, FileUpload.upload(request, documentosProjeto.getLogo().getFile(), "logo", path));
        }

        if (documentosProjeto.getPropostaTecnica() != null) {
            Arquivo propostaTecnica = arquivoRepositoryrepository.getOne(documentosProjeto.getPropostaTecnica().getId());
            FileUpload.deletar(request, projeto.getDocumentosProjeto().getPropostaTecnica().getPath());
            projeto.getDocumentosProjeto().getPropostaTecnica().setStatus(PENDENTE);
            this.arquivoRepositoryrepository.atualizaStatusAndPath(propostaTecnica.getId(), PENDENTE, FileUpload.upload(request, documentosProjeto.getPropostaTecnica().getFile(), "ata-de-eleicao", path));
        }

        if (documentosProjeto.getPropostOrcamentaria() != null) {
            Arquivo propostaOrcamentaria = arquivoRepositoryrepository.getOne(documentosProjeto.getPropostOrcamentaria().getId());
            FileUpload.deletar(request, projeto.getDocumentosProjeto().getPropostOrcamentaria().getPath());
            projeto.getDocumentosProjeto().getPropostOrcamentaria().setStatus(PENDENTE);
            this.arquivoRepositoryrepository.atualizaStatusAndPath(propostaOrcamentaria.getId(), PENDENTE, FileUpload.upload(request, documentosProjeto.getPropostOrcamentaria().getFile(), "dados-bancarios", path));
        }

        if (documentosProjeto.getCertificado() != null) {
            Arquivo certificado = arquivoRepositoryrepository.getOne(documentosProjeto.getCertificado().getId());
            FileUpload.deletar(request, projeto.getDocumentosProjeto().getCertificado().getPath());
            projeto.getDocumentosProjeto().getCertificado().setStatus(PENDENTE);
            this.arquivoRepositoryrepository.atualizaStatusAndPath(certificado.getId(), PENDENTE, FileUpload.upload(request, documentosProjeto.getCertificado().getFile(), "identidade", path));
        }

        if (documentosProjeto.getDadosBancariosFundo() != null) {
            Arquivo dadosBancariosFundo = arquivoRepositoryrepository.getOne(documentosProjeto.getDadosBancariosFundo().getId());
            FileUpload.deletar(request, projeto.getDocumentosProjeto().getDadosBancariosFundo().getPath());
            projeto.getDocumentosProjeto().getDadosBancariosFundo().setStatus(PENDENTE);
            this.arquivoRepositoryrepository.atualizaStatusAndPath(dadosBancariosFundo.getId(), PENDENTE, FileUpload.upload(request, documentosProjeto.getDadosBancariosFundo().getFile(), "cartao-cnpj", path));
        }

        documentosProjetoService.atualizaStatus(projeto.getDocumentosProjeto(), PENDENTE);
        javaMailService.enviarEmailNotificacaoDocumentosProjetoPendenteAnalise(projeto);
    }
}
