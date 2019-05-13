package br.com.incentivados.service;

import br.com.incentivados.model.Arquivo;
import br.com.incentivados.model.IncentivoFiscal;
import br.com.incentivados.model.Projeto;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.repository.ProjetoRepository;
import br.com.incentivados.utility.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

@Service
public class ProjetoService {

	@Autowired
	private ProjetoRepository projetoRepository;

	// Serviço que faz a persistencia do PROJETO
	public Projeto save(Projeto projeto, Usuario usuario, HttpServletRequest request) {

		projeto.setUsuario(usuario);

		projeto = uploadDocumentos(request, projeto);

		return projetoRepository.save(projeto);
	}


	// Serviço que verifica se o PROJETO já possui registro com mesmo TITULO
	public boolean existsByTitulo(String titulo) {
		return projetoRepository.existsByTitulo(titulo);
	}

	// Serviço que carrega os dados do PROJETO de acordo com o ID
	public Optional<Projeto> findById(Long id) {
		return projetoRepository.findById(id);
	}

	public Page<Projeto> findAll(Pageable page){
		return projetoRepository.findAll(page);
	}

	public Page<Projeto> findAllByUsuario(Usuario usuario, Pageable page){
		return projetoRepository.findAllByUsuario(usuario, page);
	}

	// Serviço que contabiliza os PROJETOS
	public Long count() {
		return projetoRepository.count();
	}

	// Serviço que contabiliza os PROJETOS de acordo com o USUARIO
	public Long countByUsuario(Usuario usuario) {
		return projetoRepository.countByUsuario(usuario);
	}

	// Serviço que contabiliza os PROJETOS de acordo com o USUARIO
	public Long countByIncentivosFiscais(IncentivoFiscal incentivoFiscal) {
		return projetoRepository.countByIncentivosFiscais(incentivoFiscal);
	}

	private Projeto uploadDocumentos(HttpServletRequest request, Projeto projeto) {

		final String path = "documentos/entidades/" + projeto.getEntidade().getNomeFantasia() + "/" + projeto.getTitulo();
		final Arquivo logo = projeto.getDocumentosProjeto().getLogo();
		final Arquivo propostaTecnica = projeto.getDocumentosProjeto().getPropostaTecnica();
		final Arquivo propostaOrcamentaria = projeto.getDocumentosProjeto().getPropostOrcamentaria();
		final Arquivo dadosBancarios = projeto.getDocumentosProjeto().getDadosBancarios();
		final Arquivo certificado = projeto.getDocumentosProjeto().getCertificado();

		projeto.getDocumentosProjeto().getLogo().setPath(
				FileUpload.upload(request, logo.getFile(), "logo." + logo.getFile().getOriginalFilename().split("\\.")[1], path));

		projeto.getDocumentosProjeto().getPropostaTecnica().setPath(FileUpload.upload(request, propostaTecnica.getFile(),
				"proposta-tecnica." + propostaTecnica.getFile().getOriginalFilename().split("\\.")[1], path));

		projeto.getDocumentosProjeto().getPropostOrcamentaria().setPath(FileUpload.upload(request, propostaOrcamentaria.getFile(),
				"proposta-orcamentaria." + logo.getFile().getOriginalFilename().split("\\.")[1], path));

		projeto.getDocumentosProjeto().getDadosBancarios().setPath(FileUpload.upload(request, dadosBancarios.getFile(),
				"dados-bancarios." + dadosBancarios.getFile().getOriginalFilename().split("\\.")[1], path));

		projeto.getDocumentosProjeto().getCertificado().setPath(FileUpload.upload(request, certificado.getFile(),
				"certificado." + certificado.getFile().getOriginalFilename().split("\\.")[1], path));

		return projeto;

	}

}
