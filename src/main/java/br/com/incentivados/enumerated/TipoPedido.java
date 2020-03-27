package br.com.incentivados.enumerated;

import lombok.Getter;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 27/03/2020
 */
@Getter
public enum TipoPedido {

    MANUTENCAO(0, "Manutenção"),
    REFORMA(1, "Reforma"),
    EQUIPAMENTOS(2, "Equipamentos"),
    JARDINAGEM(3, "Jardinagem"),
    ALIMENTOS(4, "Alimentos"),
    MATERIAIS_DIVERSOS(5, "Materiais Diversos");

    private int id;
    private String descricao;

    TipoPedido(int id, String descricao) {
        this.id = id;
        this.descricao = descricao;
    }
}
