package br.com.incentivados.controller;

import br.com.incentivados.enumerated.StatusArquivo;
import br.com.incentivados.enumerated.StatusPedido;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class DashboardController {
    private final Logger logger = Logger.getLogger(EntidadeController.class.getName());
    private UsuarioService usuarioService;
    private EntidadeService entidadeService;
    private ProjetoService projetoService;
    private PedidoService pedidoService;
    private IncentivoFiscalService incentivoFiscalService;

    @Autowired
    public DashboardController(UsuarioService usuarioService, EntidadeService entidadeService, ProjetoService projetoService, PedidoService pedidoService, IncentivoFiscalService incentivoFiscalService) {
        this.usuarioService = usuarioService;
        this.entidadeService = entidadeService;
        this.projetoService = projetoService;
        this.pedidoService = pedidoService;
        this.incentivoFiscalService = incentivoFiscalService;
    }

    @GetMapping({"/login"})
    public String getLogin(@ModelAttribute("redirectAttributesAcesso") String redirectAttributesAcesso, @ModelAttribute("recuperarSenha") String redirectAttributesRecuperarSenha, @ModelAttribute("senhaAlterada") String redirectAttributesSenhaAlterada, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());

        //Atributo que contém a mensagem que verifica se o usuário foi validade para acesar o painel
        if (redirectAttributesAcesso.equals("negado")) {
            model.addAttribute("acessoNegado", true);
        }
        if (redirectAttributesAcesso.equals("expirado")) {
            model.addAttribute("sessaoExpirada", true);
        }

        //Atributo que contém a mensagem que verifica se o usuário foi localizado no banco de dados para recuperar a senha
        if (redirectAttributesRecuperarSenha.equals("emailNotFound")) {
            model.addAttribute("emailNotFound", true);
        }
        if (redirectAttributesRecuperarSenha.equals("emailSended")) {
            model.addAttribute("emailSended", true);
        }

        //Atributo que contém a mensagem que verifica se o usuário alterou a senha de acesso
        if (redirectAttributesSenhaAlterada.equals("senhaAlterada")) {
            model.addAttribute("senhaAlterada", true);
        }

        return "main/usuario/login";
    }

    @PostMapping({"/login"})
    public String postLogin(@RequestParam(required = false, defaultValue = "") String redirect, String email, String senha, HttpServletRequest request, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        model.addAttribute("path", request.getContextPath());

        try {
            if (this.usuarioService.existsByEmailAndSenha(email, senha)) {
                Usuario usuario = this.usuarioService.login(email);
                model.addAttribute("usuario", usuario);
                session.setAttribute("usuario", usuario);
                this.logger.log(Level.INFO, "Acesso liberado: " + email);
                return redirect.equals("") ? "redirect:painel/dashboard" : "redirect:" + redirect;
            } else {
                this.logger.log(Level.INFO, "Tentativa de acesso incorreta: " + email);
                redirectAttributes.addFlashAttribute("redirectAttributesRedirect", redirect);
                redirectAttributes.addFlashAttribute("redirectAttributesAcesso", "negado");
                return "redirect:login";
            }
        } catch (Exception var9) {
            this.logger.log(Level.SEVERE, "Erro login: " + email, var9);
            model.addAttribute("e", var9);
            model.addAttribute("dataAtual", new Date());
            return "";
        }
    }

    @GetMapping({"/painel/dashboard"})
    public String getDashboard(HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        model.addAttribute("breadcrumb", "Dashboard");
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);
        Pageable pageableProjetos = PageRequest.of(0, 4, Sort.by(new Order[]{Order.desc("id")}));
        Pageable pageableEntidades = PageRequest.of(0, 3, Sort.by(new Order[]{Order.desc("id")}));
        Pageable pageablePedidos = PageRequest.of(0, 5, Sort.by(new Order[]{Order.desc("id")}));

        switch (usuario.getTipoUsuario()) {
            case EMPRESA:
                model.addAttribute("qtdProjetos", this.projetoService.count());
                model.addAttribute("qtdPedidos", this.pedidoService.countByEmpresa(usuario.getEmpresa()));
                model.addAttribute("pendentes", this.pedidoService.findAllByEmpresaAndStatus(usuario.getEmpresa(), StatusPedido.PENDENTE, pageablePedidos));
                model.addAttribute("aprovados", this.pedidoService.findAllByEmpresaAndStatus(usuario.getEmpresa(), StatusPedido.APROVADO, pageablePedidos));
                model.addAttribute("recusados", this.pedidoService.findAllByEmpresaAndStatus(usuario.getEmpresa(), StatusPedido.RECUSADO, pageablePedidos));
                model.addAttribute("preAprovados", this.pedidoService.findAllByEmpresaAndStatus(usuario.getEmpresa(), StatusPedido.PRE_APROVADO, pageablePedidos));
                return "painel/empresa/dashboard-empresa";
            case ENTIDADE:
                model.addAttribute("cadastroProjeto", this.entidadeService.existsByUsuario(usuario));
                model.addAttribute("entidades", this.entidadeService.findAllByUsuario(usuario, pageableEntidades));
                model.addAttribute("qtdEntidades", this.entidadeService.countByUsuario(usuario));
                model.addAttribute("projetos", this.projetoService.findAllByUsuario(usuario, pageableProjetos));
                model.addAttribute("qtdProjetos", this.projetoService.countByUsuario(usuario));
                model.addAttribute("pedidos", this.pedidoService.findAllByUsuario(usuario, pageablePedidos));
                model.addAttribute("qtdPedidos", this.pedidoService.countByUsuario(usuario));
                model.addAttribute("entidadesNegadoAnalise", this.entidadeService.findAllByUsuarioAndAndDocumentosEntidadeStatusDocumentacao(PageRequest.of(0, 2, Sort.by(new Order[]{Order.desc("id")})), usuario, StatusArquivo.NEGADO));
                model.addAttribute("projetosNegadoAnalise", this.projetoService.findAllByUsuarioAndAndDocumentosProjetoStatusDocumentacao(PageRequest.of(0, 2, Sort.by(new Order[]{Order.desc("id")})), usuario, StatusArquivo.NEGADO));
                return "painel/entidade/dashboard-entidade";
            case ANALISTA:
                model.addAttribute("qtdPedidos", this.pedidoService.countByAnalista(usuario));
                model.addAttribute("pendentes", this.pedidoService.findAllByAnalistaAndStatus(usuario, StatusPedido.PENDENTE, pageablePedidos));
                model.addAttribute("aprovados", this.pedidoService.findAllByAnalistaAndStatus(usuario, StatusPedido.APROVADO, pageablePedidos));
                model.addAttribute("recusados", this.pedidoService.findAllByAnalistaAndStatus(usuario, StatusPedido.RECUSADO, pageablePedidos));
                model.addAttribute("preAprovados", this.pedidoService.findAllByAnalistaAndStatus(usuario, StatusPedido.PRE_APROVADO, pageablePedidos));
                return "painel/analista/dashboard-analista";
            case ADMIN:
                model.addAttribute("entidades", this.entidadeService.findAll(pageableEntidades));
                model.addAttribute("qtdEntidades", this.entidadeService.count());
                model.addAttribute("projetos", this.projetoService.findAll(pageableProjetos));
                model.addAttribute("qtdProjetos", this.projetoService.count());
                model.addAttribute("entidadesPendenteAnalise", this.entidadeService.findAllByDocumentosEntidadeStatusDocumentacao(PageRequest.of(0, 2, Sort.by(new Order[]{Order.desc("id")})), StatusArquivo.PENDENTE));
                model.addAttribute("projetosPendenteAnalise", this.projetoService.findAllByDocumentosProjetoStatusDocumentacao(PageRequest.of(0, 2, Sort.by(new Order[]{Order.desc("id")})), StatusArquivo.PENDENTE));
                model.addAttribute("qtdPedidos", this.pedidoService.count());
                return "painel/admin/dashboard-admin";
            default:
                return "";
        }
    }

    @GetMapping({"/painel/perfil"})
    public String getPerfil(HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);
        switch (usuario.getTipoUsuario()) {
            case EMPRESA:
                return "painel/empresa/usuario/perfil";
            case ENTIDADE:
                return "painel/entidade/usuario/perfil";
            case ANALISTA:
                return "painel/analista/usuario/perfil";
            case ADMIN:
                return "painel/admin/usuario/perfil";
            default:
                return "";
        }
    }

    @GetMapping({"/sair"})
    public String getDashboard(HttpServletRequest request, Model model, HttpSession session) {
        model.addAttribute("path", request.getContextPath());
        session.invalidate();
        return "redirect:login";
    }
}
