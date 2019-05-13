package br.com.incentivados.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import br.com.incentivados.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import br.com.incentivados.enumerated.StatusPedido;
import br.com.incentivados.repository.PedidoRepository;
import br.com.incentivados.utility.FileUpload;

@Service
public class PedidoService {

    private PedidoRepository pedidoRepository;

    @Autowired
    public PedidoService(PedidoRepository pedidoRepository){
        this.pedidoRepository = pedidoRepository;
    }

    // Serviço de persistência de dados do PEDIDO
    public Pedido save(Pedido pedido, HttpServletRequest request, Usuario usuario, Usuario analista, Empresa empresa,
                       Entidade entidade) {

        pedido.setUsuario(usuario);
        pedido.setAnalista(analista);
        pedido.setEmpresa(empresa);
        pedido.setEntidade(entidade);

        pedido = uploadDocumentos(pedido, request);

        return pedidoRepository.save(pedido);
    }

    // Serviço de atualizar pedido
    public Pedido update(Pedido pedido, StatusPedido status, ObservacaoPedido observacaoPedido, Usuario usuario) {
        observacaoPedido.setUsuario(usuario);
        pedido.setStatus(status);
        pedido.setObservacaoPedido(observacaoPedido);
        return pedidoRepository.save(pedido);
    }

    // Serviço de busca objeto pelo ID
    public Optional<Pedido> findById(Long id) {
        return pedidoRepository.findById(id);
    }


    // Serviço de busca todos PEDIDOS
    public List<Pedido> findAll() {
        return pedidoRepository.findAll();
    }

    // Serviço de busca todos PEDIDOS por STATUS
    public List<Pedido> findAllByStatus(StatusPedido status, Pageable page) {
        return pedidoRepository.findAllByStatus(status, page);
    }

    // Serviço de buscar PEDIDO pelo USUARIO
    public List<Pedido> findAllByUsuario(Usuario usuario, Pageable page) {
        return pedidoRepository.findAllByUsuario(usuario);
    }

    // Serviço de busca todos PEDIDOS pela EMPRESA
    public List<Pedido> findAllByEmpresa(Empresa empresa, Pageable page){
        return pedidoRepository.findAllByEmpresa(empresa, page);
    }

    // Serviço de busca todos USUARIO pela EMPRESA
    public List<Pedido> findAllByUsuarioAndStatus(Usuario usuario, StatusPedido status, Pageable page){
        return pedidoRepository.findAllByUsuarioAndStatus(usuario, status, page);
    }

    // Serviço de busca todos PEDIDOS pela EMPRESA
    public List<Pedido> findAllByEmpresaAndStatus(Empresa empresa, StatusPedido status, Pageable page){
        return pedidoRepository.findAllByEmpresaAndStatus(empresa, status, page);
    }

    // Serviço de buscar PEDIDO pelo USUARIO e STATUS
    public List<Pedido> findAllByAnalistaAndStatus(Usuario analista, StatusPedido status, Pageable page) {
        return pedidoRepository.findAllByAnalistaAndStatus(analista, status, page);
    }

    // Serviço que contabiliza todos os PEDIDOS
    public Long count() {
        return pedidoRepository.count();
    }

    // Serviço que contabiliza todos os PEDIDOS por USUARIO
    public Long countByUsuario(Usuario usuario) {
        return pedidoRepository.countByUsuario(usuario);
    }

    // Serviço que contabiliza todos os PEDIDOS por EMPRESA
    public Long countByEmpresa(Empresa empresa) {
        return pedidoRepository.countByEmpresa(empresa);
    }

    // Serviço que contabiliza todos os PEDIDOS por ANALISTA
    public Long countByAnalista(Usuario analista) {
        return pedidoRepository.countByAnalista(analista);
    }

    // Serviço que contabiliza todos os PEDIDOS por STATUS
    public Long countByStatus(StatusPedido status) {
        return pedidoRepository.countByStatus(status);
    }

    // Serviço que contabiliza todos os PEDIDOS por EMPRESA e STATUS
    public Long countByEmpresaAndStatus(Empresa empresa, StatusPedido status) {
        return pedidoRepository.countByEmpresaAndStatus(empresa, status);
    }

    // Serviço que contabiliza todos os PEDIDOS por ANALISTA e STATUS
    public Long countByAnalistaAndStatus(Usuario analista, StatusPedido status) {
        return pedidoRepository.countByAnalistaAndStatus(analista, status);
    }

    private Pedido uploadDocumentos(Pedido pedido, HttpServletRequest request) {

        final String path = "documentos/empresas/" + pedido.getEmpresa().getNomeFantasia() + "/pedidos";
        final Arquivo cartaOficio = pedido.getDocumentosPedido().getCartaOficio();

        pedido.getDocumentosPedido().getCartaOficio()
                .setPath(FileUpload.upload(request, cartaOficio.getFile(),
                        "carta-oficio-" + DateTimeFormatter.ofPattern("ddMMuuuuHHmmss").format(LocalDateTime.now())
                                + "." + cartaOficio.getFile().getOriginalFilename().split("\\.")[1],
                        path));

        return pedido;
    }

}
