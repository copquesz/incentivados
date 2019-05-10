package br.com.incentivados.repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.incentivados.model.Entidade;
import br.com.incentivados.model.Usuario;

@Repository
public interface EntidadeRepository extends JpaRepository<Entidade, Long> {

    boolean existsByCnpj(String cnpj);
    boolean existsByUsuario(Usuario usuario);

    Long countByUsuario(Usuario usuario);
    Long countByDataCadastroBetween(Date inicio, Date fim);

    Optional<Entidade> findById(Long id);

    List<Entidade> findAllByUsuario(Usuario usuario);

    Page<Entidade> findAllByUsuario(Usuario usuario, Pageable page);

}
