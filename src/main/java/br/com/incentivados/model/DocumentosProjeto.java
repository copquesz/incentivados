package br.com.incentivados.model;

import br.com.incentivados.enumerated.StatusArquivo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

import static br.com.incentivados.enumerated.StatusArquivo.PENDENTE;

@Setter
@Getter
@Entity
public class DocumentosProjeto implements Serializable {

	private static final long serialVersionUID = 4406458384830462217L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
	@JoinColumn(name = "logo_id")
	private Arquivo logo;

	@ManyToOne(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
	@JoinColumn(name = "proposta_tecnica")
	private Arquivo propostaTecnica;

	@ManyToOne(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
	@JoinColumn(name = "proposta_orcamentaria")
	private Arquivo propostOrcamentaria;

	@ManyToOne(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
	@JoinColumn(name = "dados_bancarios_fundo")
	private Arquivo dadosBancariosFundo;

	@ManyToOne(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
	@JoinColumn(name = "certificado")
	private Arquivo certificado;

	@Enumerated(EnumType.STRING)
	private StatusArquivo statusDocumentacao;

	@ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
	@JoinTable(
			name = "documentos_projeto_has_parecer_documentacao",
			joinColumns = { @JoinColumn(name = "documentos_projeto_id") },
			inverseJoinColumns = { @JoinColumn(name = "parecer_documentacao_id") }
	)
	private List<ParecerDocumentacao> pareceresDocumentacao;

	public DocumentosProjeto() {
		this.statusDocumentacao = PENDENTE;
	}
}
