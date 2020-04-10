package br.com.incentivados.enumerated;

import lombok.Getter;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 31/03/2020
 */
@Getter
public enum StatusArquivo {
    PENDENTE(0, "Pendente", "#f1c40f"),
    APROVADO(1, "Aprovado", "#2ecc71"),
    NEGADO(2, "Negado", "#e74c3c"),
    NAO_SE_APLICA(3, "Não se Aplica", "#7f8c8d");

    private int id;
    private String descricao;
    private String cor;

    StatusArquivo(int id, String descricao, String cor) {
        this.id = id;
        this.descricao = descricao;
        this.cor = cor;
    }
}
