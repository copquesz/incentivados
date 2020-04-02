package br.com.incentivados.repository;

import br.com.incentivados.model.Arquivo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 01/04/2020
 */
@Repository
public interface ArquivoRepository extends JpaRepository<Arquivo, Long> {
}
