package com.wf.training.pms.serviceImplementation;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wf.training.pms.dto.CommodityDto;
import com.wf.training.pms.dto.CommodityPriceDto;
import com.wf.training.pms.dto.CompanyDto;
import com.wf.training.pms.dto.SearchCommodityDto;
import com.wf.training.pms.dto.StockPriceDto;
import com.wf.training.pms.entity.Commodity;
import com.wf.training.pms.entity.Company;
import com.wf.training.pms.entity.HistoricalRecordCommodity;
import com.wf.training.pms.entity.HistoricalRecordCompany;
import com.wf.training.pms.repository.CommodityHistoricalDataRepository;
import com.wf.training.pms.repository.CommodityRepository;
import com.wf.training.pms.service.CommodityService;

@Service
public class CommodityServiceImp implements CommodityService {

	@Autowired
	private CommodityRepository commodityRepository;
	
	
	@Autowired
	private CommodityHistoricalDataRepository commodityHistoricalDataRepository;

	@Override
	public CommodityDto addCommodity(CommodityDto dto) {
		
		Commodity com = this.convertInputAddCommodityToEntity(dto);
		Commodity newCom = this.commodityRepository.save(com);
		return this.convertCommodityEntityToOutputDto(newCom);
	}

	@Override
	public CommodityDto fetchSingleCommodityByName(SearchCommodityDto searchCommodityDto) {
		Commodity commodity = this.convertSearchCommodityDtoToEntity(searchCommodityDto);
		Commodity newCommodity = this.commodityRepository.findByCommodityName(commodity.getCommodityName()).orElse(null);
		CommodityDto commodityOutputDto = this.convertCommodityEntityToOutputDto(newCommodity);
		return commodityOutputDto;
	}

	private Commodity convertSearchCommodityDtoToEntity(SearchCommodityDto searchCommodityDto) {
		Commodity commodity = new Commodity();
		commodity.setCommodityName(searchCommodityDto.getCommodityName());
		return commodity;
	}

	@Override
	public CommodityDto modifyCommodity(CommodityDto commodityNewOutputDto) {
		Commodity commodity = this.convertCommodityOutputToEntity(commodityNewOutputDto);
		Commodity modifyCommodity = this.commodityRepository.save(commodity);
		CommodityDto dto = this.convertCommodityEntityToOutputDto(modifyCommodity);
		return dto;
	}

	private Commodity convertCommodityOutputToEntity(CommodityDto commodityNewOutputDto) {
		Commodity commodity = new Commodity();
		commodity.setCommodityId(commodityNewOutputDto.getCommodityId());
		commodity.setCommodityName(commodityNewOutputDto.getCommodityName());
		commodity.setCurrency(commodityNewOutputDto.getCurrency());
		commodity.setDateTime(commodityNewOutputDto.getDateTime());
		commodity.setPrice(commodityNewOutputDto.getPrice());
		return commodity;
	}

	@Override
	public CommodityDto fetchSingleCommodityByName(String commodityName) {

		Commodity commodity = this.commodityRepository.findByCommodityName(commodityName).orElse(null);
		CommodityDto commodityDto = this.convertCommodityEntityToOutputDto(commodity);
		return commodityDto;
	}

	private Commodity convertInputAddCommodityToEntity(CommodityDto dto) {

		Commodity com = new Commodity();
		com.setCommodityName(dto.getCommodityName());
		com.setCurrency(dto.getCurrency());
		com.setPrice(dto.getPrice());
		com.setDateTime(dto.getDateTime());
		com.setBoUserId(dto.getBoUserId());
		return com;
	}

	private CommodityDto convertCommodityEntityToOutputDto(Commodity newCom) {
		CommodityDto outputDto = new CommodityDto();

		outputDto.setCommodityId(newCom.getCommodityId());
		outputDto.setCommodityName(newCom.getCommodityName());
		outputDto.setCurrency(newCom.getCurrency());
		outputDto.setPrice(newCom.getPrice());
		outputDto.setBoUserId(newCom.getBoUserId());

		return outputDto;
	}
	
	@Override
	public List<CommodityDto> fetchAllCommodity() {
		List<Commodity> commodity = this.commodityRepository.findAll();
		List<CommodityDto> dto = new ArrayList<CommodityDto>();
		for (Commodity c : commodity)
			dto.add(this.convertCommodityEntityToOutputDto(c));
		return dto;
	}


	@Override
	public List<String> fetchAllCommodityNames() {
		List<CommodityDto> commodityList = this.fetchAllCommodity();
		List<String> commodityNames = new ArrayList<String>();
		for (CommodityDto c : commodityList)
			commodityNames.add(c.getCommodityName());

		return commodityNames;
	}
	

	@Override
	public boolean addCommodityPrice(CommodityPriceDto commodityPriceDto) {
		Commodity commodity = this.commodityRepository.findByCommodityName(commodityPriceDto.getCommodityName()).orElse(null);
		if (commodity != null) {
			HistoricalRecordCommodity entity = new HistoricalRecordCommodity();
			entity.setCommodityId(commodity.getCommodityId());
			entity.setCommodityPrice(commodityPriceDto.getCommodityPrice());
			entity.setDateTime(LocalDateTime.now().toString());
			this.commodityHistoricalDataRepository.save(entity);
			return true;
		}

		return false;
	}

}
