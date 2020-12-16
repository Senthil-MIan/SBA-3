package com.wf.training.pms.dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.DecimalMin;

import java.time.LocalDateTime;

public class CommodityPriceDto {
	
//	this.commodityName = commodityName;
//	this.currency = currency;
//	this.price = price;
//	this.dateTime = dateTime;
//	this.commodityId = commodityId;
//	this.boUserId = boUserId;
	
	private String commodityName;
	private float Price;
	
	
	private String dateTime;
	private int commodityId;
	
	
	@DecimalMin("0.1")
	@NotNull(message="Commodity price should not be empty")
	private Float commodityPrice;
	
	
	
	
	public String getDateTime() {
		return dateTime;
	}

	public void String(String dateTime) {
		this.dateTime = dateTime;
	}

	public Float getPrice() {
		return Price;
	}

	public void setPrice(Float Price) {
		this.Price = Price;
	}
	
	public String getcommodityName() {
		return commodityName;
	}

	public void setcommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

}
