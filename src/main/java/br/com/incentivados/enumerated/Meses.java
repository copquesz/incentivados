package br.com.incentivados.enumerated;

import lombok.Getter;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 14/05/2020
 */
@Getter
public enum Meses {
    JANEIRO(0, "Janeiro"),
    FEVEREIRO(1, "Fevereiro"),
    MARCO(2, "Março"),
    ABRIL(3, "Abril"),
    MAIO(4, "Maio"),
    JUNHO(5, "Junho"),
    JULHO(6, "Julho"),
    AGOSTO(7, "Agosto"),
    SETEMBRO(8, "Setembro"),
    OUTUBRO(9, "Outubro"),
    NOVEMBRO(10, "Novembro"),
    DEZEMBRO(11, "Dezembro");

    private int id;
    private String descricao;

    Meses(int id, String descricao) {
        this.id = id;
        this.descricao = descricao;
    }
}
