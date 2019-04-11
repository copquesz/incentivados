package br.com.incentivados.service;

import br.com.incentivados.model.Arquivo;
import br.com.incentivados.model.Entidade;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.repository.EntidadeRepository;
import br.com.incentivados.utility.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

@Service
public class EntidadeService {
	
	@Autowired
	private EntidadeRepository entidadeRepository;
	
	private Arquivo logo;
	private Arquivo ataEleicao;
	private Arquivo estatutoSocial;
	private Arquivo identidade;
	private Arquivo cartaoCnpj;
	private String path;
	
	public Entidade save(Entidade entidade, Usuario usuario, HttpServletRequest request) {
		
		entidade.setUsuario(usuario);
		
		path = "documentos/entidades/" + entidade.getNomeFantasia();
		logo = entidade.getDocumentosEntidade().getLogo();
		ataEleicao = entidade.getDocumentosEntidade().getAtaEleicao();
		estatutoSocial = entidade.getDocumentosEntidade().getEstatutoSocial();
		identidade = entidade.getDocumentosEntidade().getIdentidade();
		cartaoCnpj = entidade.getDocumentosEntidade().getCartaoCnpj();
		
		entidade.getDocumentosEntidade().getLogo().setPath(upload(request, logo.getFile(), "logo." + logo.getFile().getOriginalFilename().split("\\.")[1], path));
		entidade.getDocumentosEntidade().getAtaEleicao().setPath(upload(request, ataEleicao.getFile(), "ata-de-eleicao." + ataEleicao.getFile().getOriginalFilename().split("\\.")[1], path));
		entidade.getDocumentosEntidade().getEstatutoSocial().setPath(upload(request, estatutoSocial.getFile(), "estatuto-social." + estatutoSocial.getFile().getOriginalFilename().split("\\.")[1], path));
		entidade.getDocumentosEntidade().getIdentidade().setPath(upload(request, identidade.getFile(), "identidade." + identidade.getFile().getOriginalFilename().split("\\.")[1], path));
		entidade.getDocumentosEntidade().getCartaoCnpj().setPath(upload(request, cartaoCnpj.getFile(), "cartao-cnpj." + cartaoCnpj.getFile().getOriginalFilename().split("\\.")[1], path));
		
		return entidadeRepository.save(entidade);
	}
	
	public boolean existsByCnpj(String cnpj) {
		return entidadeRepository.existsByCnpj(cnpj);
	}
	
	public boolean existsByUsuario(Usuario usuario) {
		return entidadeRepository.existsByUsuario(usuario);
	}	
	
	public Optional<Entidade> findById(Long id){
		return entidadeRepository.findById(id);
	}
	
	
	public List<Entidade> findAll(){
		return entidadeRepository.findAll();
	}
	
	public List<Entidade> findTop3ByOrderByIdDesc(){
		return entidadeRepository.findTop3ByOrderByIdDesc();
	}
	
	public List<Entidade> findByUsuario(Usuario usuario){
		return entidadeRepository.findByUsuario(usuario);
	}
	
	public Long count() {
		return entidadeRepository.count();
	}
	
	public Long countByUsuario(Usuario usuario) {
		return entidadeRepository.countByUsuario(usuario);
	}
	
	public String upload(HttpServletRequest request, MultipartFile arquivo, String nomeArquivo, String url) {
		return FileUpload.upload(request, arquivo, nomeArquivo, url);
	}

}
