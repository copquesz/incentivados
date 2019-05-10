package br.com.incentivados.controller;

import br.com.incentivados.model.Entidade;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.EntidadeService;
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
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class EntidadeController {

    @Autowired
    private EntidadeService entidadeService;

    private final Logger logger = Logger.getLogger(EntidadeController.class.getName());

    /**
     * Exibe a página de cadastro da entidade.
     *
     * @param request Recebe dados da requisição.
     * @param model   Fornece dados para a view.
     * @return Retorna o formulário de cadastro da entidade.
     */
    @GetMapping("/painel/entidades/cadastro")
    public String getCadastrar(HttpServletRequest request, Model model) {

        // Seta o path da requisição.
        model.addAttribute("path", request.getContextPath());
        return "painel/entidade/entidade/cadastro";

    }

    /**
     * Faz a persistência do objeto entidade na base de dados.
     *
     * @param entidade Objeto que será persistido.
     * @param request  recebe dados da requisição.
     * @param model    fornece dados para a view.
     * @return 1) Sucesso caso entidade for cadastrada.
     * 2) Falha caso já tenha o cnpj cadastrado.
     * 3) Erro caso ocorra algum problema na aplicação.
     */
    @PostMapping("/painel/entidades/cadastro")
    public String postCadastrar(Entidade entidade, HttpServletRequest request, Model model) {

        // Seta o path da requisição.
        model.addAttribute("path", request.getContextPath());
        // Obtém os dados do usuário logado na sessão atual.
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        try {
            // Verifica se não existe o cnpj cadastrado.
            if (!entidadeService.existsByCnpj(entidade.getCnpj())) {
                entidade = entidadeService.save(entidade, usuario, request);
                model.addAttribute("entidade", entidade);
                logger.log(Level.INFO, "Entidade cadastrada com sucesso: " + entidade.getNomeFantasia());
                return "painel/entidade/entidade/cadastro-entidade-sucesso";
            } else {
                model.addAttribute("entidade", entidade);
                logger.log(Level.INFO, "O cnpj ja possui registro na base de dados: " + entidade.getCnpj());
                return "painel/entidade/entidade/cadastro-entidade-falha-cnpj-cadastrado";
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Erro inesperado ao cadastrar a entidade.", e);
            return "painel/entidade/entidade/cadastro-entidade-falha";
        }

    }

    /**
     * Exibe a página com informações da entidade recebida como parâmetro.
     *
     * @param id      Long - código identificador da entidade.
     * @param request Recebe dados da requisição.
     * @param model   Fornece dados para a view.
     * @return Retorna a página que contém informações da entidade.
     */
    @GetMapping("/painel/entidades/{id}")
    public String getVisualizar(@PathVariable Long id, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());
        // Obtém os dados do usuário logado na sessão atual.
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        try {
            // Verifica se possui objeto com o código identificador passado como parâmetro.
            if (entidadeService.findById(id).isPresent()) {
                Entidade entidade = entidadeService.findById(id).get();
                model.addAttribute("entidade", entidade);

                // Retorna a página de acordo com o usuário logado.
                switch (usuario.getTipoUsuario()) {

                    case ADMIN:
                        return "painel/admin/entidade/perfil";

                    case ENTIDADE:
                        return "painel/entidade/entidade/perfil";

                    default:
                        return "";
                }
            } else {
                logger.log(Level.INFO, "Usuário não possui permissão para visualizar a página.");
                return "";
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Erro ao visualizar a entidade.", e);
            return "";
        }

    }

    /**
     * Exibe a lista de entidades cadastradas.
     *
     * @param request Recebe dados da requisição.
     * @param model   Fornece dados para a view.
     * @param page    int - Número da página que será buscada no banco de dados.
     * @return Retorna a página com a lista de entidades.
     */
    @GetMapping("/painel/entidades")
    public String getListar(HttpServletRequest request, Model model, @RequestParam(required = false, defaultValue = "0") int page) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());
        // Obtém os dados do usuário logado na sessão atual.
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        try {
            // Verifica o tipo de usuário logado.
            switch (usuario.getTipoUsuario()) {

                case ADMIN:
                    model.addAttribute("entidades", entidadeService.findAll(PageRequest.of(page, 5, Sort.by(Sort.Order.asc("id")))));
                    return "painel/admin/entidade/lista";

                case ENTIDADE:
                    model.addAttribute("entidades", entidadeService.findAllByUsuario(usuario, PageRequest.of(page, 5, Sort.by(Sort.Order.asc("id")))));
                    return "painel/entidade/entidade/lista";

                default:
                    return "";
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Erro ao listar as entidades.", e);
            return "";
        }
    }

}
