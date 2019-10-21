package br.com.incentivados.service;

import br.com.incentivados.enumerated.TipoUsuario;
import br.com.incentivados.model.Empresa;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UsuarioService {
    @Autowired
    private UsuarioRepository usuarioRepository;

    public UsuarioService() {
    }

    public Usuario save(Usuario usuario) {
        if (usuario.getCpf().equals("")) {
            usuario.setCpf((String)null);
        }

        return (Usuario)this.usuarioRepository.save(usuario);
    }

    public Usuario save(Usuario usuario, Empresa empresa) {
        usuario.setEmpresa(empresa);
        return (Usuario)this.usuarioRepository.save(usuario);
    }

    public boolean existsByEmailAndSenha(String cpf, String senha) {
        return this.usuarioRepository.existsByEmailAndSenha(cpf, senha);
    }

    public boolean existsByCpf(String cpf) {
        return this.usuarioRepository.existsByCpf(cpf);
    }

    public boolean existsByEmail(String email) {
        return this.usuarioRepository.existsByEmail(email);
    }

    public Usuario login(String email) {
        Usuario usuario = this.usuarioRepository.findByEmail(email);
        this.ultimoAcesso(usuario);
        return usuario;
    }

    public Usuario ultimoAcesso(Usuario usuario) {
        TimeZone tz = TimeZone.getTimeZone("America/Sao_Paulo");
        TimeZone.setDefault(tz);
        usuario.setUltimoAcesso(Calendar.getInstance(tz).getTime());
        System.out.println(Calendar.getInstance(tz).getTime());
        return (Usuario)this.usuarioRepository.save(usuario);
    }

    public Usuario setEmpresa(Usuario usuario, Empresa empresa) {
        usuario.setEmpresa(empresa);
        return (Usuario)this.usuarioRepository.save(usuario);
    }

    public Optional<Usuario> findById(Long id) {
        return this.usuarioRepository.findById(id);
    }

    public List<Usuario> findAll() {
        return this.usuarioRepository.findAll();
    }

    public Page<Usuario> findAllByEmpresa(Pageable page, Empresa empresa, String key, TipoUsuario tipoUsuario) {
        return this.usuarioRepository.findAllByEmpresa(page, empresa, key, tipoUsuario);
    }
}