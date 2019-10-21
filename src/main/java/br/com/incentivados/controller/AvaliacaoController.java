package br.com.incentivados.controller;

import br.com.incentivados.model.Avaliacao;
import br.com.incentivados.model.Projeto;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.ProjetoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 30/08/2019
 */
@Controller
public class AvaliacaoController {
    private ProjetoService projetoService;

    @Autowired
    public AvaliacaoController(ProjetoService projetoService) {
        this.projetoService = projetoService;
    }

    @GetMapping({"/painel/projetos/avaliacao/{idProjeto}"})
    public String getAvaliacao(@PathVariable Long idProjeto, HttpServletRequest request, Model model) {
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
        Projeto projeto = (Projeto)this.projetoService.findById(idProjeto).get();
        model.addAttribute("projeto", projeto);
        model.addAttribute("path", request.getContextPath());
        switch(usuario.getTipoUsuario()) {
            case ADMIN:
                return "painel/admin/projeto/avaliacao";
            case EMPRESA:
                return "painel/empresa/projeto/avaliacao";
            default:
                return "";
        }
    }

    @PostMapping({"/painel/projetos/avaliacao/{idProjeto}"})
    @Transactional
    public String postAvaliacao(@PathVariable Long idProjeto, Avaliacao avaliacao, HttpServletRequest request, Model model) {
        Projeto projeto = (Projeto)this.projetoService.findById(idProjeto).get();
        projeto = this.projetoService.setAvaliacao(projeto, avaliacao);
        model.addAttribute("projeto", projeto);
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
        switch(usuario.getTipoUsuario()) {
            case ADMIN:
                return "painel/admin/projeto/avaliacao-sucesso";
            case EMPRESA:
                return "painel/empresa/projeto/avaliacao-sucesso";
            default:
                return "erro";
        }
    }
}
