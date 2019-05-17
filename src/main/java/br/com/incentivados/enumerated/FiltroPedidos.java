package br.com.incentivados.enumerated;

import lombok.Getter;

@Getter
public enum FiltroPedidos {

    TODOS(0, "Todos"),
    LOJA(1, "Loja"),
    CIDADE(2, "Cidade"),
    ESTADO(3, "Estado"),
    ENTIDADE(3, "Entidade");

    private int id;
    private String descricao;

    FiltroPedidos(int id, String descricao){
        this.id = id;
        this.descricao = descricao;
    }
}
