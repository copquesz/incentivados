package br.com.incentivados.controller;

import br.com.incentivados.enumerated.TipoUsuario;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    private String path;

    @GetMapping("/usuarios/cadastro")
    public String getCadastrar(HttpServletRequest request, Model model) {

        // Seta o path da requisição
        path = request.getContextPath();
        model.addAttribute("path", path);

        System.out.println("URL: " + request.getServletPath());

        TipoUsuario[] tiposUsuario = TipoUsuario.values();
        model.addAttribute("tiposUsuario", tiposUsuario);

        return "main/usuario/cadastro";
    }

    @PostMapping("/usuarios/cadastro")
    public String postCadastrar(@RequestParam(required = false, defaultValue = "") String redirect, Usuario usuario, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {

        // Seta o path da requisição
        path = request.getContextPath();
        model.addAttribute("path", path);
        model.addAttribute("redirect", redirect);
        try {
            usuarioService.save(usuario);
            return "main/usuario/cadastro-efetuado-com-sucesso";
        } catch (Exception e) {
            System.out.println(e);
            return "main/usuario/cadastro-sem-sucesso";
        }
    }

    @GetMapping("/usuarios/{id}")
    public String getPerfilById(@PathVariable Long id, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        path = request.getContextPath();
        model.addAttribute("path", path);

        try {
            Optional<Usuario> usuario = usuarioService.findById(id);
            model.addAttribute("usuario", usuario.get());
        } catch (Exception e) {
            // TODO: handle exception
        }

        return "usuario/perfil";
    }

    @GetMapping("/usuarios")
    public String getListar(@RequestParam(required = false) String n, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        path = request.getContextPath();
        model.addAttribute("path", path);

        List<Usuario> usuarios = new ArrayList<>();

        try {
            // Verifica se possui parâmetro de busca
            if (n.equals("")) {
                usuarios = usuarioService.findAll();
            } else {
                usuarios = usuarioService.findByNomeContains(n);
            }

        } catch (Exception e) {
            // TODO: handle exception
        }

        model.addAttribute("usuarios", usuarios);

        return "main/usuario/listar";
    }

}
