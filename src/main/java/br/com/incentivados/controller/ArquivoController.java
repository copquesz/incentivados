package br.com.incentivados.controller;

import br.com.incentivados.enumerated.StatusArquivo;
import br.com.incentivados.model.*;
import br.com.incentivados.service.ArquivoService;
import br.com.incentivados.service.EntidadeService;
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
    private final Logger logger = Logger.getLogger(ArquivoController.class.getName());

    @Autowired
    public ArquivoController(ArquivoService arquivoService, EntidadeService entidadeService) {
        this.arquivoService = arquivoService;
        this.entidadeService = entidadeService;
    }

    @GetMapping("/painel/entidades/{idEntidade}/documentos")
    public String exibeDocumentacao(@PathVariable Long idEntidade, HttpServletRequest request, Model model){
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

    @PostMapping("/painel/entidades/documentos/analise")
    public String salvaAnalise(DocumentosEntidade documentosEntidade, ParecerDocumentacao parecerDocumentacao, HttpServletRequest request, Model model){
        model.addAttribute("path", request.getContextPath());
        System.out.println(parecerDocumentacao);
        arquivoService.analisaDocumentacaoEntidade(documentosEntidade, parecerDocumentacao);
        return "redirect:/painel/dashboard";
    }
}
