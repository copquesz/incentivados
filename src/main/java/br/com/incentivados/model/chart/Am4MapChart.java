package br.com.incentivados.model.chart;

import br.com.incentivados.enumerated.CodigosAm4MapChart;
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
public class Am4MapChart {

    @Enumerated(EnumType.STRING)
    private CodigosAm4MapChart id;

    private Long value;
}
