package br.com.incentivados.service;

import br.com.incentivados.enumerated.StatusArquivo;
import br.com.incentivados.model.DocumentosEntidade;
import br.com.incentivados.repository.DocumentosEntidadeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/04/2020
 */
@Service
public class DocumentosEntidadeService {

    private final DocumentosEntidadeRepository documentosEntidadeRepository;

    @Autowired
    public DocumentosEntidadeService(DocumentosEntidadeRepository documentosEntidadeRepository) {
        this.documentosEntidadeRepository = documentosEntidadeRepository;
    }

    public void atualiza(DocumentosEntidade documentosEntidade) {
        this.documentosEntidadeRepository.save(documentosEntidade);
    }

    public void atualizaStatus(DocumentosEntidade documentosEntidade, StatusArquivo statusArquivo) {
        this.documentosEntidadeRepository.atualizaStatus(documentosEntidade.getId(), statusArquivo);
    }
}
