package br.com.incentivados.service;

import br.com.incentivados.model.Arquivo;
import br.com.incentivados.model.DocumentosEntidade;
import br.com.incentivados.repository.ArquivoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static br.com.incentivados.enumerated.StatusArquivo.APROVADO;
import static br.com.incentivados.enumerated.StatusArquivo.NEGADO;

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
    public void analisaDocumentacaoEntidade(DocumentosEntidade documentosEntidade) {

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
        }

        // Altera o estado da documentação para NEGADO com Ata de Eleição == null
        else if ((logo.getStatus() == NEGADO || estatutoSocial.getStatus() == NEGADO || cartaoCnpj.getStatus() == NEGADO
                || identidade.getStatus() == NEGADO || dadosBancarios.getStatus() == NEGADO
                || documentosEntidade.getAtaEleicao().getStatus() == NEGADO)
                && documentosEntidade.getAtaEleicao() != null) {
            documentosEntidadeService.atualizaStatus(documentosEntidade.getId(), NEGADO);
        }

    }

    public boolean exists(Long id) {
        return this.arquivoRepositoryrepository.existsById(id);
    }
}
