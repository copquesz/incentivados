package br.com.incentivados.repository;

import java.util.List;
import java.util.Optional;

import br.com.incentivados.model.Empresa;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import br.com.incentivados.enumerated.StatusPedido;
import br.com.incentivados.model.Pedido;
import br.com.incentivados.model.Usuario;

@Repository
public interface PedidoRepository extends JpaRepository<Pedido, Long>{
	
	
	Optional<Pedido> findById(Long id);

	List<Pedido> findAllByStatus(StatusPedido status, Pageable page);
	List<Pedido> findAllByUsuarioAndStatus(Usuario usuario, StatusPedido status, Pageable page);
	List<Pedido> findAllByEmpresaAndStatus(Empresa empresa, StatusPedido status, Pageable page);
	List<Pedido> findAllByAnalistaAndStatus(Usuario analista, StatusPedido status, Pageable page);

	Long countByUsuario(Usuario usuario);
	Long countByEmpresa(Empresa empresa);
	Long countByAnalista(Usuario analista);
	Long countByStatus(StatusPedido status);
	Long countByEmpresaAndStatus(Empresa empresa, StatusPedido status);
	Long countByAnalistaAndStatus(Usuario analista, StatusPedido status);

	Page<Pedido> findAllByEmpresa(Empresa empresa, Pageable page);
	Page<Pedido> findAllByUsuario(Usuario usuario, Pageable page);


	// Queries nativas para pesquisa de pedido por empresa e bairro
	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.analista.endereco.bairro LIKE %:key%")
	Page<Pedido> findAllByEmpresaAndBairro(@Param("empresa") Empresa empresa, @Param("key") String key, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.status = :status and pedido.analista.endereco.bairro LIKE %:key%")
	List<Pedido> findAllByEmpresaAndStatusAndBairro(@Param("empresa") Empresa empresa, @Param("status") StatusPedido status, @Param("key") String key, Pageable page);

	@Query("SELECT COUNT(pedido) FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.analista.endereco.bairro LIKE %:key%")
	Long countByEmpresaAndBairro(@Param("empresa") Empresa empresa,  @Param("key")String key);

	// Queries nativas para pesquisa de pedido por empresa e cidade
	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.analista.endereco.cidade LIKE %:key%")
	Page<Pedido> findAllByEmpresaAndCidade(@Param("empresa") Empresa empresa, @Param("key") String key, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.status = :status and pedido.analista.endereco.cidade LIKE %:key%")
	List<Pedido> findAllByEmpresaAndStatusAndCidade(@Param("empresa") Empresa empresa, @Param("status") StatusPedido status, @Param("key") String key, Pageable page);

	@Query("SELECT COUNT(pedido) FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.analista.endereco.cidade LIKE %:key%")
	Long countByEmpresaAndCidade(@Param("empresa") Empresa empresa,  @Param("key")String key);

	// Queries nativas para pesquisa de pedido por empresa e estado
	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.analista.endereco.estado LIKE %:key%")
	Page<Pedido> findAllByEmpresaAndEstado(@Param("empresa") Empresa empresa, @Param("key") String key, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.status = :status and pedido.analista.endereco.estado LIKE %:key%")
	List<Pedido> findAllByEmpresaAndStatusAndEstado(@Param("empresa") Empresa empresa, @Param("status") StatusPedido status, @Param("key") String key, Pageable page);

	@Query("SELECT COUNT(pedido) FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.analista.endereco.estado LIKE %:key%")
	Long countByEmpresaAndEstado(@Param("empresa") Empresa empresa,  @Param("key")String key);

	// Queries nativas para pesquisa de pedido por empresa e entidade
	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.entidade.nomeFantasia LIKE %:key%")
	Page<Pedido> findAllByEmpresaAndEntidade(@Param("empresa") Empresa empresa, @Param("key") String key, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.status = :status and pedido.entidade.nomeFantasia LIKE %:key%")
	List<Pedido> findAllByEmpresaAndStatusAndEntidade(@Param("empresa") Empresa empresa, @Param("status") StatusPedido status, @Param("key") String key, Pageable page);

	@Query("SELECT COUNT(pedido) FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.entidade.nomeFantasia LIKE %:key%")
	Long countByEmpresaAndEntidade(@Param("empresa") Empresa empresa,  @Param("key")String key);


}
