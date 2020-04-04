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

    @Autowired
    public ArquivoService(ArquivoRepository arquivoRepositoryrepository, DocumentosEntidadeService documentosEntidadeService) {
        this.arquivoRepositoryrepository = arquivoRepositoryrepository;
        this.documentosEntidadeService = documentosEntidadeService;
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

        if (documentosEntidade.getAtaEleicao() != null) {
            Arquivo ataDeEleicao = arquivoRepositoryrepository.getOne(documentosEntidade.getAtaEleicao().getId());
            ataDeEleicao.setStatus(documentosEntidade.getAtaEleicao().getStatus());
            atualiza(ataDeEleicao);
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

    public boolean exists(Long id) {
        return this.arquivoRepositoryrepository.existsById(id);
    }
}
