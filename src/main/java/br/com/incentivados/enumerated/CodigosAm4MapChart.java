package br.com.incentivados.enumerated;

import lombok.Getter;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 14/05/2020
 */
@Getter
public enum CodigosAm4MapChart {
    BR_AC("BR-AC", "Acre"),
    BR_AL("BR-AL", "Alagoas"),
    BR_AP("BR-AP", "Amapá"),
    BR_AM("BR-AM", "Amazonas"),
    BR_BA("BR-BA", "Bahia"),
    BR_CE("BR-CE", "Ceará"),
    BR_DF("BR-DF", "Distrito Federal"),
    BR_ES("BR-ES", "Espírito Santo"),
    BR_GO("BR-GO", "Goiânia"),
    BR_MA("BR-MA", "Maranhão"),
    BR_MT("BR-MT", "Mato Grosso"),
    BR_MS("BR-MS", "Mato Grosso do Sul"),
    BR_MG("BR-MG", "Minas Gerais"),
    BR_PA("BR-PA", "Pará"),
    BR_PB("BR-PB", "Paraíba"),
    BR_PR("BR-PR", "Paraná"),
    BR_PE("BR-PE", "Pernambuco"),
    BR_PI("BR-PI", "Piauí"),
    BR_RJ("BR-RJ", "Rio de Janeiro"),
    BR_RN("BR-RN", "Rio Grande do Norte"),
    BR_RS("BR-RS", "Rio Grande do Sul"),
    BR_RO("BR-RO", "Rondônia"),
    BR_RR("BR-RR", "Roraima"),
    BR_SC("BR-SC", "Santa Catarina"),
    BR_SP("BR-SP", "São Paulo"),
    BR_SE("BR-SE", "Sergipe"),
    BR_TO("BR-TO", "Tocantins");

    private String id;
    private String descricao;

    CodigosAm4MapChart(String id, String descricao) {
        this.id = id;
        this.descricao = descricao;
    }
}
