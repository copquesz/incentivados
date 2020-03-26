package br.com.incentivados.repository;

import br.com.incentivados.enumerated.TipoUsuario;
import br.com.incentivados.model.Empresa;
import br.com.incentivados.model.Usuario;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

	boolean existsByCpf(String cpf);
	boolean existsByEmail(String email);
	boolean existsByEmailAndSenha(String cpf, String senha);  
    
    Optional<Usuario> findByEmail(String email);

	@Query("SELECT usuario FROM Usuario usuario WHERE usuario.empresa = :empresa AND usuario.tipoUsuario = :tipoUsuario AND (usuario.nome LIKE %:key% OR usuario.sobrenome LIKE %:key%)")
    Page<Usuario> findAllByEmpresa(Pageable page, @Param("empresa") Empresa empresa, @Param("key")String key, @Param("tipoUsuario") TipoUsuario tipoUsuario);

}
