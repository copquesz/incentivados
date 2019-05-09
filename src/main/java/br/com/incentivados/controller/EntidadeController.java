package br.com.incentivados.controller;

import br.com.incentivados.enumerated.TipoUsuario;
import br.com.incentivados.model.Entidade;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.EntidadeService;
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
public class EntidadeController {

	@Autowired
	private EntidadeService entidadeService;

	private String path;

	@GetMapping("/painel/entidades/cadastro")
	public String getCadastrar(HttpServletRequest request, Model model) {

		// Seta o path da requisição
		path = request.getContextPath();
		model.addAttribute("path", path);
		model.addAttribute("page", "CADASTRO DE ENTIDADE");
		return "painel/entidade/entidade/cadastro";

	}

	@PostMapping("/painel/entidades/cadastro")
	public String postCadastrar(Entidade entidade, HttpServletRequest request, Model model) {

		// Seta o path da requisição
		path = request.getContextPath();
		model.addAttribute("path", path);
		model.addAttribute("page", "CADASTRO DE ENTIDADE");

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

		try {
			if (!entidadeService.existsByCnpj(entidade.getCnpj())) {
				entidade = entidadeService.save(entidade, usuario, request);
				model.addAttribute("entidade", entidade);
				return "painel/entidade/entidade/cadastro-entidade-sucesso";
			} else {
				model.addAttribute("entidade", entidade);
				return "painel/entidade/entidade/cadastro-entidade-falha-cnpj-cadastrado";
			}
		} catch (Exception e) {
			return "painel/entidade/entidade/cadastro-entidade-falha";
		}

	}

	@GetMapping("/painel/entidades/{id}")
	public String getVisualizar(@PathVariable Long id, HttpServletRequest request, Model model) {

		// Seta o path da requisição
		path = request.getContextPath();
		model.addAttribute("path", path);

		Usuario	usuario = (Usuario) request.getSession().getAttribute("usuario");

		try {

			Optional<Entidade> entidade = entidadeService.findById(id);
			model.addAttribute("entidade", entidade.get());

			if (usuario.getTipoUsuario() == TipoUsuario.ADMIN) {
				return "painel/admin/entidade/perfil";

			} else if (usuario.getTipoUsuario() == TipoUsuario.ENTIDADE) {
				return "painel/entidade/entidade/perfil";

			} else {
				return "";

			}

		} catch (Exception e) {
			return "";
		}

	}

	@GetMapping("/painel/entidades")
	public String getListar(HttpServletRequest request, Model model) {

		// Seta o path da requisição
		path = request.getContextPath();
		model.addAttribute("path", path);
		model.addAttribute("page", "LISTA DE ENTIDADES");

		Usuario usuario = new Usuario();
		usuario = (Usuario) request.getSession().getAttribute("usuario");

		List<Entidade> entidades = new ArrayList<Entidade>();

		try {
			
			if (usuario.getTipoUsuario() == TipoUsuario.ADMIN) {
				entidades = entidadeService.findAll();
				model.addAttribute("entidades", entidades);
				return "painel/admin/entidade/lista";

			} else if (usuario.getTipoUsuario() == TipoUsuario.ENTIDADE) {
				entidades = entidadeService.findByUsuario(usuario);
				model.addAttribute("entidades", entidades);
				return "painel/entidade/entidade/lista";

			} else {
				return "";

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return "";
	}

}
