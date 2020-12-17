package com.wf.training.pms.service;

import java.util.List;

import com.wf.training.pms.dto.CompanyHistoricalDataOutputDto;

public interface CompanyHistoricalDataService {
	
	public List<CompanyHistoricalDataOutputDto> fetchAllCompanies();
	
	List<CompanyHistoricalDataOutputDto> fetchSingleByCompanyId(Long companyCode);

}
