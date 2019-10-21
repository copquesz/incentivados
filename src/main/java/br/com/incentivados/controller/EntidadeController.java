package br.com.incentivados.controller;

import br.com.incentivados.model.Entidade;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.EntidadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class EntidadeController {
    private EntidadeService entidadeService;
    private final Logger logger = Logger.getLogger(EntidadeController.class.getName());

    @Autowired
    public EntidadeController(EntidadeService entidadeService) {
        this.entidadeService = entidadeService;
    }

    @GetMapping({"/painel/entidades/cadastro"})
    public String getCadastrar(HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        return "painel/entidade/entidade/cadastro";
    }

    @PostMapping({"/painel/entidades/cadastro"})
    public String postCadastrar(Entidade entidade, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");

        try {
            if (!this.entidadeService.existsByCnpj(entidade.getCnpj())) {
                entidade = this.entidadeService.save(entidade, usuario, request);
                model.addAttribute("entidade", entidade);
                this.logger.log(Level.INFO, "Entidade cadastrada com sucesso: " + entidade.getNomeFantasia());
                return "painel/entidade/entidade/cadastro-entidade-sucesso";
            } else {
                model.addAttribute("entidade", entidade);
                this.logger.log(Level.INFO, "O cnpj ja possui registro na base de dados: " + entidade.getCnpj());
                return "painel/entidade/entidade/cadastro-entidade-falha-cnpj-cadastrado";
            }
        } catch (Exception var6) {
            this.logger.log(Level.SEVERE, "Erro inesperado ao cadastrar a entidade.", var6);
            return "painel/entidade/entidade/cadastro-entidade-falha";
        }
    }

    @GetMapping({"/painel/entidades/{id}"})
    public String getVisualizar(@PathVariable Long id, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");

        try {
            if (this.entidadeService.findById(id).isPresent()) {
                Entidade entidade = (Entidade)this.entidadeService.findById(id).get();
                model.addAttribute("entidade", entidade);
                switch(usuario.getTipoUsuario()) {
                    case ADMIN:
                        return "painel/admin/entidade/perfil";
                    case ENTIDADE:
                        return "painel/entidade/entidade/perfil";
                    default:
                        return "";
                }
            } else {
                this.logger.log(Level.INFO, "Usuário não possui permissão para visualizar a página.");
                return "";
            }
        } catch (Exception var6) {
            this.logger.log(Level.SEVERE, "Erro ao visualizar a entidade.", var6);
            return "";
        }
    }

    @GetMapping({"/painel/entidades"})
    public String getListar(HttpServletRequest request, Model model, @RequestParam(required = false,defaultValue = "0") int page, @RequestParam(required = false,defaultValue = "0") String key) {
        model.addAttribute("path", request.getContextPath());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");

        try {
            Pageable pageable = PageRequest.of(page, 5, Sort.by(new Sort.Order[]{Sort.Order.asc("id")}));
            switch(usuario.getTipoUsuario()) {
                case ADMIN:
                    model.addAttribute("entidades", this.entidadeService.findAll(pageable, key));
                    return "painel/admin/entidade/lista";
                case ENTIDADE:
                    model.addAttribute("entidades", this.entidadeService.findAllByUsuarioAndCnpjOrNomeFantasia(usuario, pageable, key));
                    return "painel/entidade/entidade/lista";
                default:
                    return "";
            }
        } catch (Exception var7) {
            this.logger.log(Level.SEVERE, "Erro ao listar as entidades.", var7);
            return "";
        }
    }
}
