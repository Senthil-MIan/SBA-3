package com.wf.training.pms.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wf.training.pms.entity.HistoricalRecordCommodity;
import com.wf.training.pms.entity.HistoricalRecordCompany;

@Repository
public interface CommodityPriceRepository extends JpaRepository<HistoricalRecordCommodity, Long>{
	
	Optional<List<HistoricalRecordCommodity>> findAllByCommodityId(long commodityId);

}
