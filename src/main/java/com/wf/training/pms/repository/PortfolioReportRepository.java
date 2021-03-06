package com.wf.training.pms.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wf.training.pms.entity.PortfolioReport;

@Repository
public interface PortfolioReportRepository extends JpaRepository<PortfolioReport, Long>{
	
	Optional<List<PortfolioReport>> findAllByWalletId(Long walletId);

}
