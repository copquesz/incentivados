package br.com.incentivados.controller;

import br.com.incentivados.enumerated.Atuacao;
import br.com.incentivados.enumerated.Competencia;
import br.com.incentivados.model.IncentivoFiscal;
import br.com.incentivados.service.IncentivoFiscalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class IncentivoFiscalController {

    private IncentivoFiscalService incentivoFiscalService;
    private final Logger logger = Logger.getLogger(EntidadeController.class.getName());

    @Autowired
    public IncentivoFiscalController(IncentivoFiscalService incentivoFiscalService) {
        this.incentivoFiscalService = incentivoFiscalService;
    }

    /**
     * Exibe a lista de Incentivos Fiscais cadastrados.
     *
     * @param page    int - Número da página que será buscada no banco de dados.
     * @param request Recebe dados da requisição.
     * @param model   Fornece dados para a view.
     * @return Retorna  a página com a lista de incentivados cadastrados.
     */
    @GetMapping("/painel/incentivos-fiscais")
    public String getListar(@RequestParam(required = false, defaultValue = "0") int page, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        model.addAttribute("qtdIncentivosFiscais", incentivoFiscalService.count());
        model.addAttribute("incentivosFiscais", incentivoFiscalService.findAll(PageRequest.of(page, 10, Sort.by(Sort.Order.asc("id")))));

        return "painel/admin/incentivo-fiscal/lista";
    }


    /**
     * Exibe o formulário de cadastro de Incentivo Fiscal
     *
     * @param request Recebe dados da requisição.
     * @param model   Fornece dados para a view.
     * @return Retorna a página com o formulário para cadastro do Incentivo Fiscal.
     */
    @GetMapping("/painel/incentivos-fiscais/cadastro")
    public String getCadastrar(HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        // Lista as Competências para cadastrar um novo Incentivo Fiscal.
        Competencia competencias[] = Competencia.values();
        model.addAttribute("competencias", competencias);

        // Lista as Atuações para cadastrar um novo Incentivo Fiscal.
        Atuacao atuacoes[] = Atuacao.values();
        model.addAttribute("atuacoes", atuacoes);

        return "painel/admin/incentivo-fiscal/cadastro";
    }

    /**
     * Persiste um Incentivo Fiscal na base de dados.
     *
     * @param incentivoFiscal Objeto que será persistido.
     * @param request         Recebe dados da requisição.
     * @param model           Fornece dados para a view.
     * @return 1) Retorna a página de sucesso caso o objeto seja persistido.
     *         2) Retorna a página de erro caso ocorra alguma falha.
     */
    @PostMapping("/painel/incentivos-fiscais/cadastro")
    public String postCadastrar(IncentivoFiscal incentivoFiscal, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        try {
            incentivoFiscal = incentivoFiscalService.save(incentivoFiscal);
            model.addAttribute("incentivoFiscal", incentivoFiscal);
            logger.log(Level.INFO, "Incentivo Fiscal cadastrado com sucesso: " + incentivoFiscal.getLegislacao());
            return "painel/admin/incentivo-fiscal/cadastro-incentivo-fiscal-sucesso";
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Erro ao cadastrar Incentivo Fiscal.", e);
            return "painel/admin/incentivo-fiscal/cadastro-incentivo-fiscal-falha";
        }

    }

}
