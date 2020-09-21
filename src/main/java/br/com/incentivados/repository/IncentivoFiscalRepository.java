package br.com.incentivados.repository;

import br.com.incentivados.model.IncentivoFiscal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IncentivoFiscalRepository extends JpaRepository<IncentivoFiscal, Long> {

}
