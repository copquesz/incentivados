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

    @GetMapping({"/painel/incentivos-fiscais"})
    public String getListar(@RequestParam(required = false,defaultValue = "0") int page, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        model.addAttribute("qtdIncentivosFiscais", this.incentivoFiscalService.count());
        model.addAttribute("incentivosFiscais", this.incentivoFiscalService.findAll(PageRequest.of(page, 10, Sort.by(new Sort.Order[]{Sort.Order.asc("id")}))));
        return "painel/admin/incentivo-fiscal/lista";
    }

    @GetMapping({"/painel/incentivos-fiscais/cadastro"})
    public String getCadastrar(HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Competencia[] competencias = Competencia.values();
        model.addAttribute("competencias", competencias);
        Atuacao[] atuacoes = Atuacao.values();
        model.addAttribute("atuacoes", atuacoes);
        return "painel/admin/incentivo-fiscal/cadastro";
    }

    @PostMapping({"/painel/incentivos-fiscais/cadastro"})
    public String postCadastrar(IncentivoFiscal incentivoFiscal, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());

        try {
            incentivoFiscal = this.incentivoFiscalService.save(incentivoFiscal);
            model.addAttribute("incentivoFiscal", incentivoFiscal);
            this.logger.log(Level.INFO, "Incentivo Fiscal cadastrado com sucesso: " + incentivoFiscal.getLegislacao());
            return "painel/admin/incentivo-fiscal/cadastro-incentivo-fiscal-sucesso";
        } catch (Exception var5) {
            this.logger.log(Level.SEVERE, "Erro ao cadastrar Incentivo Fiscal.", var5);
            return "painel/admin/incentivo-fiscal/cadastro-incentivo-fiscal-falha";
        }
    }
}