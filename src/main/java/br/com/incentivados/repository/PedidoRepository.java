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

    Long countByUsuario(Usuario usuario);

    Long countByEmpresa(Empresa empresa);

    Long countByAnalista(Usuario analista);

    Long countByStatus(StatusPedido status);

    Long countByUsuarioEnderecoEstado(String estado);

    Page<Pedido> findAllByStatus(StatusPedido status, Pageable page);

    Page<Pedido> findAllByEmpresa(Empresa empresa, Pageable page);

    Page<Pedido> findAllByUsuario(Usuario usuario, Pageable page);

    Page<Pedido> findAllByEmpresaAndStatus(Empresa empresa, StatusPedido status, Pageable page);

    Page<Pedido> findAllByAnalistaAndStatus(Usuario analista, StatusPedido status, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.analista.endereco.bairro LIKE %:key%")
    Page<Pedido> findAllByLoja(@Param("key") String key, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.analista.endereco.bairro LIKE %:key% AND pedido.status = :status")
    Page<Pedido> findAllByLojaAndStatus(@Param("key") String key, @Param("status") StatusPedido status, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.analista.endereco.cidade LIKE %:key%")
    Page<Pedido> findAllByCidade(@Param("key") String key, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.analista.endereco.cidade LIKE %:key% AND pedido.status = :status")
    Page<Pedido> findAllByCidadeAndStatus(@Param("key") String key, @Param("status") StatusPedido status, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.analista.endereco.estado LIKE %:key%")
    Page<Pedido> findAllByEstado(@Param("key") String key, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.analista.endereco.estado LIKE %:key% AND pedido.status = :status")
    Page<Pedido> findAllByEstadoAndStatus(@Param("key") String key, @Param("status") StatusPedido status, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.entidade.nomeFantasia LIKE %:key%")
    Page<Pedido> findAllByEntidade(@Param("key") String key, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.entidade.nomeFantasia LIKE %:key% AND pedido.status = :status")
    Page<Pedido> findAllByEntidadeAndStatus(@Param("key") String key, @Param("status") StatusPedido status, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.analista.endereco.bairro LIKE %:key%")
    Page<Pedido> findAllByEmpresaAndLoja(@Param("empresa") Empresa empresa, @Param("key") String key, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.status = :status and pedido.analista.endereco.bairro LIKE %:key%")
    Page<Pedido> findAllByEmpresaAndLojaAndStatus(@Param("empresa") Empresa empresa, @Param("key") String key, @Param("status") StatusPedido status, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.analista.endereco.cidade LIKE %:key%")
    Page<Pedido> findAllByEmpresaAndCidade(@Param("empresa") Empresa empresa, @Param("key") String key, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.analista.endereco.estado LIKE %:key%")
    Page<Pedido> findAllByEmpresaAndEstado(@Param("empresa") Empresa empresa, @Param("key") String key, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.status = :status and pedido.analista.endereco.estado LIKE %:key%")
    List<Pedido> findAllByEmpresaAndEstadoAndStatus(@Param("empresa") Empresa empresa, @Param("key") String key, @Param("status") StatusPedido status, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.entidade.nomeFantasia LIKE %:key%")
    Page<Pedido> findAllByEmpresaAndEntidade(@Param("empresa") Empresa empresa, @Param("key") String key, Pageable page);

    @Query("SELECT pedido FROM Pedido pedido WHERE pedido.empresa = :empresa and pedido.status = :status and pedido.entidade.nomeFantasia LIKE %:key%")
    List<Pedido> findAllByEmpresaAndEntidadeAndStatus(@Param("empresa") Empresa empresa, @Param("key") String key, @Param("status") StatusPedido status, Pageable page);
}
