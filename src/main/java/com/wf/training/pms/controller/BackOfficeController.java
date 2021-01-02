package com.wf.training.pms.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;



import com.wf.training.pms.dto.StockPriceDto;
import com.wf.training.pms.dto.SelectMonthDto;
import com.wf.training.pms.dto.SelectPeriodDto;
import com.wf.training.pms.dto.SelectYearDto;
import com.wf.training.pms.dto.BackOfficeLoginDto;
import com.wf.training.pms.dto.CommodityDto;
import com.wf.training.pms.dto.CommodityPriceDto;
import com.wf.training.pms.dto.CompanyDto;
import com.wf.training.pms.dto.SearchCommodityDto;
import com.wf.training.pms.dto.SearchCompanyDto;
import com.wf.training.pms.service.CommodityService;
import com.wf.training.pms.service.CompanyService;
import com.wf.training.pms.service.InvestorService;

@Controller
@RequestMapping("/bouser")
public class BackOfficeController {
	
	@Autowired
	private CommodityService commodityService;
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private InvestorService investorService;
	
	@RequestMapping("/home")
	public String returnHome() {
		
		return "BackOfficeUserHomePage";
	}
	
	
	@RequestMapping("/selectModifyCommodity")
	public String selectModifyCommodity(@ModelAttribute("selectCommodity") SearchCommodityDto searchCommodityDto) {
		return "SelectModifyCommodity";
	}
	
	@RequestMapping("/returnModifyCommodity")
	public String returnModifyCommodity(@Valid @ModelAttribute("selectCommodity") SearchCommodityDto searchCommodityDto, BindingResult result, @ModelAttribute("comDto") CommodityDto comDto, Model model) {
		if (result.hasErrors()) {
			return "SelectModifyCommodity";
		}
		CommodityDto output = new CommodityDto();
		
		output = this.commodityService.fetchSingleCommodityByName(searchCommodityDto);
		comDto.setDateTime(LocalDateTime.now().toString());
		model.addAttribute("searchCommodityDto", output);
		
		return "ModifyCommodity";
	}

	@RequestMapping("/validate")
	public String loginValidate() {
		
		return "index";
	}
	
	@RequestMapping("/AddCompany")
	public String returnAddCompany(@ModelAttribute("createCompany") CompanyDto createCompany,HttpSession session) {
		BackOfficeLoginDto user = (BackOfficeLoginDto)session.getAttribute("BO");
		System.out.print(user.getUserName());
		return "CreateCompany";
	}
	
	@PostMapping("/createCompany")
	public String addCompany(@Valid @ModelAttribute("createCompany") CompanyDto createCompany,BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "CreateCompany";
		}
		
		CompanyDto addCompanyOutputDto = this.companyService.addCompany(createCompany);
		
		model.addAttribute("CompanyOutput", addCompanyOutputDto);
		
		return "SaveCompanyDetails";
	}
	
	
	
	@RequestMapping("/modifyCompany")
	public String modifyCompany(@Valid @ModelAttribute("companyNewOutputDto") CompanyDto companyNewOutputDto, BindingResult result, Model model) {
		
		if (result.hasErrors()) {
			return "ModifyCompany";
		}
		
		CompanyDto companyOutputDto =this.companyService.modifyCompany(companyNewOutputDto);
		model .addAttribute("CompanyOutput", companyOutputDto);
		
		
		return "SaveCompanyDetails";
	}
	
	
	@RequestMapping("/returnCreateCommodity")
	public String returnAddCommodity(Model model ) {
		CommodityDto commodityDto=new CommodityDto();
		commodityDto.setDateTime(LocalDateTime.now().toString());
		model.addAttribute("commodity", commodityDto);
		
		return "CreateCommodity";
	}
	
	@PostMapping("/createCommodity")
	public String addCommodity(@Valid @ModelAttribute("commodity") CommodityDto dto,BindingResult result,Model model,HttpSession session) {
		if (result.hasErrors()) {
			return "CreateCommodity";
		}
		BackOfficeLoginDto user = (BackOfficeLoginDto)session.getAttribute("BO");
		dto.setBoUserId(user.getUserName());
		CommodityDto output=this.commodityService.addCommodity(dto);
		model.addAttribute("CommodityOutput", output);
		return "SavedCommodity";
	}
	
	
	
	@RequestMapping("/modifyCommodity")
	public String modifyCommodity(@Valid @ModelAttribute("commodityNewOutputDto") CommodityDto commodityNewOutputDto, BindingResult result, Model model) {
		
		
		if (result.hasErrors()) {
			return "ModifyCommodity";
		}
		
		CommodityDto commodityOutputDto =this.commodityService.modifyCommodity(commodityNewOutputDto);
		model .addAttribute("CommodityOutput", commodityOutputDto);
		
		
		return "SavedCommodity";
	}
	
	@RequestMapping("/addCommodityPrice")
	public String addCommodityPrice(@ModelAttribute("commodityPrice") CommodityPriceDto addCommodityDto,Model model) {

		List<String> commodityNames=this.commodityService.fetchAllCommodityNames();
		model.addAttribute("commodityNames",commodityNames);
		return "AddCommodityPrice";
	}
	
	
	@PostMapping("/newCommodityPrice")
	public String newCommodityPrice(@Valid @ModelAttribute("commodityPrice") CommodityPriceDto commodityPriceDto,BindingResult result,Model model) {
		List<String> commodityNames=this.commodityService.fetchAllCommodityNames();
		model.addAttribute("commodityNames",commodityNames);
		if (result.hasErrors()) {
			
			return "AddCommodityPrice";
		}
		if(this.commodityService.addCommodityPrice(commodityPriceDto))
		{
			model.addAttribute("Message", "Commodity price added successfully");
			return "AddCommodityPrice";
		}
		return "AddCommodityPrice";
	}
	@RequestMapping("/selectModifyCompany")
	public String selectModifyCompany(@ModelAttribute("selectCompany") SearchCompanyDto searchCompanyDto) {
		return "SelectModifyCompany";
	}
	
	@RequestMapping("/returnModifyCompany")
	public String returnModifyCompany(@Valid @ModelAttribute("selectCompany") SearchCompanyDto searchCompanyDto, BindingResult result, @ModelAttribute("companyNewOutputDto") CompanyDto companyNewOutputDto, Model model) {
		if (result.hasErrors()) {
			return "SelectModifyCompany";
		}
		CompanyDto companyOutputDto = new CompanyDto();
		
		companyOutputDto = this.companyService.fetchSingleCompanyByName(searchCompanyDto);
		model.addAttribute("searchCompanyDto", companyOutputDto);
		
		return "ModifyCompany";
	}
	
	
	
	
	  @RequestMapping("/addCompanyStockPrice")
		public String addCompanyStockPrice(@ModelAttribute("addstockprice") StockPriceDto addStockDto,Model model) {

			List<String> companyNames=this.companyService.fetchAllCompanyNames();
			model.addAttribute("companyNames",companyNames);
			return "AddCompanyStockPrice";
		}
		
		
		@PostMapping("/newStockPrice")
		public String newStockPrice(@Valid @ModelAttribute("addstockprice") StockPriceDto addStockDto,BindingResult result,Model model) {
			List<String> companyNames=this.companyService.fetchAllCompanyNames();
			model.addAttribute("companyNames",companyNames);
			if (result.hasErrors()) {
				
				return "AddCompanyStockPrice";
			}
			if(this.companyService.addStockPrice(addStockDto))
			{
				model.addAttribute("Message", "Stock price added successfully");
				return "AddCompanyStockPrice";
			}
			return "AddCompanyStockPrice";
		}
		
		
		@RequestMapping("/ViewAnnualReport")
		public String annualReport(@ModelAttribute("annualreport") SelectYearDto year,Model model) {
			model.addAttribute("year", year);
			return "CreateAnnualReport";
		}
		
		@RequestMapping("/ViewMonthlyReport")
		public String monthlyReport(@ModelAttribute("monthlyreport") SelectMonthDto month,Model model) {
			//String[] months= {"January","February","March","April","May","June","July","August","September","October","November","December"};
			String[] months= {"-01-","-02-","-03-","-04-","-05-","-06-","-07-","-08-","-09-","-10-","-11-","-12-"};
			model.addAttribute("months", months);
			return "CreateMonthlyReport";
		}
		
		@RequestMapping("/ViewPeriodicReport")
		public String periodicReport(@ModelAttribute("periodicreport") SelectPeriodDto period,Model model) {
			return "CreatePeriodicReport";
		}
		
		@PostMapping("/returnAnnualReport")
		public String returnAnnualReport(@ModelAttribute("annualreport") SelectYearDto year,Model model) {
				model.addAttribute("transactions", this.investorService.findAllShareTransaction());
			return "AnnualReport";
		}
		
		@PostMapping("/returnMonthlyReport")
		public String returnMonthlyReport(@ModelAttribute("monthlyreport") SelectMonthDto month,Model model) {
				model.addAttribute("transactions", this.investorService.findAllShareTransaction());
			return "MonthlyReport";
		}
		
		@PostMapping("/returnPeriodicReport")
		public String returnPeriodicReport(@ModelAttribute("periodicreport") SelectPeriodDto period,Model model) {
				model.addAttribute("transactions", this.investorService.findAllShareTransactionBetweenDates(period.getStartDate(),period.getEndDate()));
			return "PeriodicReport";
		}
		
		
		
}
