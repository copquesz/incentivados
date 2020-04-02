package br.com.incentivados.repository;

import br.com.incentivados.enumerated.StatusArquivo;
import br.com.incentivados.model.DocumentosEntidade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/04/2020
 */
@Repository
public interface DocumentosEntidadeRepository extends JpaRepository<DocumentosEntidade, Long> {

    @Modifying
    @Query(value = "UPDATE DocumentosEntidade docsEnt SET docsEnt.statusDocumentacao = :status WHERE docsEnt.id = :id")
    void atualizaStatus(@Param("id") Long id, @Param("status") StatusArquivo statusArquivo);

}
