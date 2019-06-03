package br.com.incentivados.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
public class MainController {

	/**
	 * Exibe a página principal da aplicação.
	 * @param request Recebe dados da requisição.
	 * @param model   Fornece dados para a view.
	 * @return Retorna a página inicial da aplicação.
	 */
	@GetMapping("/")
	public String main(HttpServletRequest request, Model model) {

		model.addAttribute("path", request.getContextPath());
		
		return "main/index";
	}

}
