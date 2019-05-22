package br.com.incentivados.model;

import br.com.incentivados.enumerated.TipoUsuario;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@Entity
public class Usuario implements Serializable {

	private static final long serialVersionUID = 4802512298815065850L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Temporal(TemporalType.TIMESTAMP)	
	private Date dataCadastro;

	@Temporal(TemporalType.TIMESTAMP)	
	private Date ultimoAcesso;
	
	private String nome;
	
	private String sobrenome;

	private String telefone;

	private String cpf;
	
	private String email;

	private String senha;
	
	@OneToMany(mappedBy = "usuario",fetch = FetchType.LAZY, orphanRemoval = true)
	private List<Pedido> pedidos;

	@Enumerated(EnumType.ORDINAL)
	@Column(name = "tipo_usuario")
	private TipoUsuario tipoUsuario;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "endereco_id")
	private Endereco endereco;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "empresa_id")
	private Empresa empresa;

	public Usuario() {
		super();
		this.dataCadastro = new Date();
	}

}
