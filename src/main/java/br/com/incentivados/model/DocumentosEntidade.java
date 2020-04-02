package br.com.incentivados.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Setter
@Getter
@Entity
public class DocumentosEntidade {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "logo_id")
	private Arquivo logo;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "ata_eleicao_id")
	private Arquivo ataEleicao;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "estatuto_social_id")
	private Arquivo estatutoSocial;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "identidade_id")
	private Arquivo identidade;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "cartao_cnpj_id")
	private Arquivo cartaoCnpj;

	@ManyToOne(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
	@JoinColumn(name = "dados_bancarios")
	private Arquivo dadosBancarios;

}
