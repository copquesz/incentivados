package br.com.incentivados.controller;

import br.com.incentivados.model.Empresa;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.EmpresaService;
import br.com.incentivados.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
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
public class EmpresaController {

    private EmpresaService empresaService;
    private UsuarioService usuarioService;
    private final Logger logger = Logger.getLogger(EntidadeController.class.getName());

    @Autowired
    public EmpresaController(EmpresaService empresaService, UsuarioService usuarioService) {
        this.empresaService = empresaService;
        this.usuarioService = usuarioService;

    }

    /**
     * Este método recebe uma chamada GET que exibe a lista de empresas cadastradas.
     *
     * @param chave   String - nome fantasia da empresa que deseja filtrar.
     * @param request contém informações referente a requisição feita através desta url.
     * @param model   disponibiliza dados da controller para a view.
     * @return retorna uma página com a lista de empresas pesquisada.
     */
    @GetMapping("/painel/empresas")
    public String getListar(@RequestParam(required = false, defaultValue = "") String chave,
                            @RequestParam(required = false, defaultValue = "0") int page, HttpServletRequest request,
                            Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());
        model.addAttribute("qtdEmpresas", empresaService.count());

        if (chave.equals("")) {
            model.addAttribute("empresas", empresaService.findAll(PageRequest.of(page, 5, Sort.by(Sort.Order.asc("id")))));
        } else {
            model.addAttribute("empresas", empresaService.findByNomeFantasiaContains(chave));
        }
        return "painel/admin/empresa/lista";
    }

    /**
     * Este método recebe uma chamada GET para exibir os dados da empresa passada como parâmetro.
     *
     * @param id      Long - código identificador da empresa.
     * @param request contém informações referente a requisição feita através desta url.
     * @param model   disponibiliza dados da controller para a view.
     * @return retorna a página que exibe os dados da empresa.
     */
    @GetMapping("/painel/empresas/{id}")
    public String getVisualizar(@PathVariable Long id, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        try {
            Optional<Empresa> empresa = empresaService.findById(id);
            if (empresa.isPresent()) {
                model.addAttribute("empresa", empresa.get());
            }
            return "painel/admin/empresa/perfil";
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Erro inesperado exibir os dados da empresa.", e);
            return "";
        }
    }

    /**
     * Este método recebe uma chamada GET para acessar o formulário de cadastro de empresas.
     *
     * @param request contém informações referente a requisição feita através desta url.
     * @param model   disponibiliza dados da controller para a view.
     * @return retorna o formulário de cadastro de empresas.
     */
    @GetMapping("/painel/empresas/cadastro")
    public String getCadastrar(HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        // Disponibiliza os dados do usuário logado para a view
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);
        return "painel/admin/empresa/cadastro";
    }

    /**
     * Este método recebe uma chamada POST para cadastrar uma empresa.
     *
     * @param empresa objeto que será persistido no banco de dados.
     * @param request contém informações referente a requisição feita através desta url.
     * @param model   disponibiliza dados da controller para a view.
     * @return 1- retorna página de sucesso com os dados cadastrados caso tudo ocorra normalmente.
     * 2- retorna a página de falha caso a empresa ja possua cnpj cadastrado na plataforma.
     * 3- retorna a página de falha caso algum erro inesperado seja localizado.
     */
    @PostMapping("/painel/empresas/cadastro")
    public String postCadastrar(Empresa empresa, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        try {
            // Disponibiliza os dados do usuário logado para a view
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            model.addAttribute("usuario", usuario);

            // Verifica se ja possui CNPJ cadastrado
            if (!empresaService.existsbyCnpj(empresa.getCnpj())) {
                empresa = empresaService.save(empresa, usuario, request);
                model.addAttribute("empresa", empresa);
                return "painel/admin/empresa/cadastro-empresa-sucesso";
            } else {
                model.addAttribute("empresa", empresa);
                return "painel/admin/empresa/cadastro-empresa-falha-cnpj-cadastrado";
            }

        } catch (Exception e) {
            return "painel/admin/empresa/cadastro-empresa-falha";
        }
    }


    /**
     * Este método recebe uma chamada GET que exibe o formulário de cadastro do responsável pela empresa.
     *
     * @param id      Long - código identificador da empresa.
     * @param request contém informações referente a requisição feita através desta url.
     * @param model   disponibiliza dados da controller para a view.
     * @return retorna o formulário para cadastrar o responsável pela empresa.
     */
    @GetMapping("/painel/empresas/{id}/responsavel/cadastro")
    public String getResposavelCadastrar(@PathVariable Long id, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        Optional<Empresa> empresa = empresaService.findById(id);
        model.addAttribute("empresa", empresa.get());
        return "painel/admin/empresa/responsavel/cadastro";
    }

    /**
     * Este método recebe uma chamada POST para cadastrar o responsável pela empresa.
     *
     * @param id          - Long - código identificador da empresa
     * @param responsavel objeto que será persistido no banco de dados.
     * @param request     contém informações referente a requisição feita através desta url.
     * @param model       disponibiliza dados da controller para a view.
     * @return 1- retorna a página de sucesso com os dados cadastrados caso ok.
     * 2- retorna página de erro caso já possua email cadastrado
     * 3- retorna página de erro caso já possua cpf cadastrado.
     */
    @PostMapping("/painel/empresas/{id}/responsavel/cadastro")
    public String postResponsavelCadastrar(@PathVariable Long id, Usuario responsavel, HttpServletRequest request,
                                           Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        try {
            if (usuarioService.existsByEmail(responsavel.getEmail())) {
                model.addAttribute("usuario", responsavel);
                return "painel/admin/empresa/responsavel/cadastro-responsavel-falha-email-cadastrado";
            } else if (usuarioService.existsByCpf(responsavel.getCpf())) {
                model.addAttribute("usuario", responsavel);
                return "painel/admin/empresa/responsavel/cadastro-responsavel-falha-cpf-cadastrado";
            } else {
                // Salva o analista na base de dados
                responsavel = usuarioService.save(responsavel);
                model.addAttribute("usuario", responsavel);

                // Atribui o analista para a lista da empresa
                Optional<Empresa> empresa = empresaService.findById(id);

                if (empresa.isPresent()) {
                    empresa.get().getResponsaveis().add(responsavel);
                    empresaService.update(empresa.get());
                    usuarioService.setEmpresa(responsavel, empresa.get());
                    return "painel/admin/empresa/responsavel/cadastro-responsavel-sucesso";
                } else {
                    return "painel/admin/empresa/responsavel/cadastro-responsavel-falha";
                }
            }
        } catch (Exception e) {
            System.out.println(e.toString());
            model.addAttribute("erro", e);
            return "painel/admin/empresa/responsavel/cadastro-analista-falha";
        }
    }

    /**
     * Este método recebe uma chamada GET que exibe a lista de analistas cadastrados
     *
     * @param id      Long - código identidicador da empresa.
     * @param request
     * @param model
     * @return
     */
    @GetMapping("/painel/{id}/analistas")
    public String getAnalistas(@PathVariable Long id, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        // Disponibiliza os dados do usuário logado para a view
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);

        Optional<Empresa> empresa = empresaService.findById(id);
        model.addAttribute("empresa", empresa.get());

        return "painel/empresa/analista/lista";
    }

    /**
     * Este método recebe uma chamada GET que exibe o formulário de cadastro de analista
     *
     * @param id      Long - código identidicador da empresa.
     * @param request contém informações referente a requisição feita através desta url.
     * @param model   disponibiliza dados da controller para a view.
     * @return retorna a página que contém o formulário para cadastro do analista
     */
    @GetMapping({"/painel/empresas/{id}/analistas/cadastro", "painel/analistas/cadastro"})
    public String getAnalistaCadastrar(@PathVariable(required = false) Long id, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);

        switch (usuario.getTipoUsuario()) {

            case ADMIN:
                Optional<Empresa> empresa = empresaService.findById(id);
                model.addAttribute("empresa", empresa.get());
                return "painel/admin/empresa/analista/cadastro";

            case EMPRESA:
                return "painel/empresa/analista/cadastro";

            default:
                return "";
        }


    }


    /**
     * Este método recebe uma chamada POST para cadastrar o analista no banco de dados.
     *
     * @param id       Long - código identificador da empresa.
     * @param analista - objeto que será persistido no banco de dados.
     * @param request  contém informações referente a requisição feita através desta url.
     * @param model    disponibiliza dados da controller para a view.
     * @return 1- retorna a página de sucesso com os dados cadastrados caso ok.
     * 2- retorna página de erro caso já possua email cadastrado
     * 3- retorna página de erro caso já possua cpf cadastrado.
     */
    @PostMapping({"/painel/empresas/{id}/analistas/cadastro", "/painel/analistas/cadastro"})
    public String postAnalistaCadastrar(@PathVariable(required = false) Long id, Usuario analista, HttpServletRequest request,
                                        Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());
        model.addAttribute("breadcrumb", " Empresas " + " <i class='fas fa-angle-double-right'></i> " + " Analistas" + " <i class='fas fa-angle-double-right'></i> " + " Cadastro");

        // Busca os dados do usuário logado na sessão
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        switch (usuario.getTipoUsuario()) {

            case ADMIN:
                try {
                    // Verifica se o usuário ja possui cadastro com este email
                    if (usuarioService.existsByEmail(analista.getEmail())) {
                        model.addAttribute("usuario", analista);
                        return "painel/admin/empresa/analista/cadastro-analista-falha-email-cadastrado";

                        // Verifica se o usuário ja possui cadastro com este cpf
                    } else if (usuarioService.existsByCpf(analista.getCpf())) {
                        model.addAttribute("usuario", analista);
                        return "painel/admin/empresa/analista/cadastro-analista-falha-cpf-cadastrado";

                    } else {
                        // Salva o analista na base de dados
                        analista = usuarioService.save(analista);
                        model.addAttribute("usuario", analista);

                        // Atribui o analista para a lista da empresa
                        Optional<Empresa> empresa = empresaService.findById(id);
                        empresa.get().getAnalistas().add(analista);
                        empresaService.update(empresa.get());

                        return "painel/admin/empresa/analista/cadastro-analista-sucesso";
                    }
                } catch (Exception e) {
                    System.out.println(e.toString());
                    model.addAttribute("erro", e);
                    return "painel/admin/empresa/analista/cadastro-analista-falha";
                }

            case EMPRESA:
                try {
                    // Verifica se o usuário ja possui cadastro com este email
                    if (usuarioService.existsByEmail(analista.getEmail())) {
                        model.addAttribute("usuario", analista);
                        return "painel/empresa/analista/cadastro-analista-falha-email-cadastrado";

                        // Verifica se o usuário ja possui cadastro com este cpf
                    } else if (usuarioService.existsByCpf(analista.getCpf())) {
                        model.addAttribute("usuario", analista);
                        return "painel/empresa/analista/cadastro-analista-falha-cpf-cadastrado";

                    } else {
                        // Salva o analista na base de dados
                        analista = usuarioService.save(analista);
                        model.addAttribute("usuario", analista);

                        // Atribui o analista para a lista da empresa
                        usuario.getEmpresa().getAnalistas().add(analista);
                        empresaService.update(usuario.getEmpresa());

                        return "painel/empresa/analista/cadastro-analista-sucesso";
                    }
                } catch (Exception e) {
                    System.out.println(e.toString());
                    model.addAttribute("erro", e);
                    return "painel/empresa/analista/cadastro-analista-falha";
                }

            default:
                return "";
        }
    }
}
