package br.com.incentivados.controller;

import br.com.incentivados.model.Projeto;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.EntidadeService;
import br.com.incentivados.service.IncentivoFiscalService;
import br.com.incentivados.service.ProjetoService;
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
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class ProjetoController {

    private ProjetoService projetoService;
    private EntidadeService entidadeService;
    private IncentivoFiscalService incentivoFiscalService;
    private final Logger logger = Logger.getLogger(EntidadeController.class.getName());

    @Autowired
    public ProjetoController(ProjetoService projetoService, EntidadeService entidadeService,
                             IncentivoFiscalService incentivoFiscalService) {
        super();
        this.projetoService = projetoService;
        this.entidadeService = entidadeService;
        this.incentivoFiscalService = incentivoFiscalService;
    }

    /**
     * Exibe a lista de projetos
     *
     * @param request Recebe dados da requisição.
     * @param model   Fornece dados para a view.
     * @return Retorna a lista de projetos solicitada.
     */
    @GetMapping("/painel/projetos")
    public String getListar(@RequestParam(required = false, defaultValue = "0") int page, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        // Recebe o USUARIO logado na session
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        try {
            Pageable pageable = PageRequest.of(page, 9, Sort.by(Sort.Order.asc("id")));

            // Direciona o USUARIO para sua view de acordo com perfil
            switch (usuario.getTipoUsuario()) {
                case ADMIN:
                    model.addAttribute("projetos", projetoService.findAll(pageable));
                    model.addAttribute("qtdProjetos", projetoService.count());
                    return "painel/admin/projeto/lista";
                case ENTIDADE:
                    model.addAttribute("projetos", projetoService.findAllByUsuario(usuario, pageable));
                    model.addAttribute("qtdProjetos", projetoService.countByUsuario(usuario));
                    return "painel/entidade/projeto/lista";
                default:
                    logger.log(Level.WARNING, "Usuário não encontrado.");
                    return "";
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Erro listar projetos.");
            return "";
        }
    }

    /**
     * Exibe a página de cadastro do PROJETO
     *
     * @param request recebe dados da requisição
     * @param model   fornece dados para a view
     * @return view jsp
     */
    @GetMapping("/painel/projetos/cadastro")
    public String getCadastrar(HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        // Recebe o USUARIO logado na session
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        // Carrega a lista de ENTIDADES cadastradas pelo USUARIO logado
        model.addAttribute("entidades", entidadeService.findAllByUsuario(usuario));

        // Carrega todos os INCENTIVOS FISCAIS cadastrados
        model.addAttribute("incentivosFiscais", incentivoFiscalService.findAll());

        return "painel/entidade/projeto/cadastro";
    }

    /**
     * Persiste os dados do PROJETO no banco de dados
     *
     * @param projeto objeto modelo que será persistido
     * @param request recebe dados da requisição
     * @param model   fornece dados para a view
     * @return 1) Retorna página de sucesso caso o projeto for cadastrado.
     *         2) Retorna página de falha caso já exista projeto com mesmo título.
     */
    @PostMapping("/painel/projetos/cadastro")
    public String postCadastrar(Projeto projeto, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        // Recebe o USUARIO logado na session
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        try {
            // Cadastra o projeto casa não exista nenhum projeto com título igual
            if (!projetoService.existsByTitulo(projeto.getTitulo())) {
                projeto = projetoService.save(projeto, usuario, request);
                model.addAttribute("projeto", projeto);
                logger.log(Level.INFO, "Projeto cadastrado com sucesso: " + projeto.getTitulo());
                return "painel/entidade/projeto/cadastro-projeto-sucesso";

            } else {
                model.addAttribute("projeto", projeto);
                logger.log(Level.INFO, "Projeto já existente: " + projeto.getTitulo());
                return "painel/entidade/projeto/cadastro-projeto-falha-titulo-cadastrado";
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Falha cadastro de projeto.", e);
            return "painel/entidade/projeto/cadastro-projeto-falha";
        }

    }

    /**
     * Exibe os dados do projeto passado como parâmetro
     *
     * @param id      código do projeto
     * @param request recebe dados da requisição
     * @param model   fornece dados para a view
     * @return Retorna os dados do projeto buscado.
     */
    @GetMapping("/painel/projetos/{id}")
    public String getPerfil(@PathVariable Long id, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        // Recebe o USUARIO logado na session
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        try {
            // Carrega o PROJETO passando id como parâmetro
            Optional<Projeto> projeto = projetoService.findById(id);
            if (projeto.isPresent()) {
                model.addAttribute("projeto", projeto.get());
            }

            // Direciona o USUARIO para a view de acordo com seu tipo de perfil
            switch (usuario.getTipoUsuario()) {
                case ADMIN:
                    return "painel/admin/projeto/perfil";
                case ENTIDADE:
                    return "painel/entidade/projeto/perfil";
                default:
                    logger.log(Level.WARNING, "Usuário não encontrado.");
                    return "";
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Falha localizar projeto.", e);
            return "";
        }
    }

}
