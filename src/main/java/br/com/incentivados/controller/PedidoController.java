package br.com.incentivados.controller;

import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import br.com.incentivados.enumerated.FiltroPedidos;
import br.com.incentivados.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import br.com.incentivados.enumerated.StatusPedido;
import br.com.incentivados.service.EmpresaService;
import br.com.incentivados.service.EntidadeService;
import br.com.incentivados.service.PedidoService;
import br.com.incentivados.service.UsuarioService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PedidoController {

    // Instancias de Serviços
    private EmpresaService empresaService;
    private EntidadeService entidadeService;
    private UsuarioService usuarioService;
    private PedidoService pedidoService;
    private final Logger logger = Logger.getLogger(EntidadeController.class.getName());

    // Construtor
    @Autowired
    public PedidoController(EmpresaService empresaService, EntidadeService entidadeService,
                            UsuarioService usuarioService, PedidoService pedidoService, HttpServletRequest request) {
        super();
        this.empresaService = empresaService;
        this.entidadeService = entidadeService;
        this.usuarioService = usuarioService;
        this.pedidoService = pedidoService;
    }

    /**
     * Exibe a página de cadastro de pedido para a empresa passada como parâmetro
     *
     * @param nomeFantasia nome da empresa que irá receber o pedido
     * @param request      recebe dados da requisição
     * @param model        fornece dados para a view
     * @return view jsp
     */
    @GetMapping("/painel/pedidos/{nomeFantasia}/cadastro")
    public String getCadastrar(@PathVariable String nomeFantasia, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        try {

            // Carrega a empresa que foi passada como parâmetro
            Optional<Empresa> empresa = empresaService.findByNomeFantasia(nomeFantasia);
            if (empresa.isPresent()) {
                model.addAttribute("empresa", empresa.get());
            } else {
                logger.log(Level.WARNING, "Empresa não localizada.");
            }

            // Recebe o usuário logado na sessão
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            model.addAttribute("usuario", usuario);

            // Lista das entidades cadastradas pelo usuário logado
            model.addAttribute("entidades", entidadeService.findAllByUsuario(usuario));

            return "painel/entidade/pedido/cadastro";

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Erro exibir formulário de pedidos.", e);
            return "";
        }

    }

    /**
     * Faz a persistência de dados do pedido
     *
     * @param pedido  modelo do objeto que será persistido
     * @param request recebe dados da requisição
     * @param model   fornece dados para a view
     * @return view jsp
     */
    @PostMapping("/painel/pedidos/{nomeFantasia}/cadastro")
    public String postCadastrar(Pedido pedido, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        try {

            // Carrega os objetos que serão setados no pedido
            Optional<Usuario> usuario = usuarioService.findById(pedido.getUsuario().getId());
            Optional<Usuario> analista = usuarioService.findById(pedido.getAnalista().getId());
            Optional<Empresa> empresa = empresaService.findById(pedido.getEmpresa().getId());
            Optional<Entidade> entidade = entidadeService.findById(pedido.getEntidade().getId());

            // Persiste o pedido na base de dados
            pedido = pedidoService.save(pedido, request, usuario.get(), analista.get(), empresa.get(), entidade.get());
            model.addAttribute("pedido", pedido);

            logger.log(Level.INFO, "Pedido cadastrado com sucesso: #" + pedido.getId());
            return "painel/entidade/pedido/pedido-entidade-sucesso";

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Erro cadastrar pedido.", e);
            return "painel/entidade/pedido/pedido-entidade-falha";
        }
    }

    @GetMapping("/painel/pedido/{id}")
    public String getAvaliacaoPedido(@PathVariable Long id, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        // Recebe o usuário logado na sessão
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);

        Optional<Pedido> pedido = pedidoService.findById(id);
        if (pedido.isPresent()) {
            model.addAttribute("pedido", pedido.get());
        } else {
            logger.log(Level.WARNING, "Pedido não localizado.");
        }

        switch (usuario.getTipoUsuario()) {
            case ANALISTA:
                return "painel/analista/pedido/visualizar";
            case EMPRESA:
                return "painel/empresa/pedido/visualizar";
            default:
                logger.log(Level.WARNING, "Usuário não localizado.");
                return "";
        }
    }

    @PostMapping("/painel/pedido/{id}/avaliar")
    public String postAvaliacaoPedido(@PathVariable Long id, @RequestParam StatusPedido status, ObservacaoPedido observacao, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        // Recebe o usuário logado na sessão
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);

        Optional<Pedido> pedido = pedidoService.findById(id);

        // Verifica se o pedido existe
        if (pedido.isPresent()) {
            // Verifica se o pedido ainda está pendente de avaliação
            if (pedido.get().getStatus() == StatusPedido.PENDENTE) {
                pedidoService.update(pedido.get(), status, observacao, usuario);
                logger.log(Level.INFO, "Pedido avaliado: #" + pedido.get().getId());
                return "redirect:/painel/dashboard";
            } else {
                logger.log(Level.WARNING, "Pedido avaliado já avaliado: #" + pedido.get().getId());
                return "painel/empresa/pedido/erro/pedido-ja-avaliado";
            }
        } else {
            logger.log(Level.WARNING, "Pedido não localizado: #" + id);
            return "painel/empresa/pedido/erro/pedido-nao-localizado";
        }

    }

    @GetMapping("/painel/pedidos")
    public String getPedidos(@RequestParam(required = false, defaultValue = "0") int page, @RequestParam(required = false, defaultValue = "") String key, @RequestParam(required = false, defaultValue = "TODOS") FiltroPedidos filtro, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());

        model.addAttribute("page", page);
        model.addAttribute("key", key);
        model.addAttribute("filtro", filtro);

        // Recebe o usuário logado na sessão
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);

        Empresa empresa = usuario.getEmpresa();

        try {

            switch (usuario.getTipoUsuario()) {
                case ADMIN:
                    Pageable pageablePedidos = PageRequest.of(page, 10000, Sort.by(Sort.Order.desc("id")));
                    model.addAttribute("pedidos", pedidoService.findAll());
                    model.addAttribute("recusados", pedidoService.findAllByStatus(StatusPedido.RECUSADO, pageablePedidos));
                    model.addAttribute("qtdPedidos", pedidoService.count());
                    return "painel/admin/pedido/lista";


                case EMPRESA:
                    FiltroPedidos[] filtroPedidos = FiltroPedidos.values();
                    model.addAttribute("filtroPedidos", filtroPedidos);

                    Pageable pageablePedidosEmpresa = PageRequest.of(page, 10, Sort.by(Sort.Order.asc("id")));

                    if(filtro == FiltroPedidos.LOJA){
                        model.addAttribute("pedidos", pedidoService.findAllByEmpresaAndBairro(empresa, key, pageablePedidosEmpresa));
                        model.addAttribute("qtdPedidos", pedidoService.countByEmpresaAndBairro(empresa, key));
                        model.addAttribute("recusados", pedidoService.findAllByEmpresaAndStatusAndBairro(empresa, StatusPedido.RECUSADO, key,
                                pageablePedidosEmpresa));
                    }
                    else if (filtro == FiltroPedidos.CIDADE){
                        model.addAttribute("pedidos", pedidoService.findAllByEmpresaAndCidade(empresa, key, pageablePedidosEmpresa));
                        model.addAttribute("qtdPedidos", pedidoService.countByEmpresaAndCidade(empresa, key));
                        model.addAttribute("recusados", pedidoService.findAllByEmpresaAndStatusAndCidade(empresa, StatusPedido.RECUSADO, key,
                                pageablePedidosEmpresa));
                    }
                    else if (filtro == FiltroPedidos.ENTIDADE){
                        model.addAttribute("pedidos", pedidoService.findAllByEmpresaAndEntidade(empresa, key, pageablePedidosEmpresa));
                        model.addAttribute("qtdPedidos", pedidoService.countByEmpresaAndEntidade(empresa, key));
                        model.addAttribute("recusados", pedidoService.findAllByEmpresaAndStatusAndEntidade(empresa, StatusPedido.RECUSADO, key,
                                pageablePedidosEmpresa));
                    }
                    else{
                        model.addAttribute("pedidos", pedidoService.findAllByEmpresa(empresa, pageablePedidosEmpresa));
                        model.addAttribute("qtdPedidos", pedidoService.countByEmpresa(empresa));
                        model.addAttribute("recusados", pedidoService.findAllByEmpresaAndStatus(empresa, StatusPedido.RECUSADO, pageablePedidosEmpresa));
                    }

                    return "painel/empresa/pedido/lista";

                case ANALISTA:
                    Pageable pageablePedidosAnalista = PageRequest.of(page, 5, Sort.by(Sort.Order.desc("id")));
                    model.addAttribute("pedidos", pedidoService.findAllByUsuario(usuario, pageablePedidosAnalista));
                    model.addAttribute("qtdPedidos", pedidoService.countByEmpresa(empresa));
                    return "painel/analista/pedido/lista";

                default:
                    logger.log(Level.WARNING, "Usuário não localizado.");
                    return "";
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Erro listas pedidos.", e);
            return "";
        }
    }

}
