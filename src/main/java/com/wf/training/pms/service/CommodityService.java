package com.wf.training.pms.service;

import com.wf.training.pms.dto.CommodityDto;
import com.wf.training.pms.dto.SearchCommodityDto;


public interface CommodityService {


	public CommodityDto addCommodity(CommodityDto dto);

	public CommodityDto fetchSingleCommodityByName(SearchCommodityDto searchCommodityDto);

	public CommodityDto fetchSingleCommodityByName(String commodityName);
	public CommodityDto modifyCommodity(CommodityDto commodityNewOutputDto);

	
}
