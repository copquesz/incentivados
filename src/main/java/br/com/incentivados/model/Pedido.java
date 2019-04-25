package br.com.incentivados.model;

import br.com.incentivados.enumerated.StatusPedido;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@ToString
@Setter
@Getter
@Entity
public class Pedido implements Serializable {

	private static final long serialVersionUID = 6294036397205620735L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Temporal(TemporalType.TIMESTAMP)	
	private Date dataCadastro;

	@Column(columnDefinition = "TEXT")
	private String solicitacao;

	@Enumerated(EnumType.ORDINAL)
	private StatusPedido status;
	
	@JoinColumn(name = "documentos_pedido_id")
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private DocumentosPedido documentosPedido;

	@JoinColumn(name = "usuario_id")
	@ManyToOne(fetch = FetchType.EAGER)
	private Usuario usuario;

	@JoinColumn(name = "analista_id")
	@ManyToOne(fetch = FetchType.EAGER)
	private Usuario analista;

	@JoinColumn(name = "entidade_id")
	@ManyToOne(fetch = FetchType.EAGER)
	private Entidade entidade;

	@JoinColumn(name = "empresa_id")
	@ManyToOne(fetch = FetchType.EAGER)
	private Empresa empresa;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "observacao_pedido_id")
	private ObservacaoPedido observacaoPedido;

	// Construtor
	public Pedido() {
		this.dataCadastro = new Date();
		this.status = StatusPedido.PENDENTE;
	}

}
