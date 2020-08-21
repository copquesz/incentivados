package br.com.incentivados.controller;

import br.com.incentivados.enumerated.Ods;
import br.com.incentivados.model.Empresa;
import br.com.incentivados.model.IncentivoFiscal;
import br.com.incentivados.model.Projeto;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class ProjetoController {
    private final ProjetoService projetoService;
    private final EntidadeService entidadeService;
    private final IncentivoFiscalService incentivoFiscalService;
    private final EmpresaService empresaService;
    private final JavaMailService javaMailService;
    private final Logger logger = Logger.getLogger(EntidadeController.class.getName());

    @Autowired
    public ProjetoController(ProjetoService projetoService, EntidadeService entidadeService, IncentivoFiscalService incentivoFiscalService, EmpresaService empresaService, JavaMailService javaMailService) {
        this.projetoService = projetoService;
        this.entidadeService = entidadeService;
        this.incentivoFiscalService = incentivoFiscalService;
        this.empresaService = empresaService;
        this.javaMailService = javaMailService;
    }

    @GetMapping({"/painel/projetos"})
    public String getListar(@RequestParam(required = false,defaultValue = "0") int page, @RequestParam(required = false,defaultValue = "") String key, @RequestParam(required = false,defaultValue = "0") IncentivoFiscal categoria, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        model.addAttribute("categoria", categoria);
        model.addAttribute("key", key);
        model.addAttribute("incentivosFiscais", this.incentivoFiscalService.findAll());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");

        try {
            Pageable pageable = PageRequest.of(page, 12, Sort.by(new Sort.Order[]{Sort.Order.desc("id"), Sort.Order.desc("qtdAvaliacoes")}));
            Page<Projeto> projetos;
            switch(usuario.getTipoUsuario()) {
                case ADMIN:
                    if (categoria != null && !categoria.equals("0")) {
                        projetos = this.projetoService.findAllByTituloContainingAndIncentivosFiscaisContaining(pageable, key, categoria);
                    } else {
                        projetos = this.projetoService.findAll(pageable, key);
                    }
                    projetos.getContent().forEach((projeto) -> {
                        projeto.setAvaliado(this.projetoService.verifyAvaliacao(projeto.getId(), usuario.getId()));
                    });
                    model.addAttribute("projetos", projetos);
                    model.addAttribute("qtdAvaliados", this.projetoService.countProjetosAvaliados(usuario.getId()));
                    model.addAttribute("qtdPendentes", this.projetoService.count() - this.projetoService.countProjetosAvaliados(usuario.getId()));
                    return "painel/admin/projeto/lista";
                case ENTIDADE:
                    model.addAttribute("projetos", this.projetoService.findAllByUsuario(usuario, pageable, key));
                    return "painel/entidade/projeto/lista";
                case EMPRESA:
                    if (categoria != null && !categoria.equals("0")) {
                        projetos = this.projetoService.findAllByTituloContainingAndIncentivosFiscaisContaining(pageable, key, categoria);
                    } else {
                        projetos = this.projetoService.findAll(pageable, key);
                    }
                    projetos.getContent().forEach((projeto) -> {
                        projeto.setAvaliado(this.projetoService.verifyAvaliacao(projeto.getId(), usuario.getId()));
                    });
                    model.addAttribute("projetos", projetos);
                    model.addAttribute("qtdAvaliados", this.projetoService.countProjetosAvaliados(usuario.getId()));
                    model.addAttribute("qtdPendentes", this.projetoService.count() - this.projetoService.countProjetosAvaliados(usuario.getId()));
                    return "painel/empresa/projeto/lista";
                default:
                    this.logger.log(Level.WARNING, "Usuário não encontrado.");
                    return "";
            }
        } catch (Exception var9) {
            this.logger.log(Level.SEVERE, "Erro listar projetos.", var9);
            return "";
        }
    }

    /*
     * DESABILITA INSCRIÇÃO DE PROJETOS
    @GetMapping({"/painel/projetos/cadastro"})
    public String getCadastrar(HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
        model.addAttribute("entidades", this.entidadeService.findAllByUsuario(usuario));
        model.addAttribute("incentivosFiscais", this.incentivoFiscalService.findAll());
        return "painel/entidade/projeto/cadastro";
    }



    @PostMapping({"/painel/projetos/cadastro"})
    public String postCadastrar(@RequestParam(required = false,defaultValue = "18.520.427/0001-86") String cnpj, Projeto projeto, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");

        try {
            if (!this.projetoService.existsByTitulo(projeto.getTitulo())) {
                projeto = this.projetoService.save(projeto, usuario, request);
                model.addAttribute("projeto", projeto);
                this.logger.log(Level.INFO, "Projeto cadastrado com sucesso: " + projeto.getTitulo());
                if (!cnpj.equals("18.520.427/0001-86")) {
                    Optional<Empresa> empresa = this.empresaService.findByCnpj(cnpj);
                    if (empresa.isPresent()) {
                        this.empresaService.adicionaProjeto((Empresa)empresa.get(), projeto);
                        this.logger.log(Level.INFO, "Projeto " + projeto.getTitulo() + " adicionado a lista de: " + ((Empresa)empresa.get()).getNomeFantasia());
                    }
                }
                javaMailService.enviarEmailNotificacaoDocumentosProjetoPendenteAnalise(projeto);
                return "painel/entidade/projeto/cadastro-projeto-sucesso";
            } else {
                model.addAttribute("projeto", projeto);
                this.logger.log(Level.INFO, "Projeto já existente: " + projeto.getTitulo());
                return "painel/entidade/projeto/cadastro-projeto-titulo-cadastrado";
            }
        } catch (Exception var7) {
            this.logger.log(Level.SEVERE, "Falha cadastro de projeto.", var7);
            return "painel/entidade/projeto/cadastro-projeto-falha";
        }
    }

    */

    @GetMapping({"/painel/projetos/{id}"})
    public String getPerfil(@PathVariable Long id, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");

        try {
            Optional<Projeto> projeto = this.projetoService.findById(id);
            if (projeto.isPresent()) {
                model.addAttribute("projeto", projeto.get());
            }

            switch(usuario.getTipoUsuario()) {
                case ADMIN:
                    List<Empresa> empresas = this.empresaService.findAll();
                    Iterator var7 = empresas.iterator();

                    while(var7.hasNext()) {
                        Empresa empresa = (Empresa)var7.next();
                        empresa.setIndicacao(this.empresaService.isIndicacao(empresa, (Projeto)projeto.get()));
                    }

                    model.addAttribute("empresas", empresas);
                    Ods[] listaOds = Ods.values();
                    model.addAttribute("listaOds", listaOds);
                    return "painel/admin/projeto/perfil";
                case ENTIDADE:
                    return "painel/entidade/projeto/perfil";
                case EMPRESA:
                    return "painel/empresa/projeto/perfil";
                default:
                    this.logger.log(Level.WARNING, "Usuário não encontrado.");
                    return "";
            }
        } catch (Exception var9) {
            this.logger.log(Level.SEVERE, "Falha localizar projeto.", var9);
            return "";
        }
    }

    @PostMapping({"/painel/projetos/indicar"})
    public String postIndicarProjeto(@RequestParam(required = true) Long empresaId, @RequestParam(required = true) Long projetoId, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Optional<Projeto> projeto = this.projetoService.findById(projetoId);
        Optional<Empresa> empresa = this.empresaService.findById(empresaId);
        if (projeto.isPresent() && empresa.isPresent()) {
            this.empresaService.adicionaProjeto((Empresa)empresa.get(), (Projeto)projeto.get());
            this.logger.log(Level.INFO, "Projeto " + ((Projeto)projeto.get()).getTitulo() + " adicionado a lista de: " + ((Empresa)empresa.get()).getNomeFantasia());
        } else {
            this.logger.log(Level.WARNING, "Projeto ou Empresa não localizado.");
        }

        return "redirect:/painel/projetos/" + ((Projeto)projeto.get()).getId();
    }

    @PostMapping({"/painel/projetos/ods"})
    public String postAdicionarOds(@RequestParam(required = true) Long projetoId, @RequestParam List<Ods> ods, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Optional<Projeto> projeto = this.projetoService.findById(projetoId);
        if (projeto.isPresent()) {
            this.projetoService.adicionaOds((Projeto)projeto.get(), ods);
            this.logger.log(Level.INFO, "ODS's adicionada ao projeto " + ((Projeto)projeto.get()).getTitulo());
        } else {
            this.logger.log(Level.SEVERE, "Falha ao adicionar as ODS no projeto " + ((Projeto)projeto.get()).getTitulo());
        }

        return "redirect:/painel/projetos/" + ((Projeto)projeto.get()).getId();
    }

    @GetMapping({"/painel/ranking"})
    public String getRanking(HttpServletRequest request, Model model) {
        Pageable pageable = PageRequest.of(0, 30);
        model.addAttribute("path", request.getContextPath());
        model.addAttribute("projetos", this.projetoService.getRanking(pageable));
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
        switch(usuario.getTipoUsuario()) {
            case ADMIN:
                return "painel/admin/projeto/ranking";
            case EMPRESA:
                return "painel/empresa/projeto/ranking";
            default:
                return "erro";
        }
    }
}
