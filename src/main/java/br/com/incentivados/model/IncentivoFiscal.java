package br.com.incentivados.model;

import br.com.incentivados.enumerated.Atuacao;
import br.com.incentivados.enumerated.Competencia;
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
public class IncentivoFiscal implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4814179166096065060L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_cadastro")
	private Date dataCadastro;

    private String legislacao;

    private String sigla;

    private String localidade;

    @Enumerated(EnumType.ORDINAL)
    private Competencia competencia;

    @Enumerated(EnumType.ORDINAL)
    private Atuacao atuacao;    

}
