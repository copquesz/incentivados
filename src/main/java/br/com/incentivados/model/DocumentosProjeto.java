package br.com.incentivados.model;

import br.com.incentivados.enumerated.StatusArquivo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

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

	public DocumentosProjeto() {
	}
}
