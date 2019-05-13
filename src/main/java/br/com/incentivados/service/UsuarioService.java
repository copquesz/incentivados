package br.com.incentivados.service;

import br.com.incentivados.model.Empresa;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;
   
    // Método para adicionar um novo usuário
    public Usuario save(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    // Método para verificar a existência do usuário e senha
    public boolean existsByEmailAndSenha(String cpf, String senha){
        return usuarioRepository.existsByEmailAndSenha(cpf, senha);
    }

    // Método para verificar a existência do cpf
    public boolean existsByCpf(String cpf){
        return usuarioRepository.existsByCpf(cpf);
    }

    // Método para verificar a existência do email
    public boolean existsByEmail(String email){
        return usuarioRepository.existsByEmail(email);
    }

    // Método para validação de login
    public Usuario login(String email){
    	Usuario usuario = usuarioRepository.findByEmail(email);
    	ultimoAcesso(usuario);
        return usuario;
    }

    // Método para atualizar o último acesso do usuário
    public Usuario ultimoAcesso(Usuario usuario) {
    	usuario.setUltimoAcesso(new Date());
    	return usuarioRepository.save(usuario);
    }

    // Método para atualizar a empresa do usuário
    public Usuario setEmpresa(Usuario usuario, Empresa empresa) {
        usuario.setEmpresa(empresa);
        return usuarioRepository.save(usuario);
    }

    // Método para buscar um usuário por id
    public Optional<Usuario> findById(Long id) {
        return usuarioRepository.findById(id);
    }

    // Método para listar todos usuários
    public List<Usuario> findAll(){
        return usuarioRepository.findAll();
    }



}