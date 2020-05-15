package br.com.incentivados.model.chart;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 14/05/2020
 */
@Getter
@Setter
@ToString
public class Am4MapChart {


    private String id;
    private Long value;

    public Am4MapChart(String id, Long value) {
        this.id = id;
        this.value = value;
    }
}
