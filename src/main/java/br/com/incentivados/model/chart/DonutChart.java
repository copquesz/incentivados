package br.com.incentivados.model.chart;

import lombok.Getter;
import lombok.Setter;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 14/05/2020
 */
@Getter
@Setter
public class DonutChart {

    private String label;
    private Long value;

    public DonutChart(String label, Long value) {
        this.label = label;
        this.value = value;
    }
}
