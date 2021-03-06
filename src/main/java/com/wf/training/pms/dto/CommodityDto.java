package com.wf.training.pms.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class CommodityDto {
	
	@NotBlank(message="Currency is required")
	private String currency;
	
	@NotNull(message="Price is required")
	private Float price;
	
	@NotBlank(message="Commodity Name is required")
	private String commodityName;
	
	
	private String dateTime;
	private int commodityId;
	private String boUserId;
	
	public CommodityDto(String commodityName, String currency, Float price, String dateTime, int commodityId,
			String boUserId) {
		super();
		this.commodityName = commodityName;
		this.currency = currency;
		this.price = price;
		this.dateTime = dateTime;
		this.commodityId = commodityId;
		this.boUserId = boUserId;
	}
	
	public CommodityDto() {

	}

	public String getCommodityName() {
		return commodityName;
	}
	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public int getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(int commodityId) {
		this.commodityId = commodityId;
	}
	public String getBoUserId() {
		return boUserId;
	}
	public void setBoUserId(String boUserId) {
		this.boUserId = boUserId;
	}
	
	
	
}
