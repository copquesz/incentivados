package br.com.incentivados.repository;

import br.com.incentivados.enumerated.StatusArquivo;
import br.com.incentivados.model.Arquivo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 01/04/2020
 */
@Repository
public interface ArquivoRepository extends JpaRepository<Arquivo, Long> {

    @Modifying
    @Query(value = "UPDATE Arquivo ar SET ar.status = :status WHERE ar.id = :id")
    void atualizaStatus(@Param("id") Long id, @Param("status")StatusArquivo statusArquivo);

    @Modifying
    @Query(value = "UPDATE Arquivo ar SET ar.status = :status, ar.path = :path  WHERE ar.id = :id")
    void atualizaStatusAndPath(@Param("id") Long id, @Param("status")StatusArquivo statusArquivo, @Param("path") String path);
}
