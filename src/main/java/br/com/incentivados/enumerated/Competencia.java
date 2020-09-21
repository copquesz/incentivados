package br.com.incentivados.enumerated;

import lombok.Getter;

@Getter
public enum Competencia {

    MUNICIPAL(0, "Municipal"),
    ESTADUAL(1, "Estadual"),
    FEDERAL(2, "Federal");

    private int id;
    private String descricao;

    Competencia(int id, String descricao) {
        this.id = id;
        this.descricao = descricao;
    }

}

