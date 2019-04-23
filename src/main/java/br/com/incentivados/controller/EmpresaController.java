package br.com.incentivados.controller;

import br.com.incentivados.model.Empresa;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.EmpresaService;
import br.com.incentivados.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class EmpresaController {

	private EmpresaService empresaService;
	private UsuarioService usuarioService;
	private String path;

	@Autowired
	public EmpresaController(EmpresaService empresaService, UsuarioService usuarioService) {
		this.empresaService = empresaService;
		this.usuarioService = usuarioService;

	}

	@GetMapping("/painel/empresas/cadastro")
	public String getCadastrar(HttpServletRequest request, Model model) {

		// Seta o path da requisição
		path = request.getContextPath();
		model.addAttribute("path", path);
		model.addAttribute("breadcrumb", "Empresas " +  " <i class='fas fa-angle-double-right'></i> " +  " Cadastro");

		return "painel/admin/empresa/cadastro";
	}

	@PostMapping("/painel/empresas/cadastro")
	public String postCadastrar(Empresa empresa, HttpServletRequest request, Model model) {

		// Seta o path da requisição
		path = request.getContextPath();
		model.addAttribute("path", path);
		model.addAttribute("breadcrumb", "Empresas " +  " <i class='fas fa-angle-double-right'></i> " +  " Cadastro");

		try {

			Usuario usuario = new Usuario();
			usuario = (Usuario) request.getSession().getAttribute("usuario");

			if (!empresaService.existsbyCnpj(empresa.getCnpj())) {
				empresa = empresaService.save(empresa, usuario, request);
				return "painel/admin/empresa/cadastro-empresa-sucesso";
			} else {
				return "painel/admin/empresa/cadastro-empresa-falha-cnpj-cadastrado";
			}

		} catch (Exception e) {
			return "painel/admin/empresa/cadastro-empresa-falha";
		}
	}

	@GetMapping("/painel/empresas/{id}")
	public String getVisualizar(@PathVariable Long id, HttpServletRequest request, Model model) {

		// Seta o path da requisição
		path = request.getContextPath();
		model.addAttribute("path", path);
		model.addAttribute("breadcrumb", "Empresas " +  " <i class='fas fa-angle-double-right'></i> " +  " Perfil");

		try {
			Optional<Empresa> empresa = empresaService.findById(id);
			model.addAttribute("empresa", empresa.get());
			return "painel/admin/empresa/perfil";
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "";
	}

	public String getResposavelCadastrar(){
		return "";
	}

	@GetMapping("/painel/empresas/{nomeFantasia}/analistas/cadastro")
	public String getAnalistaCadastrar(@PathVariable String nomeFantasia, HttpServletRequest request, Model model) {

		// Seta o path da requisição
		path = request.getContextPath();
		model.addAttribute("path", path);
		model.addAttribute("breadcrumb", "Empresas " +  " <i class='fas fa-angle-double-right'></i> " +  " Analistas" +  " <i class='fas fa-angle-double-right'></i> " +  " Cadastro");

		try {
			Optional<Empresa> empresa = empresaService.findByNomeFantasia(nomeFantasia);
			model.addAttribute("empresa", empresa.get());
			return "painel/admin/empresa/analista/cadastro";
		} catch (Exception e) {
			return "";
		}

	}

	@PostMapping("/painel/empresas/{nomeFantasia}/analistas/cadastro")
	public String postAnalistaCadastrar(@PathVariable String nomeFantasia, Usuario analista, HttpServletRequest request,
			Model model) {

		// Seta o path da requisição
		path = request.getContextPath();
		model.addAttribute("path", path);
		model.addAttribute("breadcrumb", " Empresas " +  " <i class='fas fa-angle-double-right'></i> " +  " Analistas" +  " <i class='fas fa-angle-double-right'></i> " +  " Cadastro");

		try {
			if (usuarioService.existsByEmail(analista.getEmail())) {
				model.addAttribute("usuario", analista);
				return "painel/admin/empresa/analista/cadastro-analista-falha-email-cadastrado";
			} else if (usuarioService.existsByCpf(analista.getCpf())) {
				model.addAttribute("usuario", analista);
				return "painel/admin/empresa/analista/cadastro-analista-falha-cpf-cadastrado";
			} else {
				// Salva o analista na base de dados
				analista = usuarioService.save(analista);
				model.addAttribute("usuario", analista);

				// Atribui o analista para a lista da empresa
				Optional<Empresa> empresa = empresaService.findByNomeFantasia(nomeFantasia);
				empresa.get().getAnalistas().add(analista);
				empresaService.update(empresa.get());

				return "painel/admin/empresa/analista/cadastro-analista-sucesso";
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			model.addAttribute("erro", e);
			return "painel/admin/empresa/analista/cadastro-analista-falha";
		}
	}

	@GetMapping("/painel/empresas")
	public String getListar(@RequestParam(required = false, defaultValue = "") String chave, HttpServletRequest request,
			Model model) {

		// Seta o path da requisição
		model.addAttribute("path", request.getContextPath());
		model.addAttribute("breadcrumb", "Empresas " +  " <i class='fas fa-angle-double-right'></i> " +  " Lista");

		model.addAttribute("qtdEmpresas", empresaService.count());

		List<Empresa> empresas = new ArrayList<Empresa>();

		if (chave.equals("")) {
			empresas = empresaService.findAll();
		}

		else {
			empresas = empresaService.findByNomeFantasiaContains(chave);
		}

		model.addAttribute("empresas", empresas);

		return "painel/admin/empresa/lista";
	}

}
