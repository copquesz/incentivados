package br.com.incentivados.repository;

import java.math.BigInteger;
import java.util.List;
import java.util.Optional;

import br.com.incentivados.enumerated.StatusArquivo;
import br.com.incentivados.model.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProjetoRepository extends JpaRepository<Projeto, Projeto> {

    boolean existsByTitulo(String titulo);

    Optional<Projeto> findById(Long id);

    Page<Projeto> findAllByUsuario(Usuario usuario, Pageable page);

    Long countByUsuario(Usuario usuario);

    Long countByIncentivosFiscais(IncentivoFiscal incentivoFiscal);

    @Query(value = "SELECT COUNT(projeto_id) FROM projeto_has_avaliacao pjha INNER JOIN avaliacao av on pjha.avaliacao_id = av.id WHERE pjha.projeto_id = :idProjeto AND av.analista_id = :idUsuario", nativeQuery = true)
    Long verifyAvaliacao(@Param("idProjeto") Long idProjeto, @Param("idUsuario") Long idUsuario);

    @Query(value = "SELECT COUNT(projeto_id) FROM projeto_has_avaliacao INNER JOIN projeto p on projeto_has_avaliacao.projeto_id = p.id INNER JOIN avaliacao av ON projeto_has_avaliacao.avaliacao_id = av.id WHERE av.analista_id = :idAnalista", nativeQuery = true)
    Long countProjetosAvaliados(@Param("idAnalista") Long idAnalista);

    @Query("SELECT projeto FROM Projeto projeto WHERE projeto.titulo LIKE %:key%")
    Page<Projeto> findAll(Pageable page, @Param("key") String key);

    Page<Projeto> findAllByDocumentosProjetoStatusDocumentacao(Pageable pageable, StatusArquivo statusArquivo);

    Page<Projeto> findAllByUsuarioAndAndDocumentosProjetoStatusDocumentacao(Pageable pageable, Usuario usuario, StatusArquivo statusArquivo);

    Page<Projeto> findAllByTituloOrIncentivosFiscaisContaining(Pageable page, String titulo, IncentivoFiscal incentivoFiscal);

    @Query("SELECT projeto FROM Projeto projeto WHERE projeto.usuario = :usuario AND projeto.titulo LIKE %:key%")
    Page<Projeto> findAllByUsuario(@Param("usuario") Usuario usuario, Pageable page, @Param("key") String key);

    @Query("SELECT projeto FROM Projeto projeto ORDER BY projeto.notaGeral DESC, projeto.notaTecnica DESC, projeto.notaInstitucional DESC, projeto.qtdAvaliacoes DESC")
    Page<Projeto> getRanking(Pageable page);

    @Query(value = "SELECT id FROM projeto pjt INNER JOIN empresa_has_projeto ehpjt ON pjt.id = ehpjt.projeto_id INNER JOIN projeto_has_incentivo_fiscal pjthif ON pjthif.projeto_id = pjt.id where ehpjt.empresa_id = :empresa_id AND pjthif.incentivo_fiscal_id = :incentivo_fiscal_id  AND pjt.titulo LIKE %:key%", nativeQuery = true)
    List<BigInteger> findAllByEmpresaAndIncentivosFiscaisAndTituloContaining(@Param("empresa_id") Long empresaId, @Param("incentivo_fiscal_id") Long incentivoFiscalId, @Param("key") String key, Pageable page);

}
