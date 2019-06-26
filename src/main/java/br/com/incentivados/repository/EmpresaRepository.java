package br.com.incentivados.repository;

import br.com.incentivados.model.Empresa;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface EmpresaRepository extends JpaRepository<Empresa, Long>{
	
	boolean existsByCnpj(String cnpj);
	
	Optional<Empresa> findById(Long id);
	Optional<Empresa> findByCnpj(String cnpj);
	Optional<Empresa> findByNomeFantasia(String nomeFantasia);
	
	List<Empresa> findByNomeFantasiaContains(String nomeFantasia);

	@Query(value = "SELECT COUNT(*) FROM empresa_has_projeto WHERE empresa_id = :empresa_id and projeto_id = :projeto_id", nativeQuery = true)
	Long isIndicacao(@Param("empresa_id") Long empresaId, @Param("projeto_id") Long projetoId);

	@Query(value = "SELECT COUNT(*) FROM empresa_has_analista WHERE empresa_id = :empresa_id and usuario_id = :usuario_id", nativeQuery = true)
	Long verifyRelacionamentoAnalista(@Param("empresa_id") Long empresaId, @Param("usuario_id") Long usuarioId);

	@Query(value = "SELECT COUNT(*) FROM empresa_has_analista WHERE empresa_id = :empresa_id and usuario_id = :usuario_id", nativeQuery = true)
	Long verifyRelacionamentoResponsavel(@Param("empresa_id") Long empresaId, @Param("usuario_id") Long usuarioId);


	@Query("SELECT empresa FROM Empresa empresa WHERE empresa.nomeFantasia LIKE %:key% OR empresa.cnpj LIKE %:key%")
    Page<Empresa> findAllByNomeFantasiaOrCnpjContaining(Pageable pageable, @Param("key") String key);
}
