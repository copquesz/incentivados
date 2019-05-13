package br.com.incentivados.service;

import br.com.incentivados.model.IncentivoFiscal;
import br.com.incentivados.repository.IncentivoFiscalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class IncentivoFiscalService {
	
	private IncentivoFiscalRepository incentivoFiscalRepository;

	@Autowired
	public IncentivoFiscalService(IncentivoFiscalRepository incentivoFiscalRepository){
		this.incentivoFiscalRepository = incentivoFiscalRepository;
	}
	
	public IncentivoFiscal save(IncentivoFiscal incentivoFiscal) {
		return incentivoFiscalRepository.save(incentivoFiscal);
	}
	
	public Long count() {
		return incentivoFiscalRepository.count();
	}

	public List<IncentivoFiscal> findAll(){
		return incentivoFiscalRepository.findAll();
	}
	
	public Page<IncentivoFiscal> findAll(Pageable page){
		return incentivoFiscalRepository.findAll(page);
	}

}
