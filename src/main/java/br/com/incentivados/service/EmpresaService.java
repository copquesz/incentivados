package br.com.incentivados.service;

import br.com.incentivados.model.Empresa;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.repository.EmpresaRepository;
import br.com.incentivados.utility.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class EmpresaService {

	@Autowired
	private EmpresaRepository empresaRepository;

	public Empresa save(Empresa empresa, Usuario usuario, HttpServletRequest request) {

		empresa.setDataCadastro(new Date());
		empresa.setUsuario(usuario);

		//É passando para o setPath o retorno da url(String) onde foi salvo o documento.		
		empresa.getDocumentosEmpresa().getLogo()
				.setPath(upload(request, empresa.getDocumentosEmpresa().getLogo().getFile(), "logo."
						+ empresa.getDocumentosEmpresa().getLogo().getFile().getOriginalFilename().split("\\.")[1],
						"documentos/empresas/" + empresa.getNomeFantasia()));

		return empresaRepository.save(empresa);
	}

	public boolean existsbyCnpj(String cnpj) {
		return empresaRepository.existsByCnpj(cnpj);
	}
	
	public Empresa update(Empresa empresa) {
		return empresaRepository.save(empresa);
	}
	
	public Optional<Empresa> findById(Long id) {
		return empresaRepository.findById(id);
	}

	public Optional<Empresa> findByCnpj(String cnpj) {
		return empresaRepository.findByCnpj(cnpj);
	}
	
	public Optional<Empresa> findByNomeFantasia(String nomeFantasia) {
		return empresaRepository.findByNomeFantasia(nomeFantasia);
	}

	public List<Empresa> findAll() {
		return empresaRepository.findAll();
	}

	public List<Empresa> findByNomeFantasiaContains(String nomeFantasia) {
		return empresaRepository.findByNomeFantasiaContains(nomeFantasia);
	}

	public Long count(){
		return empresaRepository.count();
	}

	public String upload(HttpServletRequest request, MultipartFile arquivo, String nomeArquivo, String url) {
		return FileUpload.upload(request, arquivo, nomeArquivo, url);
	}

}
