package br.com.incentivados.enumerated;

import lombok.Getter;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 31/03/2020
 */
@Getter
public enum StatusArquivo {
    PENDENTE(0, "Pendente"),
    APROVADO(1, "Aprovado"),
    NEGADO(2, "Negado");
    private int id;
    private String descricao;

    StatusArquivo(int id, String descricao) {
        this.id = id;
        this.descricao = descricao;
    }
}
