package br.com.incentivados.model;

import br.com.incentivados.enumerated.StatusArquivo;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

import static br.com.incentivados.enumerated.StatusArquivo.NAO_SE_APLICA;

@Setter
@Getter
@Entity
@DynamicUpdate
public class Arquivo implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4626812439647558635L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_cadastro")
	private Date dataCadastro;

	@Enumerated(EnumType.STRING)
	private StatusArquivo status;
	
	@Transient
	private MultipartFile file;
	
	private String path;

	public Arquivo() {
		super();
		this.dataCadastro = new Date();
		this.status = NAO_SE_APLICA;
	}
	
	

}
