package com.wf.training.pms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;
import com.wf.training.pms.entity.InvestorWallet;
import com.wf.training.pms.entity.RecentlyViewedCompanies;

@Repository
public interface InvestorWalletRepo extends JpaRepository<InvestorWallet, Long>{
	
	Optional<InvestorWallet> findByInvestorID(int investorId);

//	Optional<RecentlyViewedCompanies> findByLoginKey(String loginKey);

}
