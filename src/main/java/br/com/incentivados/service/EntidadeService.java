package br.com.incentivados.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import br.com.incentivados.model.Arquivo;
import br.com.incentivados.model.Entidade;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.repository.EntidadeRepository;
import br.com.incentivados.utility.FileUpload;

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
	final int ANO_ATUAL = GregorianCalendar.getInstance().get(Calendar.YEAR);

	public Entidade save(Entidade entidade, Usuario usuario, HttpServletRequest request) {

		entidade.setUsuario(usuario);

		path = "documentos/entidades/" + entidade.getNomeFantasia();
		logo = entidade.getDocumentosEntidade().getLogo();
		ataEleicao = entidade.getDocumentosEntidade().getAtaEleicao();
		estatutoSocial = entidade.getDocumentosEntidade().getEstatutoSocial();
		identidade = entidade.getDocumentosEntidade().getIdentidade();
		cartaoCnpj = entidade.getDocumentosEntidade().getCartaoCnpj();

		entidade.getDocumentosEntidade().getLogo().setPath(
				upload(request, logo.getFile(), "logo." + logo.getFile().getOriginalFilename().split("\\.")[1], path));
		entidade.getDocumentosEntidade().getAtaEleicao().setPath(upload(request, ataEleicao.getFile(),
				"ata-de-eleicao." + ataEleicao.getFile().getOriginalFilename().split("\\.")[1], path));
		entidade.getDocumentosEntidade().getEstatutoSocial().setPath(upload(request, estatutoSocial.getFile(),
				"estatuto-social." + estatutoSocial.getFile().getOriginalFilename().split("\\.")[1], path));
		entidade.getDocumentosEntidade().getIdentidade().setPath(upload(request, identidade.getFile(),
				"identidade." + identidade.getFile().getOriginalFilename().split("\\.")[1], path));
		entidade.getDocumentosEntidade().getCartaoCnpj().setPath(upload(request, cartaoCnpj.getFile(),
				"cartao-cnpj." + cartaoCnpj.getFile().getOriginalFilename().split("\\.")[1], path));

		return entidadeRepository.save(entidade);
	}

	public boolean existsByCnpj(String cnpj) {
		return entidadeRepository.existsByCnpj(cnpj);
	}

	public boolean existsByUsuario(Usuario usuario) {
		return entidadeRepository.existsByUsuario(usuario);
	}

	public Optional<Entidade> findById(Long id) {
		return entidadeRepository.findById(id);
	}

	public List<Entidade> findAll() {
		return entidadeRepository.findAll();
	}

	public List<Entidade> findTop3ByOrderByIdDesc() {
		return entidadeRepository.findTop3ByOrderByIdDesc();
	}

	public List<Entidade> findByUsuario(Usuario usuario) {
		return entidadeRepository.findByUsuario(usuario);
	}

	public Long count() {
		return entidadeRepository.count();
	}

	public Long countByUsuario(Usuario usuario) {
		return entidadeRepository.countByUsuario(usuario);
	}

	// Ano -> new GregorianCalendar().getInstance().get(Calendar.YEAR);
	// Mês -> Calendar.DAY_OF_MONTH
	// Dia Inicial do Mês-> new GregorianCalendar().getInstance().getMinimum(Calendar.DAY_OF_MONTH);
	// Dia Final do Mês-> new GregorianCalendar().getInstance().getMaximum(Calendar.DAY_OF_MONTH);
	public Long countByDataCadastroBetween(Date inicio, Date fim) {
		return entidadeRepository.countByDataCadastroBetween(inicio, fim);
	}

	// Exibe os dados estatísticos para buildar o charts dinamicamente
	public List<Long> buildChart() {
		List<Long> array = new ArrayList<Long>();
		for (int i = 0; i < 12; i++) {
			array.add(countByDataCadastroBetween(
					// Instancia um calendar com a primeira data do mês passado como parâmetro -> ENUM CALENDAR
					new GregorianCalendar(ANO_ATUAL, i, new GregorianCalendar().getMinimum(i)).getTime(),
					// Instancia um calendar com a última data do mês passado como parâmetro -> ENUM CALENDAR
					new GregorianCalendar(ANO_ATUAL, i, new GregorianCalendar().getMaximum(i)).getTime()));
		}
		return array;
	}

	public String upload(HttpServletRequest request, MultipartFile arquivo, String nomeArquivo, String url) {
		return FileUpload.upload(request, arquivo, nomeArquivo, url);
	}

}
