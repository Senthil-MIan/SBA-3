package com.wf.training.pms.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wf.training.pms.entity.InvestorWalletTransaction;

@Repository
public interface InvWalletTransactionRepository extends JpaRepository<InvestorWalletTransaction, Long>{

	Optional<List<InvestorWalletTransaction>> findAllByWalletId(long walletId);
}
