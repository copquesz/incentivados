package br.com.incentivados.service;

import br.com.incentivados.enumerated.StatusArquivo;
import br.com.incentivados.repository.DocumentosEntidadeRepository;
import org.springframework.stereotype.Service;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/04/2020
 */
@Service
public class DocumentosEntidadeService {

    private final DocumentosEntidadeRepository documentosEntidadeRepository;

    public DocumentosEntidadeService(DocumentosEntidadeRepository documentosEntidadeRepository) {
        this.documentosEntidadeRepository = documentosEntidadeRepository;
    }

    public void atualizaStatus(Long id, StatusArquivo statusArquivo){
        this.documentosEntidadeRepository.atualizaStatus(id, statusArquivo);
    }
}
