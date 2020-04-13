package br.com.incentivados.model;

import br.com.incentivados.enumerated.StatusArquivo;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

import static br.com.incentivados.enumerated.StatusArquivo.PENDENTE;

@Setter
@Getter
@Entity
public class DocumentosEntidade {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(optional = true, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "logo_id")
	private Arquivo logo;

	@ManyToOne(optional = true, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "ata_eleicao_id")
	private Arquivo ataEleicao;

	@ManyToOne(optional = true, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "estatuto_social_id")
	private Arquivo estatutoSocial;

	@ManyToOne(optional = true, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "identidade_id")
	private Arquivo identidade;
	
	@ManyToOne(optional = true, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "cartao_cnpj_id")
	private Arquivo cartaoCnpj;

	@ManyToOne(optional = true, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "dados_bancarios")
	private Arquivo dadosBancarios;

	@Enumerated(EnumType.STRING)
	private StatusArquivo statusDocumentacao;

	@JoinColumn(name = "entidade_id")
	@OneToOne(fetch = FetchType.LAZY)
	Entidade entidade;

	@ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
	@JoinTable(
			name = "documentos_entidade_has_parecer_documentacao",
			joinColumns = { @JoinColumn(name = "documentos_entidade_id") },
			inverseJoinColumns = { @JoinColumn(name = "parecer_documentacao_id") }
	)
	private List<ParecerDocumentacao> pareceresDocumentacao;

	public DocumentosEntidade(){
		this.statusDocumentacao = PENDENTE;
	}

}
