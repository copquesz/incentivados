package br.com.incentivados.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
public class MainController {

	@GetMapping("/")
	public String main(HttpServletRequest request, Model model) {

		model.addAttribute("path", request.getContextPath());

		model.addAttribute("cor", "#000;");
		
		return "main/index";
	}

}
