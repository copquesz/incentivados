package br.com.incentivados.controller;

import br.com.incentivados.enumerated.TipoUsuario;
import br.com.incentivados.model.Entidade;
import br.com.incentivados.model.IncentivoFiscal;
import br.com.incentivados.model.Projeto;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.EntidadeService;
import br.com.incentivados.service.IncentivoFiscalService;
import br.com.incentivados.service.ProjetoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class ProjetoController {

	private ProjetoService projetoService;
	private EntidadeService entidadeService;
	private IncentivoFiscalService incentivoFiscalService;

	@Autowired
	public ProjetoController(ProjetoService projetoService, EntidadeService entidadeService,
			IncentivoFiscalService incentivoFiscalService) {
		super();
		this.projetoService = projetoService;
		this.entidadeService = entidadeService;
		this.incentivoFiscalService = incentivoFiscalService;
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
		// Seta o breadcrumb da página
		model.addAttribute("breadcrumb", "Projeto " + " <i class='fas fa-angle-double-right'></i> " + " Cadastro");

		// Recebe o USUÁRIO logado na session
		Usuario usuario = new Usuario();
		usuario = (Usuario) request.getSession().getAttribute("usuario");

		// Carrega a lista de ENTIDADES cadastradas pelo USUÁRIO logado
		List<Entidade> entidades = new ArrayList<Entidade>();
		entidades = entidadeService.findByUsuario(usuario);
		model.addAttribute("entidades", entidades);

		// Carrega todos os INCENTIVOS FISCAIS cadastrados
		List<IncentivoFiscal> incentivosFiscais = new ArrayList<IncentivoFiscal>();
		incentivosFiscais = incentivoFiscalService.findAll();
		model.addAttribute("incentivosFiscais", incentivosFiscais);

		return "painel/entidade/projeto/cadastro";
	}

	/**
	 * Persiste os dados do PROJETO no banco de dados
	 * 
	 * @param projeto objeto modelo que será persistido
	 * @param request recebe dados da requisição
	 * @param model   fornece dados para a view
	 * @return view jsp
	 */
	@PostMapping("/painel/projetos/cadastro")
	public String postCadastrar(Projeto projeto, HttpServletRequest request, Model model) {

		// Seta o path da requisição
		model.addAttribute("path", request.getContextPath());
		// Seta o breadcrumb da página
		model.addAttribute("breadcrumb", "Projeto " + " <i class='fas fa-angle-double-right'></i> " + " Cadastro");

		// Recebe o USUÁRIO logado na session
		Usuario usuario = new Usuario();
		usuario = (Usuario) request.getSession().getAttribute("usuario");

		try {
			// Cadastra o projeto casa não exista nenhum projeto com título igual
			if (!projetoService.existsByTitulo(projeto.getTitulo())) {
				projeto = projetoService.save(projeto, usuario, request);
				model.addAttribute("projeto", projeto);

				return "painel/entidade/projeto/cadastro-projeto-sucesso";

			} else {
				model.addAttribute("projeto", projeto);

				return "painel/entidade/projeto/cadastro-projeto-falha-titulo-cadastrado";
			}

		} catch (Exception e) {
			System.out.println(e);
			return "painel/entidade/projeto/cadastro-projeto-falha";
		}

	}

	/**
	 * Exibe os dados do projeto passado como parâmetro
	 * 
	 * @param id      código do projeto
	 * @param request recebe dados da requisição
	 * @param model   fornece dados para a view
	 * @return view jsp
	 */
	@GetMapping("/painel/projetos/{id}")
	public String getPerfil(@PathVariable Long id, HttpServletRequest request, Model model) {

		// Seta o path da requisição
		model.addAttribute("path", request.getContextPath());
		// Seta o breadcrumb da página
		model.addAttribute("breadcrumb", "Projeto " + " <i class='fas fa-angle-double-right'></i> " + " Perfil");

		// Recebe o USUÁRIO logado na session
		Usuario usuario = new Usuario();
		usuario = (Usuario) request.getSession().getAttribute("usuario");

		try {
			// Carrega o PROJETO passando id como parâmetro
			Optional<Projeto> projeto = projetoService.findById(id);
			model.addAttribute("projeto", projeto.get());

			// Direciona o USUÁRIO para a view de acordo com seu tipo de perfil
			switch (usuario.getTipoUsuario()) {
			case ADMIN:
				return "painel/admin/projeto/perfil";

			case ENTIDADE:
				return "painel/entidade/projeto/perfil";

			default:
				return "";
			}

		} catch (Exception e) {
			return "";
		}
	}

	/**
	 * Exibe a lista de PROJETOS do usuário logado
	 * 
	 * @param request recebe dados da requisição
	 * @param model   fornece dados para a view
	 * @return view jsp
	 */
	@GetMapping("/painel/projetos")
	public String getListar(HttpServletRequest request, Model model) {

		// Seta o path da requisição
		model.addAttribute("path", request.getContextPath());
		// Seta o breadcrumb da página
		model.addAttribute("breadcrumb", "Projeto " + " <i class='fas fa-angle-double-right'></i> " + " Lista");

		// Recebe o USUÁRIO logado na session
		Usuario usuario = new Usuario();
		usuario = (Usuario) request.getSession().getAttribute("usuario");

		try {

			// Direciona o USUÁRIO para sua view de acordo com perfil
			if (usuario.getTipoUsuario() == TipoUsuario.ADMIN) {
				List<Projeto> projetos = new ArrayList<Projeto>();
				projetos = projetoService.findAll();
				model.addAttribute("projetos", projetos);
				model.addAttribute("qtdProjetos", projetoService.count());
				return "painel/admin/projeto/lista";

			} else {
				List<Projeto> projetos = new ArrayList<Projeto>();
				projetos = projetoService.findByUsuario(usuario);
				model.addAttribute("projetos", projetos);
				model.addAttribute("qtdProjetos", projetoService.countByUsuario(usuariogit st));
				return "painel/entidade/projeto/lista";
			}

		} catch (Exception e) {
			System.out.println(e);
			return "";
		}
	}

}
