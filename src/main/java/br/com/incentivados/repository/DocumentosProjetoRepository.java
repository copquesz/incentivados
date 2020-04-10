package br.com.incentivados.repository;

import br.com.incentivados.enumerated.StatusArquivo;
import br.com.incentivados.model.DocumentosProjeto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 04/04/2020
 */
public interface DocumentosProjetoRepository extends JpaRepository<DocumentosProjeto, Long> {

    @Modifying
    @Query(value = "UPDATE DocumentosProjeto docsProj SET docsProj.statusDocumentacao = :status WHERE docsProj.id = :id")
    void atualizaStatus(@Param("id") Long id, @Param("status") StatusArquivo statusArquivo);

}
