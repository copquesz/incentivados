package br.com.incentivados.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
@Entity
public class ObservacaoPedido implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "data_cadastro")
    private Date dataCadastro;

    @Column(columnDefinition = "TEXT")
    private String avaliacao;

    @JoinColumn(name = "usuario_id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario usuario;

    @JoinColumn(name = "documentos_observacao_pedido_id")
    @OneToOne(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
    private DocumentosObservacaoPedido documentosObservacaoPedido;

    // Construtor
    public ObservacaoPedido() {
        this.dataCadastro = new Date();
    }
}
