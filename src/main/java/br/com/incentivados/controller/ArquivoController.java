package br.com.incentivados.controller;

import br.com.incentivados.enumerated.StatusArquivo;
import br.com.incentivados.model.*;
import br.com.incentivados.service.ArquivoService;
import br.com.incentivados.service.EntidadeService;
import br.com.incentivados.service.ProjetoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 01/04/2020
 */
@Controller
public class ArquivoController {

    private final ArquivoService arquivoService;
    private final EntidadeService entidadeService;
    private final ProjetoService projetoService;
    private final Logger logger = Logger.getLogger(ArquivoController.class.getName());

    @Autowired
    public ArquivoController(ArquivoService arquivoService, EntidadeService entidadeService, ProjetoService projetoService) {
        this.arquivoService = arquivoService;
        this.entidadeService = entidadeService;
        this.projetoService = projetoService;
    }

    @GetMapping("/painel/entidades/{idEntidade}/documentos")
    public String exibeDocumentacaoEntidade(@PathVariable Long idEntidade, HttpServletRequest request, Model model){
        model.addAttribute("path", request.getContextPath());
        if(this.entidadeService.findById(idEntidade).isPresent()){
            model.addAttribute("entidade", this.entidadeService.findById(idEntidade).get());
            model.addAttribute("analista", request.getSession().getAttribute("usuario"));
            return "painel/admin/entidade/documentos";
        }
        else{
            return "";
        }
    }

    @GetMapping("/painel/projetos/{idProjeto}/documentos")
    public String exibeDocumentacaoProjeto(@PathVariable Long idProjeto, HttpServletRequest request, Model model){
        model.addAttribute("path", request.getContextPath());
        if(this.projetoService.findById(idProjeto).isPresent()){
            model.addAttribute("projeto", this.projetoService.findById(idProjeto).get());
            model.addAttribute("analista", request.getSession().getAttribute("usuario"));
            return "painel/admin/projeto/documentos";
        }
        else{
            return "";
        }
    }

    @PostMapping("/painel/entidades/documentos/analise")
    public String salvaAnaliseEntidade(DocumentosEntidade documentosEntidade, ParecerDocumentacao parecerDocumentacao, HttpServletRequest request, Model model){
        model.addAttribute("path", request.getContextPath());
        arquivoService.analisaDocumentacaoEntidade(documentosEntidade, parecerDocumentacao);
        return "redirect:/painel/dashboard";
    }

    @PostMapping("/painel/projetos/documentos/analise")
    public String salvaAnaliseProjeto(DocumentosProjeto documentosProjeto, ParecerDocumentacao parecerDocumentacao, HttpServletRequest request, Model model){
        model.addAttribute("path", request.getContextPath());
        arquivoService.analisaDocumentacaoProjeto(documentosProjeto, parecerDocumentacao);
        return "redirect:/painel/dashboard";
    }

    @PostMapping("/painel/entidades/{idEntidade}/documentos/reenviar")
    public String reenviaDocumentacaoEntidade(@PathVariable Long idEntidade, DocumentosEntidade documentosEntidade, HttpServletRequest request, Model model){
        model.addAttribute("path", request.getContextPath());
        Entidade entidade = entidadeService.findById(idEntidade).get();
        arquivoService.reenviarDocumentacaoEntidade(entidade, documentosEntidade, request);
        return "redirect:/painel/dashboard";
    }

    @PostMapping("/painel/projetos/{idProjeto}/documentos/reenviar")
    public String reenviaDocumentacaoProjeto(@PathVariable Long idProjeto, DocumentosProjeto documentosProjeto, HttpServletRequest request, Model model){
        model.addAttribute("path", request.getContextPath());
        Projeto projeto = projetoService.findById(idProjeto).get();
        arquivoService.reenviarDocumentacaoProjeto(projeto, documentosProjeto, request);
        return "redirect:/painel/dashboard";
    }

}
