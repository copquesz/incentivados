package br.com.incentivados.controller;

import br.com.incentivados.enumerated.FiltroPedidos;
import br.com.incentivados.enumerated.StatusPedido;
import br.com.incentivados.enumerated.TipoPedido;
import br.com.incentivados.model.*;
import br.com.incentivados.service.EmpresaService;
import br.com.incentivados.service.EntidadeService;
import br.com.incentivados.service.PedidoService;
import br.com.incentivados.service.UsuarioService;
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
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class PedidoController {
    private EmpresaService empresaService;
    private EntidadeService entidadeService;
    private UsuarioService usuarioService;
    private PedidoService pedidoService;
    private final Logger logger = Logger.getLogger(EntidadeController.class.getName());

    @Autowired
    public PedidoController(EmpresaService empresaService, EntidadeService entidadeService, UsuarioService usuarioService, PedidoService pedidoService, HttpServletRequest request) {
        this.empresaService = empresaService;
        this.entidadeService = entidadeService;
        this.usuarioService = usuarioService;
        this.pedidoService = pedidoService;
    }

    @GetMapping({"/painel/pedidos/cadastro"})
    public String getCadastrar(@RequestParam String empresaCnpj, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Optional<Empresa> empresa = this.empresaService.findByCnpj(empresaCnpj);
        if (empresa.isPresent()) {
            model.addAttribute("empresa", empresa.get());
            Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
            model.addAttribute("usuario", usuario);
            model.addAttribute("entidades", this.entidadeService.findAllByUsuario(usuario));
            model.addAttribute("tiposPedido", TipoPedido.values());
            return "painel/entidade/pedido/cadastro";
        } else {
            this.logger.log(Level.WARNING, "Empresa não localizada.");
            return "";
        }
    }

    @PostMapping({"/painel/pedidos/cadastro"})
    public String postCadastrar(Pedido pedido, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());

        try {
            Optional<Usuario> usuario = this.usuarioService.findById(pedido.getUsuario().getId());
            Optional<Usuario> analista = this.usuarioService.findById(pedido.getAnalista().getId());
            Optional<Empresa> empresa = this.empresaService.findById(pedido.getEmpresa().getId());
            Optional<Entidade> entidade = this.entidadeService.findById(pedido.getEntidade().getId());
            pedido = this.pedidoService.save(pedido, request, (Usuario)usuario.get(), (Usuario)analista.get(), (Empresa)empresa.get(), (Entidade)entidade.get());
            model.addAttribute("pedido", pedido);
            this.logger.log(Level.INFO, "Pedido cadastrado com sucesso: #" + pedido.getId());
            return "painel/entidade/pedido/pedido-entidade-sucesso";
        } catch (Exception var8) {
            this.logger.log(Level.SEVERE, "Erro cadastrar pedido.", var8);
            return "painel/entidade/pedido/pedido-entidade-falha";
        }
    }

    @GetMapping({"/painel/pedido/{id}"})
    public String getAvaliacaoPedido(@PathVariable Long id, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);
        Optional<Pedido> pedido = this.pedidoService.findById(id);
        if (pedido.isPresent()) {
            model.addAttribute("pedido", pedido.get());
        } else {
            this.logger.log(Level.WARNING, "Pedido não localizado.");
        }

        switch(usuario.getTipoUsuario()) {
            case ADMIN:
                return "painel/admin/pedido/visualizar";
            case ANALISTA:
                return "painel/analista/pedido/visualizar";
            case EMPRESA:
                return "painel/empresa/pedido/visualizar";
            default:
                this.logger.log(Level.WARNING, "Usuário não localizado.");
                return "";
        }
    }

    @PostMapping({"/painel/pedido/{id}/avaliar"})
    public String postAvaliacaoPedido(@PathVariable Long id, @RequestParam StatusPedido status, ObservacaoPedido observacao, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);
        Optional<Pedido> pedido = this.pedidoService.findById(id);
        if (pedido.isPresent()) {
            if (((Pedido)pedido.get()).getStatus() == StatusPedido.PENDENTE) {
                this.pedidoService.update((Pedido)pedido.get(), status, observacao, usuario);
                this.logger.log(Level.INFO, "Pedido avaliado: #" + ((Pedido)pedido.get()).getId());
                return "redirect:/painel/dashboard";
            } else {
                this.logger.log(Level.WARNING, "Pedido avaliado já avaliado: #" + ((Pedido)pedido.get()).getId());
                return "painel/empresa/pedido/erro/pedido-ja-avaliado";
            }
        } else {
            this.logger.log(Level.WARNING, "Pedido não localizado: #" + id);
            return "painel/empresa/pedido/erro/pedido-nao-localizado";
        }
    }

    @PostMapping({"/painel/pedido/{id}/nota-fiscal"})
    public String postNotaFiscal(@PathVariable Long id, @RequestParam MultipartFile notaFiscal, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Optional<Pedido> pedido = this.pedidoService.findById(id);
        if (pedido.isPresent()) {
            if (!notaFiscal.isEmpty()) {
                this.pedidoService.update((Pedido)pedido.get(), request, notaFiscal);
                this.logger.log(Level.INFO, "Nota Fiscal submetidda com sucesso! - Pedido: #" + ((Pedido)pedido.get()).getId());
                return "redirect:/painel/dashboard";
            } else {
                this.logger.log(Level.WARNING, "Erro ao submeter nota fiscal: #" + ((Pedido)pedido.get()).getId());
                return "painel/empresa/pedido/erro/pedido-nao-localizado";
            }
        } else {
            this.logger.log(Level.SEVERE, "Pedido não localizado: #" + id);
            return "painel/empresa/pedido/erro/pedido-nao-localizado";
        }
    }

    @GetMapping({"/painel/pedidos"})
    public String getPedidos(@RequestParam(required = false,defaultValue = "0") int page, @RequestParam(required = false,defaultValue = "") String key, @RequestParam(required = false,defaultValue = "TODOS") FiltroPedidos filtro, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        model.addAttribute("page", page);
        model.addAttribute("key", key);
        model.addAttribute("filtro", filtro);
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);
        Empresa empresa = usuario.getEmpresa();

        try {
            FiltroPedidos[] filtroPedidos = FiltroPedidos.values();
            model.addAttribute("filtroPedidos", filtroPedidos);
            switch(usuario.getTipoUsuario()) {
                case ADMIN:
                    Pageable pageablePedidosAdmin = PageRequest.of(page, 10, Sort.by(new Sort.Order[]{Sort.Order.desc("id")}));
                    if (filtro == FiltroPedidos.LOJA) {
                        model.addAttribute("pedidos", this.pedidoService.findAllByLoja(key, pageablePedidosAdmin));
                        model.addAttribute("recusados", this.pedidoService.findAllByLojaAndStatus(key, StatusPedido.RECUSADO, pageablePedidosAdmin));
                        model.addAttribute("aprovados", this.pedidoService.findAllByLojaAndStatus(key, StatusPedido.APROVADO, pageablePedidosAdmin));
                    } else if (filtro == FiltroPedidos.CIDADE) {
                        model.addAttribute("pedidos", this.pedidoService.findAllByCidade(key, pageablePedidosAdmin));
                        model.addAttribute("recusados", this.pedidoService.findAllByCidadeAndStatus(key, StatusPedido.RECUSADO, pageablePedidosAdmin));
                        model.addAttribute("aprovados", this.pedidoService.findAllByCidadeAndStatus(key, StatusPedido.APROVADO, pageablePedidosAdmin));
                    } else if (filtro == FiltroPedidos.ESTADO) {
                        model.addAttribute("pedidos", this.pedidoService.findAllByEstado(key, pageablePedidosAdmin));
                        model.addAttribute("recusados", this.pedidoService.findAllByEstadoAndStatus(key, StatusPedido.RECUSADO, pageablePedidosAdmin));
                        model.addAttribute("aprovados", this.pedidoService.findAllByEstadoAndStatus(key, StatusPedido.APROVADO, pageablePedidosAdmin));
                    } else if (filtro == FiltroPedidos.ENTIDADE) {
                        model.addAttribute("pedidos", this.pedidoService.findAllByEntidade(key, pageablePedidosAdmin));
                        model.addAttribute("recusados", this.pedidoService.findAllByEntidadeAndStatus(key, StatusPedido.RECUSADO, pageablePedidosAdmin));
                        model.addAttribute("aprovados", this.pedidoService.findAllByEntidadeAndStatus(key, StatusPedido.APROVADO, pageablePedidosAdmin));
                    } else {
                        model.addAttribute("pedidos", this.pedidoService.findAll(pageablePedidosAdmin));
                        model.addAttribute("recusados", this.pedidoService.findAllByStatus(StatusPedido.RECUSADO, pageablePedidosAdmin));
                        model.addAttribute("aprovados", this.pedidoService.findAllByStatus(StatusPedido.APROVADO, pageablePedidosAdmin));
                    }

                    return "painel/admin/pedido/lista";
                case ANALISTA:
                    Pageable pageablePedidosAnalista = PageRequest.of(page, 5, Sort.by(new Sort.Order[]{Sort.Order.desc("id")}));
                    model.addAttribute("pedidos", this.pedidoService.findAllByUsuario(usuario, pageablePedidosAnalista));
                    model.addAttribute("qtdPedidos", this.pedidoService.countByEmpresa(empresa));
                    return "painel/analista/pedido/lista";
                case EMPRESA:
                    Pageable pageablePedidosEmpresa = PageRequest.of(page, 10, Sort.by(new Sort.Order[]{Sort.Order.desc("id")}));
                    if (filtro == FiltroPedidos.LOJA) {
                        model.addAttribute("pedidos", this.pedidoService.findAllByEmpresaAndLoja(empresa, key, pageablePedidosEmpresa));
                        model.addAttribute("recusados", this.pedidoService.findAllByEmpresaAndLojaAndStatus(empresa, key, StatusPedido.RECUSADO, pageablePedidosEmpresa));
                        model.addAttribute("aprovados", this.pedidoService.findAllByEmpresaAndLojaAndStatus(empresa, key, StatusPedido.APROVADO, pageablePedidosEmpresa));
                        model.addAttribute("preAprovados", this.pedidoService.findAllByEmpresaAndLojaAndStatus(empresa, key, StatusPedido.PRE_APROVADO, pageablePedidosEmpresa));
                    } else if (filtro == FiltroPedidos.CIDADE) {
                        model.addAttribute("pedidos", this.pedidoService.findAllByEmpresaAndCidade(empresa, key, pageablePedidosEmpresa));
                        model.addAttribute("recusados", this.pedidoService.findAllByEmpresaAndCidadeAndStatus(empresa, key, StatusPedido.RECUSADO, pageablePedidosEmpresa));
                        model.addAttribute("aprovados", this.pedidoService.findAllByEmpresaAndCidadeAndStatus(empresa, key, StatusPedido.APROVADO, pageablePedidosEmpresa));
                        model.addAttribute("preAprovados", this.pedidoService.findAllByEmpresaAndCidadeAndStatus(empresa, key, StatusPedido.PRE_APROVADO, pageablePedidosEmpresa));
                    } else if (filtro == FiltroPedidos.ESTADO) {
                        model.addAttribute("pedidos", this.pedidoService.findAllByEmpresaAndEstado(empresa, key, pageablePedidosEmpresa));
                        model.addAttribute("recusados", this.pedidoService.findAllByEmpresaAndEstadoAndStatus(empresa, key, StatusPedido.RECUSADO, pageablePedidosEmpresa));
                        model.addAttribute("aprovados", this.pedidoService.findAllByEmpresaAndEstadoAndStatus(empresa, key, StatusPedido.APROVADO, pageablePedidosEmpresa));
                        model.addAttribute("preAprovados", this.pedidoService.findAllByEmpresaAndEstadoAndStatus(empresa, key, StatusPedido.PRE_APROVADO, pageablePedidosEmpresa));
                    } else if (filtro == FiltroPedidos.ENTIDADE) {
                        model.addAttribute("pedidos", this.pedidoService.findAllByEmpresaAndEstado(empresa, key, pageablePedidosEmpresa));
                        model.addAttribute("recusados", this.pedidoService.findAllByEmpresaAndEstadoAndStatus(empresa, key, StatusPedido.RECUSADO, pageablePedidosEmpresa));
                        model.addAttribute("aprovados", this.pedidoService.findAllByEmpresaAndEstadoAndStatus(empresa, key, StatusPedido.APROVADO, pageablePedidosEmpresa));
                        model.addAttribute("preAprovados", this.pedidoService.findAllByEmpresaAndEstadoAndStatus(empresa, key, StatusPedido.PRE_APROVADO, pageablePedidosEmpresa));
                    } else {
                        model.addAttribute("pedidos", this.pedidoService.findAllByEmpresa(empresa, pageablePedidosEmpresa));
                        model.addAttribute("recusados", this.pedidoService.findAllByEmpresaAndStatus(empresa, StatusPedido.RECUSADO, pageablePedidosEmpresa));
                        model.addAttribute("aprovados", this.pedidoService.findAllByEmpresaAndStatus(empresa, StatusPedido.APROVADO, pageablePedidosEmpresa));
                        model.addAttribute("preAprovados", this.pedidoService.findAllByEmpresaAndStatus(empresa, StatusPedido.PRE_APROVADO, pageablePedidosEmpresa));
                    }

                    return "painel/empresa/pedido/lista";
                default:
                    this.logger.log(Level.WARNING, "Usuário não localizado.");
                    return "";
            }
        } catch (Exception var12) {
            this.logger.log(Level.SEVERE, "Erro listas pedidos.", var12);
            return "";
        }
    }
}
