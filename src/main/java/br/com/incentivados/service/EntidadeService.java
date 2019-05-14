package br.com.incentivados.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import br.com.incentivados.model.Arquivo;
import br.com.incentivados.model.Entidade;
import br.com.incentivados.model.Usuario;
import br.com.incentivados.repository.EntidadeRepository;
import br.com.incentivados.utility.FileUpload;

@Service
public class EntidadeService {

    private EntidadeRepository entidadeRepository;

    @Autowired
    EntidadeService(EntidadeRepository entidadeRepository){
        this.entidadeRepository = entidadeRepository;
    }

    public Entidade save(Entidade entidade, Usuario usuario, HttpServletRequest request) {
        entidade.setUsuario(usuario);
        entidade = uploadDocumentos(entidade, request);
        entidade = entidadeRepository.save(entidade);
        return entidade;
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


    public List<Entidade> findAllByUsuario(Usuario usuario) {
        return entidadeRepository.findAllByUsuario(usuario);
    }

    public Page<Entidade> findAll(Pageable page) {
        return entidadeRepository.findAll(page);
    }

    public Page<Entidade> findAllByUsuario(Usuario usuario, Pageable page) {
        return entidadeRepository.findAllByUsuario(usuario, page);
    }

    public Long count() {
        return entidadeRepository.count();
    }

    public Long countByUsuario(Usuario usuario) {
        return entidadeRepository.countByUsuario(usuario);
    }


    private Long countByDataCadastroBetween(Date inicio, Date fim) {
        return entidadeRepository.countByDataCadastroBetween(inicio, fim);
    }

    // Exibe os dados estatísticos para buildar o charts dinamicamente
    public List<Long> buildChart() {
        final int ANO_ATUAL = GregorianCalendar.getInstance().get(Calendar.YEAR);
        final int[] MESES = new int[]{Calendar.JANUARY, Calendar.FEBRUARY, Calendar.MARCH, Calendar.APRIL, Calendar.MAY, Calendar.JUNE, Calendar.JUNE, Calendar.AUGUST, Calendar.SEPTEMBER, Calendar.OCTOBER, Calendar.NOVEMBER, Calendar.DECEMBER};
        List<Long> array = new ArrayList<>();
        Calendar data;
        for (int i = 0; i < 12; i++) {

            data = new GregorianCalendar(ANO_ATUAL, MESES[i], 1);
            array.add(countByDataCadastroBetween(
                // Instancia um calendar com a primeira data do mês passado como parâmetro -> ENUM CALENDAR
                new GregorianCalendar(ANO_ATUAL, MESES[i], data.getMinimum(Calendar.DAY_OF_MONTH)).getTime(),
                // Instancia um calendar com a última data do mês passado como parâmetro -> ENUM CALENDAR
                new GregorianCalendar(ANO_ATUAL, MESES[i], data.getMaximum(Calendar.DAY_OF_MONTH)).getTime()));
        }
        return array;
    }
    private Entidade uploadDocumentos(Entidade entidade, HttpServletRequest request) {

        final String path = "documentos/entidades/" + entidade.getNomeFantasia();
        final Arquivo logo = entidade.getDocumentosEntidade().getLogo();
        final Arquivo ataEleicao = entidade.getDocumentosEntidade().getAtaEleicao();
        final Arquivo estatutoSocial = entidade.getDocumentosEntidade().getEstatutoSocial();
        final Arquivo identidade = entidade.getDocumentosEntidade().getIdentidade();
        final Arquivo cartaoCnpj = entidade.getDocumentosEntidade().getCartaoCnpj();

        // Seta os parâmetros dos arquivos para fazer o upload
        entidade.getDocumentosEntidade().getLogo().setPath(
                FileUpload.upload(request, logo.getFile(), "logo." + logo.getFile().getOriginalFilename().split("\\.")[1], path));

        entidade.getDocumentosEntidade().getAtaEleicao().setPath(FileUpload.upload(request, ataEleicao.getFile(),
                "ata-de-eleicao." + ataEleicao.getFile().getOriginalFilename().split("\\.")[1], path));

        entidade.getDocumentosEntidade().getEstatutoSocial().setPath(FileUpload.upload(request, estatutoSocial.getFile(),
                "estatuto-social." + estatutoSocial.getFile().getOriginalFilename().split("\\.")[1], path));

        entidade.getDocumentosEntidade().getIdentidade().setPath(FileUpload.upload(request, identidade.getFile(),
                "identidade." + identidade.getFile().getOriginalFilename().split("\\.")[1], path));

        entidade.getDocumentosEntidade().getCartaoCnpj().setPath(FileUpload.upload(request, cartaoCnpj.getFile(),
                "cartao-cnpj." + cartaoCnpj.getFile().getOriginalFilename().split("\\.")[1], path));

        return entidade;
    }

}
