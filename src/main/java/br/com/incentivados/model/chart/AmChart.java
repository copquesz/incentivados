package br.com.incentivados.model.chart;

import br.com.incentivados.enumerated.CodigosAmChart;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 14/05/2020
 */
@Getter
@Setter
public class AmChart {

    @Enumerated(EnumType.STRING)
    private CodigosAmChart id;

    private Long value;
}
