package br.com.incentivados.controller;

import java.util.ArrayList;
import java.util.Date;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.incentivados.enumerated.StatusPedido;
import br.com.incentivados.enumerated.TipoUsuario;
import br.com.incentivados.model.Entidade;
import br.com.incentivados.model.IncentivoFiscal;
import br.com.incentivados.model.Pedido;
import br.com.incentivados.model.Projeto;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.EntidadeService;
import br.com.incentivados.service.IncentivoFiscalService;
import br.com.incentivados.service.PedidoService;
import br.com.incentivados.service.ProjetoService;
import br.com.incentivados.service.UsuarioService;

@Controller
public class DashboardController {

	@Autowired
	private UsuarioService usuarioService;

	@Autowired
	private EntidadeService entidadeService;

	@Autowired
	private ProjetoService projetoService;

	@Autowired
	private PedidoService pedidoService;

	@Autowired
	private IncentivoFiscalService incentivoFiscalService;

	@GetMapping("/login")
	public String getLogin(@ModelAttribute("redirectAttributesAcesso") String redirectAttributesAcesso,
			@ModelAttribute("redirectAttributesRedirect") String redirectAttributesRedirect,
			@RequestParam(required = false, defaultValue = "") String redirect, HttpServletRequest request,
			Model model) {

		// paths da requisição e de redirecionamento
		model.addAttribute("path", request.getContextPath());
		model.addAttribute("cor", "#ffa");

		// Seta a url de redirect
		if (redirectAttributesRedirect.equals("")) {
			model.addAttribute("redirect", redirect);
		} else {
			model.addAttribute("redirect", redirectAttributesRedirect);
		}

		if (redirectAttributesAcesso.equals("negado")) {
			model.addAttribute("acessoNegado", true);
		}

		return "main/usuario/login";

	}

	@PostMapping("/login")
	public String postLogin(@RequestParam(required = false, defaultValue = "") String redirect, String email,
			String senha, HttpServletRequest request, Model model, HttpSession session,
			RedirectAttributes redirectAttributes) {

		// Atribui para a view o path da requisição
		model.addAttribute("path", request.getContextPath());

		Usuario usuario = new Usuario();
		try {
			// Verifica a existencia do usuário no banco de dados e carrega os dados caso
			// exista. Senão exibe uma mensagem de erro
			if (usuarioService.existsByEmailAndSenha(email, senha)) {

				usuario = usuarioService.login(email);
				model.addAttribute("usuario", usuario);
				session.setAttribute("usuario", usuario);

				if (redirect.equals("")) {
					return "redirect:painel/dashboard";
				} else {
					return "redirect:" + redirect;
				}

			} else {
				redirectAttributes.addFlashAttribute("redirectAttributesRedirect", redirect);
				redirectAttributes.addFlashAttribute("redirectAttributesAcesso", "negado");
				return "redirect:login";

			}

		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("e", e);
			model.addAttribute("dataAtual", new Date());

			return "";
		}

	}

	@GetMapping("/painel/dashboard")
	public String getDashboard(HttpServletRequest request, Model model) {

		// Atribui para a view o path da requisição
		model.addAttribute("path", request.getContextPath());
		model.addAttribute("breadcrumb", "Dashboard");

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
		model.addAttribute("usuario", usuario);

		// Lista todas as entidades pertencentes ao usuário.
		List<Entidade> entidades = new ArrayList<Entidade>();
		List<Projeto> projetos = new ArrayList<Projeto>();
		List<Pedido> pedidos = new ArrayList<Pedido>();

		// Verifica qual tipo de usuário está logado e redireciona para sua respectiva
		// view
		switch (usuario.getTipoUsuario()) {

		case EMPRESA:
			// Exibe total de pedidos por analista.
			model.addAttribute("qtdPedidos", pedidoService.countByEmpresa(usuario.getEmpresa()));

			// Exibe os pedidos pendentes e a quantidade por analista.
			model.addAttribute("pendentes", pedidoService.findAllByEmpresaAndStatus(usuario.getEmpresa(), StatusPedido.PENDENTE,
					PageRequest.of(0, 5, Sort.by(Order.desc("id")))));
			model.addAttribute("qtdPendente", pedidoService.countByEmpresaAndStatus(usuario.getEmpresa(), StatusPedido.PENDENTE));

			// Exibe os pedidos aprovados e a quantidade por analista.
			model.addAttribute("aprovados", pedidoService.findAllByEmpresaAndStatus(usuario.getEmpresa(), StatusPedido.APROVADO,
					PageRequest.of(0, 5, Sort.by(Order.desc("id")))));
			model.addAttribute("qtdAprovado", pedidoService.countByEmpresaAndStatus(usuario.getEmpresa(), StatusPedido.APROVADO));

			// Exibe os pedidos reprovados e a quantidade por analista.
			model.addAttribute("recusados", pedidoService.findAllByEmpresaAndStatus(usuario.getEmpresa(), StatusPedido.RECUSADO,
					PageRequest.of(0, 5, Sort.by(Order.desc("id")))));
			model.addAttribute("qtdRecusado", pedidoService.countByEmpresaAndStatus(usuario.getEmpresa(), StatusPedido.RECUSADO));

			return "painel/empresa/dashboard-empresa";

		case ENTIDADE:

			// Condicional que verifica se o usuário pode cadastrar um projeto
			model.addAttribute("cadastroProjeto", entidadeService.existsByUsuario(usuario));

			// Lista as infos e estatísticas de entidades por usuário
			entidades = entidadeService.findByUsuario(usuario);
			model.addAttribute("entidades", entidades);
			model.addAttribute("qtdEntidades", entidadeService.countByUsuario(usuario));

			// Lista as infos e estatísticas de projetos por usuário
			projetos = projetoService.findByUsuario(usuario);
			model.addAttribute("projetos", projetos);
			model.addAttribute("qtdProjetos", projetoService.countByUsuario(usuario));

			// Lista as infos e estatística de pedidos por usuário
			pedidos = pedidoService.findAllByUsuario(usuario, PageRequest.of(0, 5, Sort.by(Order.desc("id"))));
			model.addAttribute("pedidos", pedidos);
			model.addAttribute("recusados", pedidoService.findAllByUsuarioAndStatus(usuario, StatusPedido.RECUSADO, PageRequest.of(0, 5, Sort.by(Order.desc("id")))));
			model.addAttribute("qtdPedidos", pedidoService.countByUsuario(usuario));

			return "painel/entidade/dashboard-entidade";

		case ANALISTA:

			// Exibe total de pedidos por analista.
			model.addAttribute("qtdPedidos", pedidoService.countByAnalista(usuario));

			// Exibe os pedidos pendentes e a quantidade por analista.
			model.addAttribute("pendentes", pedidoService.findAllByAnalistaAndStatus(usuario, StatusPedido.PENDENTE,
					PageRequest.of(0, 5, Sort.by(Order.desc("id")))));
			model.addAttribute("qtdPendente", pedidoService.countByAnalistaAndStatus(usuario, StatusPedido.PENDENTE));

			// Exibe os pedidos aprovados e a quantidade por analista.
			model.addAttribute("aprovados", pedidoService.findAllByAnalistaAndStatus(usuario, StatusPedido.APROVADO,
					PageRequest.of(0, 5, Sort.by(Order.desc("id")))));
			model.addAttribute("qtdAprovado", pedidoService.countByAnalistaAndStatus(usuario, StatusPedido.APROVADO));

			// Exibe os pedidos reprovados e a quantidade por analista.
			model.addAttribute("recusados", pedidoService.findAllByAnalistaAndStatus(usuario, StatusPedido.RECUSADO,
					PageRequest.of(0, 5, Sort.by(Order.desc("id")))));
			model.addAttribute("qtdRecusado", pedidoService.countByAnalistaAndStatus(usuario, StatusPedido.RECUSADO));

			return "painel/analista/dashboard-analista";

		case ADMIN:			
			// Lista as infos e estatísticas das entidades cadastradas
			model.addAttribute("entidades", entidadeService.findTop3ByOrderByIdDesc());
			model.addAttribute("qtdEntidades", entidadeService.count());
			model.addAttribute("datasChartEntidade", entidadeService.buildChart());

			// Lista as infos e estatísticas dos projetos cadastrados
			model.addAttribute("projetos", projetoService.findTop3ByOrderByIdDesc());
			model.addAttribute("qtdProjetos", projetoService.count());
			
			// Lista todos os incentivos fiscais cadastrados na base de dados
			List<IncentivoFiscal> incentivosFiscais = incentivoFiscalService.findAll();
			model.addAttribute("incentivosFiscais", incentivosFiscais);
			
			// Lista o número de projetos cadastrados por incentivo fiscal
			List<Long> datasCharProjeto = new ArrayList<Long>();
			for (int i = 0; i < incentivosFiscais.size(); i++) {
				datasCharProjeto.add(projetoService.countByIncentivosFiscais(incentivosFiscais.get(i)));
			}
			model.addAttribute("datasCharProjeto", datasCharProjeto);
			
			// Lista as infos e estatísticas dos pedidos cadastrados
			model.addAttribute("qtdPedidos", pedidoService.count());
			model.addAttribute("qtdPedidosPendente", pedidoService.countByStatus(StatusPedido.PENDENTE));
			model.addAttribute("qtdPedidosAprovado", pedidoService.countByStatus(StatusPedido.APROVADO));
			model.addAttribute("qtdPedidosRecusado", pedidoService.countByStatus(StatusPedido.RECUSADO));
			return "painel/admin/dashboard-admin";

		default:
			return "";
		}

	}

	@GetMapping("/painel/perfil")
	public String getPerfil(HttpServletRequest request, Model model) {

		// Seta o path da requisição
		model.addAttribute("path", request.getContextPath());
		model.addAttribute("breadcrumb", "Perfil");

		Usuario usuario = new Usuario();
		usuario = (Usuario) request.getSession().getAttribute("usuario");
		model.addAttribute("usuario", usuario);

		switch (usuario.getTipoUsuario()) {

		case ADMIN:
			return "painel/admin/usuario/perfil";

		case EMPRESA:
			return "painel/empresa/usuario/perfil";

		case ANALISTA:
			return "painel/analista/usuario/perfil";

		case ENTIDADE:
			return "painel/entidade/usuario/perfil";

		default:
			return "";

		}
	}

	@GetMapping("/sair")
	public String getDashboard(HttpServletRequest request, Model model, HttpSession session) {

		// Seta o path da requisição
		model.addAttribute("path", request.getContextPath());
		session.invalidate();

		return "redirect:login";
	}

}
