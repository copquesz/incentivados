package br.com.incentivados.model;

import br.com.incentivados.enumerated.Ods;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Setter
@Getter
@Entity
@ToString
public class Projeto implements Serializable {
    private static final long serialVersionUID = -1229591784464619823L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Temporal(TemporalType.TIMESTAMP)
    private Date dataCadastro = new Date();

    private String titulo;

    private String prazoCaptacao;

    private String valorSolicitado;

    private String valorTotal;

    private Integer beneficiariosDiretos;

    private Integer beneficiariosIndiretos;

    private String contrapartida;
    @Column(columnDefinition = "TEXT")
    private String objetivo;
    @Column(columnDefinition = "TEXT")
    private String resumo;

    @Column(columnDefinition = "TEXT")
    private String parceiros;

    @Transient
    private boolean avaliado;

    private Double notaTecnica = 0.0D;

    private Double notaInstitucional = 0.0D;

    private Double notaGeral = 0.0D;

    private Integer qtdAvaliacoes = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "entidade_id")
    private Entidade entidade;

    @JoinColumn(name = "documentos_projeto_id")
    @OneToOne(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
    private DocumentosProjeto documentosProjeto;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "projeto_has_incentivo_fiscal",
			joinColumns = {@JoinColumn(name = "projeto_id")},
            inverseJoinColumns = {@JoinColumn(name = "incentivo_fiscal_id")}
    )
    private Set<IncentivoFiscal> incentivosFiscais = null;

    @ManyToMany(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
    @JoinTable(name = "projeto_has_avaliacao",
            joinColumns = {@JoinColumn( name = "projeto_id")},
            inverseJoinColumns = {@JoinColumn( name = "avaliacao_id")}
    )
    private Set<Avaliacao> avaliacoes;

    @ElementCollection
    @Enumerated(EnumType.STRING)
    private Collection<Ods> ods = null;

    public Projeto() {
    }

}
