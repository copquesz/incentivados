package br.com.incentivados.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.incentivados.model.IncentivoFiscal;
import br.com.incentivados.model.Projeto;
import br.com.incentivados.model.Usuario;

@Repository
public interface ProjetoRepository extends JpaRepository<Projeto, Projeto> {


    boolean existsByTitulo(String titulo);

    Optional<Projeto> findById(Long id);

    Page<Projeto> findAllByUsuario(Usuario usuario, Pageable page);

    Long countByUsuario(Usuario usuario);

    Long countByIncentivosFiscais(IncentivoFiscal incentivoFiscal);

}
