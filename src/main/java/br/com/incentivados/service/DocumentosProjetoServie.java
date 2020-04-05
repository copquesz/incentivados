package br.com.incentivados.service;

import br.com.incentivados.enumerated.StatusArquivo;
import br.com.incentivados.model.DocumentosProjeto;
import br.com.incentivados.repository.DocumentosProjetoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 04/04/2020
 */
@Service
public class DocumentosProjetoServie {

    private final DocumentosProjetoRepository documentosProjetoRepository;

    @Autowired
    public DocumentosProjetoServie(DocumentosProjetoRepository documentosProjetoRepository) {
        this.documentosProjetoRepository = documentosProjetoRepository;
    }

    public DocumentosProjeto getOne(Long id) {
        return this.documentosProjetoRepository.getOne(id);
    }

    public void atualiza(DocumentosProjeto documentosProjeto){
        this.documentosProjetoRepository.save(documentosProjeto);
    }

    public  void atualizaStatus(Long id, StatusArquivo statusArquivo){
        this.documentosProjetoRepository.atualizaStatus(id, statusArquivo);
    }

}
