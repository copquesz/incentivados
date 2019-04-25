package br.com.incentivados.repository;

import java.util.List;
import java.util.Optional;

import br.com.incentivados.model.Empresa;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.incentivados.enumerated.StatusPedido;
import br.com.incentivados.model.Pedido;
import br.com.incentivados.model.Usuario;

@Repository
public interface PedidoRepository extends JpaRepository<Pedido, Long>{
	
	
	Optional<Pedido> findById(Long id);
	
	List<Pedido> findAllByUsuario(Usuario usuario);
	List<Pedido> findAllByEmpresa(Empresa empresa, Pageable page);
	List<Pedido> findAllByEmpresaAndStatus(Empresa empresa, StatusPedido status, Pageable page);
	List<Pedido> findAllByAnalistaAndStatus(Usuario analista, StatusPedido status, Pageable page);
	
	Long countByUsuario(Usuario usuario);
	Long countByEmpresa(Empresa empresa);
	Long countByAnalista(Usuario analista);
	Long countByStatus(StatusPedido status);
	Long countByEmpresaAndStatus(Empresa empresa, StatusPedido status);
	Long countByAnalistaAndStatus(Usuario analista, StatusPedido status);

}
