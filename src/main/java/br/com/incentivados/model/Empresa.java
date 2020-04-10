package br.com.incentivados.model;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@Entity
public class Empresa implements Serializable {

	private static final long serialVersionUID = -8764619988704402910L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_cadastro")
	private Date dataCadastro;

	@Column(name = "nome_fantasia")
	private String nomeFantasia;

	@Column(name = "razao_social")
	private String razaoSocial;

	private String cnpj;

	@Transient
	private boolean indicacao;

	@JoinColumn(name = "usuario_id")
	@ManyToOne(fetch = FetchType.EAGER)
	private Usuario usuario;

	@JoinColumn(name = "documentos_empresa_id")
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private DocumentosEmpresa documentosEmpresa;

	@ManyToMany(cascade = { CascadeType.ALL })
	@JoinTable(
			name = "empresa_has_responsavel",
			joinColumns = { @JoinColumn(name = "empresa_id") },
			inverseJoinColumns = { @JoinColumn(name = "usuario_id") }
	)
	private List<Usuario> responsaveis;
	
	@ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
    @JoinTable(
        name = "empresa_has_analista", 
        joinColumns = { @JoinColumn(name = "empresa_id") }, 
        inverseJoinColumns = { @JoinColumn(name = "usuario_id") }
    )
	private List<Usuario> analistas;

	@ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	@JoinTable(
			name = "empresa_has_projeto",
			joinColumns = { @JoinColumn(name = "empresa_id") },
			inverseJoinColumns = { @JoinColumn(name = "projeto_id") }
	)
	private List<Projeto> projetos;
}
