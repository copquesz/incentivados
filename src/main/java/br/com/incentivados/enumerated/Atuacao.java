package br.com.incentivados.enumerated;

import lombok.Getter;

@Getter
public enum Atuacao {

    CRIANCA_ADOLESCENTE(0, "Criança e Adolescente"),
    IDOSO(1, "Idoso"),
    ESPORTE(2, "Esporte"),
    CULTURA(3, "Cultura"),
    SAUDE(4, "Saúde"),
    EDUCACAO(5, "Educação"),
    MARKETING(6, "Marketing");


    private int id;
    private String descricao;

    Atuacao(int id, String descricao) {
        this.id = id;
        this.descricao = descricao;
    }

}
