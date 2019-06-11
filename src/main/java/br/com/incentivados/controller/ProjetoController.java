package br.com.incentivados.controller;

import br.com.incentivados.model.Empresa;
import br.com.incentivados.model.Projeto;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.EmpresaService;
import br.com.incentivados.service.EntidadeService;
import br.com.incentivados.service.IncentivoFiscalService;
import br.com.incentivados.service.ProjetoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class ProjetoController {

    private ProjetoService projetoService;
    private EntidadeService entidadeService;
    private IncentivoFiscalService incentivoFiscalService;
    private EmpresaService empresaService;
    private final Logger logger = Logger.getLogger(EntidadeController.class.getName());

    @Autowired
    public ProjetoController(ProjetoService projetoService, EntidadeService entidadeService,
                             IncentivoFiscalService incentivoFiscalService, EmpresaService empresaService) {
        super();
        this.projetoService = projetoService;
        this.entidadeService = entidadeService;
        this.incentivoFiscalService = incentivoFiscalService;
        this.empresaService = empresaService;
    }

    /**
     * Exibe a lista de projetos
     *
     * @param request Recebe dados da requisição.
     * @param model   Fornece dados para a view.
     * @return Retorna a lista de projetos solicitada.
     */
    @GetMapping("/painel/projetos")
    public String getListar(@RequestParam(required = false, defaultValue = "0") int page, @RequestParam(required = false, defaultValue = "") String key, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        // Recebe o USUARIO logado na session
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        try {
            Pageable pageable = PageRequest.of(page, 12, Sort.by(Sort.Order.asc("id")));

            // Direciona o USUARIO para sua view de acordo com perfil
            switch (usuario.getTipoUsuario()) {
                case ADMIN:
                    model.addAttribute("projetos", projetoService.findAll(pageable));
                    model.addAttribute("qtdProjetos", projetoService.count());
                    return "painel/admin/projeto/lista";
                case ENTIDADE:
                    model.addAttribute("projetos", projetoService.findAllByUsuario(usuario, pageable, key));
                    return "painel/entidade/projeto/lista";
                case EMPRESA:
                    if(usuario.getEmpresa().getProjetos().size() > 0){
                        model.addAttribute("projetos", new PageImpl<>(usuario.getEmpresa().getProjetos(), pageable, usuario.getEmpresa().getProjetos().size()));
                    }
                    return "painel/empresa/projeto/lista";
                default:
                    logger.log(Level.WARNING, "Usuário não encontrado.");
                    return "";
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Erro listar projetos.", e);
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
    public String postCadastrar(@RequestParam(required = false, defaultValue = "18.520.427/0001-86") String cnpj, Projeto projeto, HttpServletRequest request, Model model) {

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

                if(!cnpj.equals("18.520.427/0001-86")){
                    Optional<Empresa> empresa = empresaService.findByCnpj(cnpj);
                    if(empresa.isPresent()){
                        empresaService.adicionaProjeto(empresa.get(), projeto);
                        logger.log(Level.INFO, "Projeto " + projeto.getTitulo() + " adicionado a lista de: " + empresa.get().getNomeFantasia());
                    }
                }
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
                    List<Empresa> empresas = empresaService.findAll();
                    for (Empresa empresa : empresas){
                        empresa.setIndicacao(empresaService.isIndicacao(empresa, projeto.get()));
                    }
                    model.addAttribute("empresas", empresas);
                    return "painel/admin/projeto/perfil";
                case ENTIDADE:
                    return "painel/entidade/projeto/perfil";
                case EMPRESA:
                    return "painel/empresa/projeto/perfil";
                default:
                    logger.log(Level.WARNING, "Usuário não encontrado.");
                    return "";
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Falha localizar projeto.", e);
            return "";
        }
    }

    @PostMapping("/painel/projetos/indicar")
    public String postIndicarProjeto(@RequestParam(required = true) Long empresaId, @RequestParam(required = true) Long projetoId, HttpServletRequest request, Model model){

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        Optional<Projeto> projeto = projetoService.findById(projetoId);
        Optional<Empresa> empresa = empresaService.findById(empresaId);

        if (projeto.isPresent() && empresa.isPresent()) {
            empresaService.adicionaProjeto(empresa.get(), projeto.get());
            logger.log(Level.INFO, "Projeto " + projeto.get().getTitulo() + " adicionado a lista de: " + empresa.get().getNomeFantasia());
        }
        else {
            logger.log(Level.WARNING, "Projeto ou Empresa não localizado.");
        }

        return "redirect:/painel/projetos/" + projeto.get().getId();
    }

}
