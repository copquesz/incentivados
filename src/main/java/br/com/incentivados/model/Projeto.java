package br.com.incentivados.model;

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
public class Projeto implements Serializable{
	
	private static final long serialVersionUID = -1229591784464619823L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_cadastro")
	private Date dataCadastro;
	
	private String titulo;

	@Column(name = "prazo_captacao")
	private String prazoCaptacao;
	
	@Column(name = "valor_solicitado")
	private String valorSolicitado;
	
	@Column(name = "valor_total")
	private String valorTotal;
	
	@Column(name = "beneficiarios_diretos")
	private Integer beneficiariosDiretos;
	
	@Column(name = "beneficiarios_indiretos")
	private Integer beneficiariosIndiretos;
	
	@Column(columnDefinition = "TEXT")
	private String contrapartida;
	
	@Column(columnDefinition = "TEXT")
	private String objetivo;
	
	@Column(columnDefinition = "TEXT")
	private String resumo;	
	
	@Column(columnDefinition = "TEXT")
	private String parceiros;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "usuario_id")
	private Usuario usuario;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "entidade_id")
	private Entidade entidade;
	
	@JoinColumn(name = "documentos_projeto_id")
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private DocumentosProjeto documentosProjeto;
	
	@ManyToMany
    @JoinTable(
        name = "projeto_has_incentivo_fiscal", 
        joinColumns = { @JoinColumn(name = "projeto_id") }, 
        inverseJoinColumns = { @JoinColumn(name = "incentivo_fiscal_id") }
    )	
	private List<IncentivoFiscal> incentivosFiscais;

	// Construtor
	public Projeto() {
		super();
		this.dataCadastro = new Date();
	}
	
	

}
