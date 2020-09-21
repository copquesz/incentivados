package br.com.incentivados.enumerated;

import lombok.Getter;

@Getter
public enum TipoUsuario {

    ENTIDADE(0, "Entidade"),
    EMPRESA(1, "Empresa"),
    ANALISTA(2, "Analista"),
    ADMIN(3, "Administrador");

    private int id;
    private String descricao;

    TipoUsuario(int id, String descricao) {
        this.id = id;
        this.descricao = descricao;
    }
}