package br.com.incentivados.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

@Setter
@Getter
@Entity
public class DocumentosEmpresa implements Serializable {

	private static final long serialVersionUID = -5965040417561644262L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "logo_id")
	private Arquivo logo;
}
