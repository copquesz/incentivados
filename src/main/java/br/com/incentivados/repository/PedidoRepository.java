package br.com.incentivados.repository;

import br.com.incentivados.enumerated.StatusPedido;
import br.com.incentivados.model.Empresa;
import br.com.incentivados.model.Pedido;
import br.com.incentivados.model.Usuario;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PedidoRepository extends JpaRepository<Pedido, Long> {
	Optional<Pedido> findById(Long id);

	List<Pedido> findAllByStatus(StatusPedido status, Pageable page);

	List<Pedido> findAllByEmpresaAndStatus(Empresa empresa, StatusPedido status, Pageable page);

	List<Pedido> findAllByUsuarioAndStatus(Usuario usuario, StatusPedido status, Pageable page);

	List<Pedido> findAllByAnalistaAndStatus(Usuario analista, StatusPedido status, Pageable page);

	Long countByUsuario(Usuario usuario);

	Long countByEmpresa(Empresa empresa);

	Long countByAnalista(Usuario analista);

	Long countByStatus(StatusPedido status);

	Long countByEmpresaAndStatus(Empresa empresa, StatusPedido status);

	Long countByAnalistaAndStatus(Usuario analista, StatusPedido status);

	Page<Pedido> findAllByEmpresa(Empresa empresa, Pageable page);

	Page<Pedido> findAllByUsuario(Usuario usuario, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.analista.endereco.bairro LIKE %:key%")
	Page<Pedido> findAllByLoja(@Param("key") String key, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.analista.endereco.bairro LIKE %:key% AND pedido.status = :status")
	List<Pedido> findAllByLojaAndStatus(@Param("key") String key, @Param("status") StatusPedido status, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.analista.endereco.cidade LIKE %:key%")
	Page<Pedido> findAllByCidade(@Param("key") String key, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.analista.endereco.cidade LIKE %:key% AND pedido.status = :status")
	List<Pedido> findAllByCidadeAndStatus(@Param("key") String key, @Param("status") StatusPedido status, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.analista.endereco.estado LIKE %:key%")
	Page<Pedido> findAllByEstado(@Param("key") String key, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.analista.endereco.estado LIKE %:key% AND pedido.status = :status")
	List<Pedido> findAllByEstadoAndStatus(@Param("key") String key, @Param("status") StatusPedido status, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.entidade.nomeFantasia LIKE %:key%")
	Page<Pedido> findAllByEntidade(@Param("key") String key, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.entidade.nomeFantasia LIKE %:key% AND pedido.status = :status")
	List<Pedido> findAllByEntidadeAndStatus(@Param("key") String key, @Param("status") StatusPedido status, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.analista.endereco.bairro LIKE %:key%")
	Page<Pedido> findAllByEmpresaAndLoja(@Param("empresa") Empresa empresa, @Param("key") String key, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.status = :status and pedido.analista.endereco.bairro LIKE %:key%")
	List<Pedido> findAllByEmpresaAndLojaAndStatus(@Param("empresa") Empresa empresa, @Param("key") String key, @Param("status") StatusPedido status, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.analista.endereco.cidade LIKE %:key%")
	Page<Pedido> findAllByEmpresaAndCidade(@Param("empresa") Empresa empresa, @Param("key") String key, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.status = :status and pedido.analista.endereco.cidade LIKE %:key%")
	List<Pedido> findAllByEmpresaAndCidadeAndStatus(@Param("empresa") Empresa empresa, @Param("key") String key, @Param("status") StatusPedido status, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.analista.endereco.estado LIKE %:key%")
	Page<Pedido> findAllByEmpresaAndEstado(@Param("empresa") Empresa empresa, @Param("key") String key, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.status = :status and pedido.analista.endereco.estado LIKE %:key%")
	List<Pedido> findAllByEmpresaAndEstadoAndStatus(@Param("empresa") Empresa empresa, @Param("key") String key, @Param("status") StatusPedido status, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.entidade.nomeFantasia LIKE %:key%")
	Page<Pedido> findAllByEmpresaAndEntidade(@Param("empresa") Empresa empresa, @Param("key") String key, Pageable page);

	@Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.status = :status and pedido.entidade.nomeFantasia LIKE %:key%")
	List<Pedido> findAllByEmpresaAndEntidadeAndStatus(@Param("empresa") Empresa empresa, @Param("key") String key, @Param("status") StatusPedido status, Pageable page);
}
