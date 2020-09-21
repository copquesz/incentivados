package br.com.incentivados.enumerated;

import lombok.Getter;

@Getter
public enum Ods {

    ERRADICACAO_DA_POBREZA(0, "Erradicação da Pobreza", "ods/icon-1.png"),
    FOME_ZERO_E_AGRICULTURA_SUSTENTAVEL(1, "Fome Zero e Agricultura Sustentável", "ods/icon-2.png"),
    SAUDE_E_BEM_ESTAR(2, "Saúde e Bem Estar", "ods/icon-3.png"),
    EDUCACAO_E_QUALIDADE(3, "Educação e Qualidade", "ods/icon-4.png"),
    IGUALDADE_DE_GENERO(4, "Igualdade de Gênero", "ods/icon-5.png"),
    AGUA_POTAVEL_E_SANEAMENTO(5, "Água Potável e Saneamento", "ods/icon-6.png"),
    ENERGIA_LIMPA_E_ACESSIVEL(6, "Energia Limpa e Acessível", "ods/icon-7.png"),
    TRABALHO_DECENTE_E_CRESCIMENTO_ECONOMICO(7, "Trabalho Decente e Crescimento Econômico", "ods/icon-8.png"),
    INDUSTRIA_INOVACAO_E_INFRAESTRUTURA(8, "Indústria, Inovação e Infraestrutura", "ods/icon-9.png"),
    REDUCAO_DAS_DESIGUALDADES(9, "Redução das Desigualdades", "ods/icon-10.png"),
    CIDADES_E_COMUNIDADES_SUSTENTAVEIS(10, "Cidades e Comunidades Sustentáveis", "ods/icon-11.png"),
    CONSUMO_E_PRODUCAO_RESPONSAVEIS(11, "Consumo e Produção Responsáveis", "ods.icon-12.png"),
    ACAO_CONTRA_MUDANCA_GLOBAL_DO_CLIMA(12, "Ação Contra Mudança Global do Clima", "ods/icon-13.png"),
    VIDA_NA_AGUA(13, "Vida na Água", "ods/icon-14.png"),
    VIDA_TERRESTRE(14, "Vida Terrestre", "ods/icon-15.png"),
    PAZ_JUSTICA_E_iNSTITUICOES_EFICAZES(15, "Paz, Justiça e Instituições Eficazes", "ods/icon-16.png"),
    PARCERIAS_E_MEIOS_DE_IMPLEMENTACOES(16, "Parcerias e Meios de Implementações", "ods/icon-17.png");


    int id;
    String descricao;
    String path;

    Ods(int id, String descricao, String path) {
        this.id = id;
        this.descricao = descricao;
        this.path = path;
    }
}
