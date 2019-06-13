package br.com.incentivados.repository;

import java.util.List;
import java.util.Optional;

import br.com.incentivados.model.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProjetoRepository extends JpaRepository<Projeto, Projeto> {

    boolean existsByTitulo(String titulo);

    Optional<Projeto> findById(Long id);

    Page<Projeto> findAllByUsuario(Usuario usuario, Pageable page);

    Long countByUsuario(Usuario usuario);
    Long countByIncentivosFiscais(IncentivoFiscal incentivoFiscal);

    @Query("SELECT projeto FROM Projeto projeto WHERE projeto.titulo LIKE %:key%")
    Page<Projeto> findAll(Pageable page, @Param("key") String key);

    @Query("SELECT projeto FROM Projeto projeto WHERE projeto.usuario = :usuario AND projeto.titulo LIKE %:key%")
    Page<Projeto> findAllByUsuario(@Param("usuario") Usuario usuario, Pageable page, @Param("key") String key);
}
