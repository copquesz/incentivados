package br.com.incentivados.repository;

import br.com.incentivados.model.Entidade;
import br.com.incentivados.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface EntidadeRepository extends JpaRepository<Entidade, Long>{
	
	boolean existsByCnpj(String cnpj);
	boolean existsByUsuario(Usuario usuario);
	
	Long countByUsuario(Usuario usuario);
	
	Optional<Entidade> findById(Long id);
	
	List<Entidade> findTop3ByOrderByIdDesc();
	
	List<Entidade> findByUsuario(Usuario usuario);

}
