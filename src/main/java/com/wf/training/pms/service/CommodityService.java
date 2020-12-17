package com.wf.training.pms.service;

import java.util.List;

import com.wf.training.pms.dto.CommodityDto;
import com.wf.training.pms.dto.CommodityPriceDto;
import com.wf.training.pms.dto.CompanyDto;
import com.wf.training.pms.dto.SearchCommodityDto;


public interface CommodityService {


	public CommodityDto addCommodity(CommodityDto dto);

	public CommodityDto fetchSingleCommodityByName(SearchCommodityDto searchCommodityDto);

	public CommodityDto fetchSingleCommodityByName(String commodityName);
	public CommodityDto modifyCommodity(CommodityDto commodityNewOutputDto);
	public List<CommodityDto> fetchAllCommodity() ;
	public List<String> fetchAllCommodityNames();
	public boolean addCommodityPrice(CommodityPriceDto commodityPriceDto);

	
}
