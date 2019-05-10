package br.com.incentivados.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import br.com.incentivados.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import br.com.incentivados.enumerated.StatusPedido;
import br.com.incentivados.enumerated.TipoUsuario;
import br.com.incentivados.service.EmpresaService;
import br.com.incentivados.service.EntidadeService;
import br.com.incentivados.service.PedidoService;
import br.com.incentivados.service.UsuarioService;
import javassist.bytecode.analysis.Analyzer;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PedidoController {

	// Instancias de Serviços
	private EmpresaService empresaService;
	private EntidadeService entidadeService;
	private UsuarioService usuarioService;
	private PedidoService pedidoService;

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
		// Seta o breadcrumb da página
		model.addAttribute("breadcrumb", "Pedido " + " <i class='fas fa-angle-double-right'></i> " + " Cadastro");

		try {

			// Carrega a empresa que foi passada como parâmetro
			Optional<Empresa> empresa = empresaService.findByNomeFantasia(nomeFantasia);
			model.addAttribute("empresa", empresa.get());

			// Recebe o usuário logado na sessão
			Usuario usuario = new Usuario();
			usuario = (Usuario) request.getSession().getAttribute("usuario");
			model.addAttribute("usuario", usuario);

			// Lista das entidades cadastradas pelo usuário logado
			List<Entidade> entidades = new ArrayList<Entidade>();
			entidades = entidadeService.findAllByUsuario(usuario);
			model.addAttribute("entidades", entidades);

			return "painel/entidade/pedido/cadastro";

		} catch (Exception e) {
			System.out.println(e);

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
		// Seta o breadcrumb da página
		model.addAttribute("breadcrumb", "Pedido " + " <i class='fas fa-angle-double-right'></i> " + " Cadastro");

		try {

			// Carrega os objetos que serão setados no pedido
			Optional<Usuario> usuario = usuarioService.findById(pedido.getUsuario().getId());
			Optional<Usuario> analista = usuarioService.findById(pedido.getAnalista().getId());
			Optional<Empresa> empresa = empresaService.findById(pedido.getEmpresa().getId());
			Optional<Entidade> entidade = entidadeService.findById(pedido.getEntidade().getId());

			// Persiste o pedido na base de dados
			pedido = pedidoService.save(pedido, request, usuario.get(), analista.get(), empresa.get(), entidade.get());
			model.addAttribute("pedido", pedido);

			return "painel/entidade/pedido/pedido-entidade-sucesso";

		} catch (Exception e) {
			System.err.println(e);
			return "painel/entidade/pedido/pedido-entidade-falha";
		}
	}

	@GetMapping("/painel/pedido/{id}")
	public String getAvaliacaoPedido(@PathVariable Long id, HttpServletRequest request, Model model) {

		// Seta o path da requisição
		model.addAttribute("path", request.getContextPath());

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

		Pedido pedido = pedidoService.findById(id).get();
		model.addAttribute("pedido", pedido);

		switch (usuario.getTipoUsuario()) {
		case ANALISTA:
			return "painel/analista/pedido/visualizar";

		case EMPRESA:
			return "painel/empresa/pedido/visualizar";

		default:
			return "";
		}
	}
	
	@PostMapping("/painel/pedido/{id}/avaliar")
	public String postAvaliacaoPedido(@PathVariable Long id, @RequestParam StatusPedido status, ObservacaoPedido observacao, HttpServletRequest request, Model model) {

		// Seta o path da requisição
		model.addAttribute("path", request.getContextPath());

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

		Optional<Pedido> pedido = pedidoService.findById(id);


		// Verifica se o pedido existe
		if (pedido.isPresent()){
			// Verifica se o pedido ainda está pendente de avaliação
			if (pedido.get().getStatus() == StatusPedido.PENDENTE){
				pedidoService.update(pedido.get(), status, observacao, usuario);
				return "redirect:/painel/dashboard";
			}
			else{
				return "painel/empresa/pedido/erro/pedido-ja-avaliado";
			}
		}
		else{
			return "painel/empresa/pedido/erro/pedido-nao-localizado";
		}

	}

	@GetMapping("/painel/pedidos")
	public String getPedidos(HttpServletRequest request, Model model) {

		// Seta o path da requisição
		model.addAttribute("path", request.getContextPath());
		// Seta o breadcrumb da página
		model.addAttribute("breadcrumb", "Pedido " + " <i class='fas fa-angle-double-right'></i> " + " Lista");

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
		Empresa empresa = usuario.getEmpresa();

		try {

			switch (usuario.getTipoUsuario()) {
			case ADMIN:
				model.addAttribute("pedidos", pedidoService.findAll());
				model.addAttribute("recusados", pedidoService.findAllByStatus(StatusPedido.RECUSADO, PageRequest.of(0, 10000, Sort.by(Sort.Order.desc("id")))));
				model.addAttribute("qtdPedidos", pedidoService.count());
				return "painel/admin/pedido/lista";

			case EMPRESA:
				model.addAttribute("pedidos", pedidoService.findAllByEmpresa(empresa, PageRequest.of(0, 5, Sort.by(Sort.Order.desc("id")))));
				model.addAttribute("qtdPedidos", pedidoService.countByEmpresa(empresa));

			case ANALISTA:
				model.addAttribute("pedidos", pedidoService.findAllByUsuario(usuario, PageRequest.of(0, 5, Sort.by(Sort.Order.desc("id")))));
				model.addAttribute("qtdPedidos", pedidoService.countByEmpresa(empresa));

			default:
				return "";
			}

		} catch (Exception e) {
			System.err.println(e);
			return "";
		}
	}

}
