package br.com.incentivados.enumerated;

import lombok.Getter;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 23/08/2019
 */
@Getter
public enum TipoAvaliacao {

    TECNICA(0, "Técnica"),
    INSTITUCIONAL(1, "Institucional");

    private int id;
    private String descricao;

    TipoAvaliacao(int id, String descricao) {
        this.id = id;
        this.descricao = descricao;
    }
}
