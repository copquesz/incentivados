package br.com.incentivados.controller;

import br.com.incentivados.service.ChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.GregorianCalendar;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 14/05/2020
 */
@Controller
public class ChartController {

    private final ChartService chartService;

    @Autowired
    public ChartController(ChartService chartService) {
        this.chartService = chartService;
    }

    @GetMapping({"/painel/graficos/entidades/linha-do-tempo"})
    public String getLineChartEntidade(@RequestParam(required = false, defaultValue = "0") String ano, HttpServletRequest request, Model model) {
        System.out.println(ano);
        model.addAttribute("path", request.getContextPath());
        model.addAttribute("entidadeLineCharts", chartService.buildLineChartEntidade(Integer.parseInt(ano)));

        return "painel/admin/graficos/grafico-entidades-linha-do-tempo";
    }

    @GetMapping({"/painel/graficos/projetos/categoria"})
    public String getPieChartProjeto(HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        model.addAttribute("projetoPieCharts", chartService.buildPieChartProjetosCategoria());
        return "painel/admin/graficos/grafico-projetos-categoria";
    }
}
