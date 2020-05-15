package br.com.incentivados.controller;

import br.com.incentivados.enumerated.StatusPedido;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.ChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

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

        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");

        model.addAttribute("entidadesLineChart", chartService.buildLineChartEntidade(Integer.parseInt(ano)));
        model.addAttribute("path", request.getContextPath());

        switch (usuario.getTipoUsuario()){
            case ADMIN:
                return "painel/admin/graficos/grafico-entidades-linha-do-tempo";
            case EMPRESA:
                return "painel/empresa/graficos/grafico-entidades-linha-do-tempo";
            default:
                return "";
        }
    }

    @GetMapping({"/painel/graficos/projetos/categoria"})
    public String getPieChartProjeto(HttpServletRequest request, Model model) {

        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");

        model.addAttribute("path", request.getContextPath());
        model.addAttribute("projetoPieCharts", chartService.buildPieChartProjetosCategoria());

        switch (usuario.getTipoUsuario()){
            case ADMIN:
                return "painel/admin/graficos/graficos/grafico-projetos-categoria";
            case EMPRESA:
                return "painel/empresa/graficos/grafico-projetos-categoria";
            default:
                return "";
        }
    }

    @GetMapping({"/painel/graficos/projetos/mapa"})
    public String getAm4ChartProjetosLocalidade(HttpServletRequest request, Model model) {

        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");

        model.addAttribute("path", request.getContextPath());
        model.addAttribute("am4ChartsProjetosLocalidade", chartService.buildAm4ChartProjetosLocalidade());
        model.addAttribute("totalProjetos", chartService.countTotalProjetos());

        switch (usuario.getTipoUsuario()){
            case ADMIN:
                return "painel/admin/graficos/graficos/grafico-projetos-localidade";
            case EMPRESA:
                return "painel/empresa/graficos/grafico-projetos-localidade";
            default:
                return "";
        }
    }

    @GetMapping({"/painel/graficos/pedidos/status"})
    public String getDonutChartPedidosStatus(HttpServletRequest request, Model model) {

        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");

        model.addAttribute("path", request.getContextPath());
        model.addAttribute("pendentes", chartService.buildDonutChartPedidosStatus(StatusPedido.PENDENTE));
        model.addAttribute("recusados", chartService.buildDonutChartPedidosStatus(StatusPedido.RECUSADO));
        model.addAttribute("aprovados", chartService.buildDonutChartPedidosStatus(StatusPedido.APROVADO));

        switch (usuario.getTipoUsuario()){
            case ADMIN:
                return "painel/admin/graficos/graficos/grafico-pedidos-status";
            case EMPRESA:
                return "painel/empresa/graficos/grafico-pedidos-status";
            default:
                return "";
        }
    }

    @GetMapping({"/painel/graficos/pedidos/mapa"})
    public String getAm4ChartPedidosLocalidade(HttpServletRequest request, Model model) {

        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");

        model.addAttribute("path", request.getContextPath());
        model.addAttribute("am4ChartsPedidosLocalidade", chartService.buildAm4ChartPedidosLocalidade());
        model.addAttribute("totalPedidos", chartService.countTotalPedidos());

        switch (usuario.getTipoUsuario()){
            case ADMIN:
                return "painel/admin/graficos/graficos/grafico-pedidos-localidade";
            case EMPRESA:
                return "painel/empresa/graficos/grafico-pedidos-localidade";
            default:
                return "";
        }
    }
}
