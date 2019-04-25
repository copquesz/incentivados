package br.com.incentivados.repository;

import br.com.incentivados.model.ObservacaoPedido;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ObservacaoPedidoRepository extends JpaRepository<ObservacaoPedido, Long> {
}
