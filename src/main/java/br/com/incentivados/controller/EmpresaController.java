package br.com.incentivados.controller;

import br.com.incentivados.enumerated.TipoUsuario;
import br.com.incentivados.model.Empresa;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.service.EmpresaService;
import br.com.incentivados.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class EmpresaController {
    private EmpresaService empresaService;
    private UsuarioService usuarioService;
    private final Logger logger = Logger.getLogger(EntidadeController.class.getName());

    @Autowired
    public EmpresaController(EmpresaService empresaService, UsuarioService usuarioService) {
        this.empresaService = empresaService;
        this.usuarioService = usuarioService;
    }

    @GetMapping({"/painel/empresas"})
    public String getListar(@RequestParam(required = false,defaultValue = "") String key, @RequestParam(required = false,defaultValue = "0") int page, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        model.addAttribute("key", key);
        model.addAttribute("page", page);
        Pageable pageable = PageRequest.of(page, 10, Sort.by(new Sort.Order[]{Sort.Order.asc("id")}));
        model.addAttribute("empresas", this.empresaService.findAllByNomeFantasiaOrCnpjContaining(pageable, key));
        return "painel/admin/empresa/lista";
    }

    @GetMapping({"/painel/empresas/{id}"})
    public String getVisualizar(@PathVariable Long id, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());

        try {
            Optional<Empresa> empresa = this.empresaService.findById(id);
            if (empresa.isPresent()) {
                model.addAttribute("empresa", empresa.get());
            }

            return "painel/admin/empresa/perfil";
        } catch (Exception var5) {
            this.logger.log(Level.SEVERE, "Erro inesperado exibir os dados da empresa.", var5);
            return "";
        }
    }

    @GetMapping({"/painel/empresas/cadastro"})
    public String getCadastrar(HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);
        return "painel/admin/empresa/cadastro";
    }

    @PostMapping({"/painel/empresas/cadastro"})
    public String postCadastrar(Empresa empresa, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());

        try {
            Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
            model.addAttribute("usuario", usuario);
            if (!this.empresaService.existsbyCnpj(empresa.getCnpj())) {
                empresa = this.empresaService.save(empresa, usuario, request);
                model.addAttribute("empresa", empresa);
                return "painel/admin/empresa/cadastro-empresa-sucesso";
            } else {
                model.addAttribute("empresa", empresa);
                return "painel/admin/empresa/cadastro-empresa-falha-cnpj-cadastrado";
            }
        } catch (Exception var5) {
            return "painel/admin/empresa/cadastro-empresa-falha";
        }
    }

    @GetMapping({"/painel/empresas/{empresaId}/responsavel/cadastro"})
    public String getResposavelCadastrar(@PathVariable Long empresaId, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Optional<Empresa> empresa = this.empresaService.findById(empresaId);
        model.addAttribute("empresa", empresa.get());
        return "painel/admin/empresa/responsavel/cadastro";
    }

    @PostMapping({"/painel/empresas/{empresaId}/responsavel/cadastro"})
    public String postResponsavelCadastrar(@PathVariable Long empresaId, Usuario responsavel, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());

        try {
            if (this.usuarioService.existsByEmail(responsavel.getEmail())) {
                model.addAttribute("usuario", responsavel);
                return "painel/admin/empresa/responsavel/cadastro-responsavel-falha-email-cadastrado";
            } else if (!responsavel.getCpf().equals("") && this.usuarioService.existsByCpf(responsavel.getCpf())) {
                model.addAttribute("usuario", responsavel);
                return "painel/admin/empresa/responsavel/cadastro-responsavel-falha-cpf-cadastrado";
            } else {
                Optional<Empresa> empresa = this.empresaService.findById(empresaId);
                if (empresa.isPresent()) {
                    responsavel = this.usuarioService.save(responsavel, (Empresa)empresa.get());
                    model.addAttribute("usuario", responsavel);
                    if (this.empresaService.verifyRelacionamentoResponsavel(((Empresa)empresa.get()).getId(), responsavel.getId()) == 0L) {
                        this.empresaService.adicionaResponsavel((Empresa)empresa.get(), responsavel);
                    }

                    return "painel/admin/empresa/responsavel/cadastro-responsavel-sucesso";
                } else {
                    return "painel/admin/empresa/responsavel/cadastro-responsavel-falha";
                }
            }
        } catch (Exception var6) {
            System.out.println(var6.toString());
            model.addAttribute("erro", var6);
            return "painel/admin/empresa/responsavel/cadastro-analista-falha";
        }
    }

    @GetMapping({"/painel/{empresaId}/analistas"})
    public String getAnalistas(@PathVariable Long empresaId, @RequestParam(required = false,defaultValue = "0") int page, @RequestParam(required = false,defaultValue = "") String key, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);
        Optional<Empresa> empresa = this.empresaService.findById(empresaId);
        model.addAttribute("empresa", empresa.get());
        Pageable pageableAnalistas = PageRequest.of(page, 10, Sort.by(new Sort.Order[]{Sort.Order.desc("id")}));
        model.addAttribute("analistas", this.usuarioService.findAllByEmpresa(pageableAnalistas, (Empresa)empresa.get(), key, TipoUsuario.ANALISTA));
        return "painel/empresa/analista/lista";
    }

    @GetMapping({"/painel/empresas/{empresaId}/analistas/cadastro", "/painel/{empresaId}/analistas/cadastro"})
    public String getAnalistaCadastrar(@PathVariable Long empresaId, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
        model.addAttribute("usuario", usuario);
        switch(usuario.getTipoUsuario()) {
            case ADMIN:
                Optional<Empresa> empresa = this.empresaService.findById(empresaId);
                model.addAttribute("empresa", empresa.get());
                return "painel/admin/empresa/analista/cadastro";
            case EMPRESA:
                return "painel/empresa/analista/cadastro";
            default:
                return "";
        }
    }

    @PostMapping({"/painel/empresas/{empresaId}/analistas/cadastro", "/painel/{empresaId}/analistas/cadastro"})
    public String postAnalistaCadastrar(@PathVariable Long empresaId, Usuario analista, HttpServletRequest request, Model model) {
        model.addAttribute("path", request.getContextPath());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
        Optional empresa;
        switch(usuario.getTipoUsuario()) {
            case ADMIN:
                try {
                    if (this.usuarioService.existsByEmail(analista.getEmail())) {
                        model.addAttribute("analista", analista);
                        return "painel/admin/empresa/analista/cadastro-analista-falha-email-cadastrado";
                    } else {
                        if (!analista.getCpf().equals("") && this.usuarioService.existsByCpf(analista.getCpf())) {
                            model.addAttribute("analista", analista);
                            return "painel/admin/empresa/analista/cadastro-analista-falha-cpf-cadastrado";
                        }

                        empresa = this.empresaService.findById(empresaId);
                        if (empresa.isPresent()) {
                            analista = this.usuarioService.save(analista, (Empresa)empresa.get());
                            model.addAttribute("analista", analista);
                            if (this.empresaService.verifyRelacionamentoAnalista(((Empresa)empresa.get()).getId(), analista.getId()) == 0L) {
                                this.empresaService.adcionaAnalista((Empresa)empresa.get(), analista);
                            }
                        }

                        return "painel/admin/empresa/analista/cadastro-analista-sucesso";
                    }
                } catch (Exception var8) {
                    System.out.println(var8.toString());
                    model.addAttribute("erro", var8);
                    return "painel/admin/empresa/analista/cadastro-analista-falha";
                }
            case EMPRESA:
                try {
                    if (this.usuarioService.existsByEmail(analista.getEmail())) {
                        model.addAttribute("usuario", analista);
                        return "painel/empresa/analista/cadastro-analista-falha-email-cadastrado";
                    } else {
                        if (this.usuarioService.existsByCpf(analista.getCpf())) {
                            model.addAttribute("usuario", analista);
                            return "painel/empresa/analista/cadastro-analista-falha-cpf-cadastrado";
                        }

                        empresa = this.empresaService.findById(empresaId);
                        if (empresa.isPresent()) {
                            analista = this.usuarioService.save(analista, (Empresa)empresa.get());
                            model.addAttribute("analista", analista);
                            if (this.empresaService.verifyRelacionamentoAnalista(((Empresa)empresa.get()).getId(), analista.getId()) == 0L) {
                                this.empresaService.adcionaAnalista((Empresa)empresa.get(), analista);
                            }
                        }

                        return "painel/empresa/analista/cadastro-analista-sucesso";
                    }
                } catch (Exception var7) {
                    System.out.println(var7.toString());
                    model.addAttribute("erro", var7);
                    return "painel/empresa/analista/cadastro-analista-falha";
                }
            default:
                return "";
        }
    }
}
