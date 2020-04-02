package br.com.incentivados.service;

import br.com.incentivados.enumerated.StatusArquivo;
import br.com.incentivados.model.Arquivo;
import br.com.incentivados.model.DocumentosEntidade;
import br.com.incentivados.model.Entidade;
import br.com.incentivados.repository.ArquivoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static br.com.incentivados.enumerated.StatusArquivo.*;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 01/04/2020
 */
@Service
public class ArquivoService {

    private final ArquivoRepository arquivoRepositoryrepository;
    private final EntidadeService entidadeService;

    @Autowired
    public ArquivoService(ArquivoRepository arquivoRepositoryrepository, EntidadeService entidadeService) {
        this.arquivoRepositoryrepository = arquivoRepositoryrepository;
        this.entidadeService = entidadeService;
    }

    public void atualiza(Arquivo arquivo){
        this.arquivoRepositoryrepository.save(arquivo);
    }

    public void analisaDocumentacao(Entidade entidade, DocumentosEntidade documentosEntidade){

        Arquivo logo = arquivoRepositoryrepository.getOne(documentosEntidade.getLogo().getId());
        logo.setStatus(documentosEntidade.getLogo().getStatus());
        atualiza(logo);
        System.out.println(logo);

        Arquivo estatutoSocial = arquivoRepositoryrepository.getOne(documentosEntidade.getEstatutoSocial().getId());
        estatutoSocial.setStatus(documentosEntidade.getEstatutoSocial().getStatus());
        atualiza(estatutoSocial);
        System.out.println(estatutoSocial);

        Arquivo cartaoCnpj = arquivoRepositoryrepository.getOne(documentosEntidade.getCartaoCnpj().getId());
        cartaoCnpj.setStatus(documentosEntidade.getCartaoCnpj().getStatus());
        atualiza(cartaoCnpj);
        System.out.println(cartaoCnpj);

        Arquivo identidade = arquivoRepositoryrepository.getOne(documentosEntidade.getIdentidade().getId());
        identidade.setStatus(documentosEntidade.getIdentidade().getStatus());
        atualiza(identidade);
        System.out.println(identidade);

        Arquivo dadosBancarios = arquivoRepositoryrepository.getOne(documentosEntidade.getDadosBancarios().getId());
        dadosBancarios.setStatus(documentosEntidade.getDadosBancarios().getStatus());
        atualiza(dadosBancarios);
        System.out.println(dadosBancarios);

        if(documentosEntidade.getAtaEleicao() != null){
            Arquivo ataDeEleicao = arquivoRepositoryrepository.getOne(documentosEntidade.getAtaEleicao().getId());
            ataDeEleicao.setStatus(documentosEntidade.getAtaEleicao().getStatus());
            atualiza(ataDeEleicao);
            System.out.println(ataDeEleicao);
        }

        // Altera o estado da documentação para APROVADO com Ata de Eleição == null
        if((logo.getStatus() == APROVADO && estatutoSocial.getStatus() == APROVADO && cartaoCnpj.getStatus() == APROVADO
                && identidade.getStatus() == APROVADO && dadosBancarios.getStatus() == APROVADO)
                && documentosEntidade.getAtaEleicao() == null){
            entidade.getDocumentosEntidade().setStatusDocumentacao(APROVADO);
            entidadeService.update(entidade);
        }

        // Altera o estado da documentação para APROVADO com Ata de Eleição != null
        else if((logo.getStatus() == APROVADO && estatutoSocial.getStatus() == APROVADO && cartaoCnpj.getStatus() == APROVADO
                && identidade.getStatus() == APROVADO && dadosBancarios.getStatus() == APROVADO
                && documentosEntidade.getAtaEleicao().getStatus() == APROVADO)
                && documentosEntidade.getAtaEleicao() != null ){
            entidade.getDocumentosEntidade().setStatusDocumentacao(APROVADO);
            entidadeService.update(entidade);
        }

        // Altera o estado da documentação para NEGADO sem Ata de Eleição == null
        else if((logo.getStatus() == NEGADO || estatutoSocial.getStatus() == NEGADO || cartaoCnpj.getStatus() == NEGADO
                || identidade.getStatus() == NEGADO || dadosBancarios.getStatus() == NEGADO)
                && documentosEntidade.getAtaEleicao() == null){
            entidade.getDocumentosEntidade().setStatusDocumentacao(NEGADO);
            entidadeService.update(entidade);
        }

        // Altera o estado da documentação para NEGADO com Ata de Eleição == null
        else if((logo.getStatus() == NEGADO || estatutoSocial.getStatus() == NEGADO || cartaoCnpj.getStatus() == NEGADO
                || identidade.getStatus() == NEGADO || dadosBancarios.getStatus() == NEGADO
                || documentosEntidade.getAtaEleicao().getStatus() == NEGADO)
                && documentosEntidade.getAtaEleicao() != null ){
            entidade.getDocumentosEntidade().setStatusDocumentacao(NEGADO);
            entidadeService.update(entidade);
        }

    }

    public boolean exists(Long id) {
        return this.arquivoRepositoryrepository.existsById(id);
    }
}
