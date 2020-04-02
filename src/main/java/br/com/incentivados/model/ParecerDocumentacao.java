package br.com.incentivados.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/04/2020
 */
@Setter
@Getter
@Entity
public class ParecerDocumentacao {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "data_cadastro")
    private Date dataCadastro;

    @Column(columnDefinition = "TEXT")
    private String analise;

    @JoinColumn(name = "usuario_id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario analista;

}
