package br.com.incentivados.controller;

import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class UsuarioController {

    private UsuarioService usuarioService;
    private final Logger logger = Logger.getLogger(EntidadeController.class.getName());

    @Autowired
    public UsuarioController(UsuarioService usuarioService){
        this.usuarioService = usuarioService;
    }

    /**
     * Persiste os dados do usuário no banco de dados.
     * @param redirect Contém a url de redirecionamento vinda da getLogin(), onde após efetuar o cadastro o usuário repassa este atributo para o método recapturar a informação.
     * @param usuario Objeto que será persistido no banco de dados.
     * @param request Recebe dados da requisição.
     * @param model   Fornece dados para a view.
     * @return 1) Retorna a página de sucesso caso usuário for cadastrado.
     *         2) Retorna a página de erro, caso não consiga cadastrar o usuário.
     */
    @PostMapping("/usuarios/cadastro")
    public String postCadastrar(@RequestParam(required = false, defaultValue = "") String redirect, Usuario usuario, HttpServletRequest request, Model model) {

        // Seta o path da requisição
        model.addAttribute("path", request.getContextPath());
        model.addAttribute("redirect", redirect);
        try {
            if(usuarioService.existsByCpf(usuario.getCpf())){
                logger.log(Level.WARNING, "Cpf já cadastrado: " + usuario.getCpf());
                return "main/usuario/cadastro-sem-sucesso";
            }
            else if(usuarioService.existsByEmail(usuario.getEmail())){
                logger.log(Level.WARNING, "E-mail já cadastrado: " + usuario.getEmail());
                return "main/usuario/cadastro-sem-sucesso";
            }
            else{
                usuarioService.save(usuario);
                logger.log(Level.INFO, "Usuário salvo com sucesso: " + usuario.getEmail());
                return "main/usuario/cadastro-efetuado-com-sucesso";
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Ocorreu um erro ao cadastrar o usuário.", e);
            return "main/usuario/cadastro-sem-sucesso";
        }
    }
}
