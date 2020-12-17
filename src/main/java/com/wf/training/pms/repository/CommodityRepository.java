package com.wf.training.pms.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wf.training.pms.entity.Commodity;
import com.wf.training.pms.entity.Company;

@Repository
public interface CommodityRepository extends JpaRepository<Commodity, Integer>{

	Optional<Commodity> findByCommodityName(String commodityName);

}


