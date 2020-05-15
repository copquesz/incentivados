package br.com.incentivados.service;

import br.com.incentivados.enumerated.StatusPedido;
import br.com.incentivados.model.*;
import br.com.incentivados.repository.PedidoRepository;
import br.com.incentivados.utility.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

@Service
public class PedidoService {
    private final PedidoRepository pedidoRepository;
    private final JavaMailService javaMailService;

    @Autowired
    public PedidoService(PedidoRepository pedidoRepository, JavaMailService javaMailService) {
        this.pedidoRepository = pedidoRepository;
        this.javaMailService = javaMailService;
    }

    @Transactional
    public Pedido save(Pedido pedido, HttpServletRequest request, Usuario usuario, Usuario analista, Empresa empresa, Entidade entidade) {
        pedido.setUsuario(usuario);
        pedido.setAnalista(analista);
        pedido.setEmpresa(empresa);
        pedido.setEntidade(entidade);
        pedido = this.uploadDocumentos(pedido, request);

        javaMailService.enviarEmailPedidoDoacaoUsuario(pedido);
        javaMailService.enviarEmailPedidoDoacaoAnalista(pedido);

        return this.pedidoRepository.save(pedido);
    }

    @Transactional
    public Pedido update(Pedido pedido, StatusPedido status, ObservacaoPedido observacaoPedido, Usuario usuario) {
        observacaoPedido.setUsuario(usuario);
        pedido.setStatus(status);
        pedido.setObservacaoPedido(observacaoPedido);
        return (Pedido) this.pedidoRepository.save(pedido);
    }

    @Transactional
    public Pedido update(Pedido pedido, HttpServletRequest request, MultipartFile notaFiscal) {
        pedido.setStatus(StatusPedido.APROVADO);
        Arquivo arquivo = new Arquivo();
        arquivo.setFile(notaFiscal);
        arquivo.setPath(FileUpload.upload(request, notaFiscal, "nota-fiscal-" + DateTimeFormatter.ofPattern("ddMMuuuuHHmmss").format(LocalDateTime.now()), "documentos/empresas/" + pedido.getEmpresa().getNomeFantasia() + "/notas-fiscais"));
        DocumentosObservacaoPedido documentosObservacaoPedido = new DocumentosObservacaoPedido();
        documentosObservacaoPedido.setNotaFiscal(arquivo);
        pedido.getObservacaoPedido().setDocumentosObservacaoPedido(documentosObservacaoPedido);
        return this.pedidoRepository.save(pedido);
    }

    public Optional<Pedido> findById(Long id) {
        return this.pedidoRepository.findById(id);
    }

    public List<Pedido> findAll() {
        return this.pedidoRepository.findAll();
    }

    public Page<Pedido> findAll(Pageable page) {
        return this.pedidoRepository.findAll(page);
    }

    public Page<Pedido> findAllByLoja(String key, Pageable page) {
        return this.pedidoRepository.findAllByLoja(key, page);
    }

    public List<Pedido> findAllByLojaAndStatus(String key, StatusPedido status, Pageable page) {
        return this.pedidoRepository.findAllByLojaAndStatus(key, status, page);
    }

    public Page<Pedido> findAllByCidade(String key, Pageable page) {
        return this.pedidoRepository.findAllByCidade(key, page);
    }

    public List<Pedido> findAllByCidadeAndStatus(String key, StatusPedido status, Pageable page) {
        return this.pedidoRepository.findAllByCidadeAndStatus(key, status, page);
    }

    public Page<Pedido> findAllByEstado(String key, Pageable page) {
        return this.pedidoRepository.findAllByEstado(key, page);
    }

    public List<Pedido> findAllByEstadoAndStatus(String key, StatusPedido status, Pageable page) {
        return this.pedidoRepository.findAllByEstadoAndStatus(key, status, page);
    }

    public Page<Pedido> findAllByEntidade(String key, Pageable page) {
        return this.pedidoRepository.findAllByEntidade(key, page);
    }

    public List<Pedido> findAllByEntidadeAndStatus(String key, StatusPedido status, Pageable page) {
        return this.pedidoRepository.findAllByEntidadeAndStatus(key, status, page);
    }

    public Page<Pedido> findAllByUsuario(Usuario usuario, Pageable page) {
        return this.pedidoRepository.findAllByUsuario(usuario, page);
    }

    public List<Pedido> findAllByStatus(StatusPedido status, Pageable page) {
        return this.pedidoRepository.findAllByStatus(status, page);
    }

    public Page<Pedido> findAllByEmpresa(Empresa empresa, Pageable page) {
        return this.pedidoRepository.findAllByEmpresa(empresa, page);
    }

    public Page<Pedido> findAllByEmpresaAndStatus(Empresa empresa, StatusPedido status, Pageable page) {
        return this.pedidoRepository.findAllByEmpresaAndStatus(empresa, status, page);
    }

    public Page<Pedido> findAllByEmpresaAndLoja(Empresa empresa, String key, Pageable page) {
        return this.pedidoRepository.findAllByEmpresaAndLoja(empresa, key, page);
    }

    public Page<Pedido> findAllByEmpresaAndCidade(Empresa empresa, String key, Pageable page) {
        return this.pedidoRepository.findAllByEmpresaAndCidade(empresa, key, page);
    }

    public Page<Pedido> findAllByEmpresaAndEstado(Empresa empresa, String key, Pageable page) {
        return this.pedidoRepository.findAllByEmpresaAndEstado(empresa, key, page);
    }

    public Page<Pedido> findAllByEmpresaAndEntidade(Empresa empresa, String key, Pageable page) {
        return this.pedidoRepository.findAllByEmpresaAndEntidade(empresa, key, page);
    }

    public Page<Pedido> findAllByAnalistaAndStatus(Usuario analista, StatusPedido status, Pageable page) {
        return this.pedidoRepository.findAllByAnalistaAndStatus(analista, status, page);
    }

    public List<Pedido> findAllByEmpresaAndLojaAndStatus(Empresa empresa, String key, StatusPedido status, Pageable page) {
        return this.pedidoRepository.findAllByEmpresaAndLojaAndStatus(empresa, key, status, page);
    }

    public List<Pedido> findAllByEmpresaAndCidadeAndStatus(Empresa empresa, String key, StatusPedido status, Pageable page) {
        return this.pedidoRepository.findAllByEmpresaAndLojaAndStatus(empresa, key, status, page);
    }

    public List<Pedido> findAllByEmpresaAndEstadoAndStatus(Empresa empresa, String key, StatusPedido status, Pageable page) {
        return this.pedidoRepository.findAllByEmpresaAndEstadoAndStatus(empresa, key, status, page);
    }

    public List<Pedido> findAllByEmpresaAndEntidadeAndStatus(Empresa empresa, String key, StatusPedido status, Pageable page) {
        return this.pedidoRepository.findAllByEmpresaAndEntidadeAndStatus(empresa, key, status, page);
    }

    public Long count() {
        return this.pedidoRepository.count();
    }

    public Long countByUsuario(Usuario usuario) {
        return this.pedidoRepository.countByUsuario(usuario);
    }

    public Long countByEmpresa(Empresa empresa) {
        return this.pedidoRepository.countByEmpresa(empresa);
    }

    public Long countByAnalista(Usuario analista) {
        return this.pedidoRepository.countByAnalista(analista);
    }

    public Long countByStatus(StatusPedido status) {
        return this.pedidoRepository.countByStatus(status);
    }

    public long countByUsuarioEnderecoEstado(String estado){
        return this.pedidoRepository.countByUsuarioEnderecoEstado(estado);
    }

    private Pedido uploadDocumentos(Pedido pedido, HttpServletRequest request) {
        String path = "documentos/empresas/" + pedido.getEmpresa().getNomeFantasia() + "/pedidos";
        Arquivo cartaOficio = pedido.getDocumentosPedido().getCartaOficio();
        pedido.getDocumentosPedido().getCartaOficio().setPath(FileUpload.upload(request, cartaOficio.getFile(), "carta-oficio-" + DateTimeFormatter.ofPattern("ddMMuuuuHHmmss").format(LocalDateTime.now()), path));
        return pedido;
    }
}
