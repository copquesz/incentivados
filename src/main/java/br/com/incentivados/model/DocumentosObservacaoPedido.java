package br.com.incentivados.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 06/08/2019
 */

@Setter
@Getter
@Entity
public class DocumentosObservacaoPedido implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "nota_fiscal")
    private Arquivo notaFiscal;

}
