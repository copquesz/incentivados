package br.com.incentivados.model;

import br.com.incentivados.enumerated.TipoAvaliacao;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 23/08/2019
 */
@Setter
@Getter
@Entity
@ToString
public class Avaliacao implements Serializable {

    private static final long serialVersionUID = 2429232922514211579L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Transient
    private List<Double> notas;

    private Double nota;

    @Enumerated(EnumType.ORDINAL)
    private TipoAvaliacao tipoAvaliacao;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "analista_id")
    private Usuario analista;

}
