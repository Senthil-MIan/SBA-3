package com.wf.training.pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import com.wf.training.pms.dto.CompanyHistoricalDataOutputDto;
import com.wf.training.pms.dto.LoginDto;
import com.wf.training.pms.dto.MoneyInputDto;

import com.wf.training.pms.dto.HomePageOutputDto;
import com.wf.training.pms.dto.WalletDto;
import com.wf.training.pms.dto.AddWalletMoneyDto;

import com.wf.training.pms.dto.CompanyDto;
import com.wf.training.pms.dto.SearchCompanyDto;
import com.wf.training.pms.dto.ShareCountInputDto;

import com.wf.training.pms.service.CompanyHistoricalDataService;
import com.wf.training.pms.service.CompanyService;
import com.wf.training.pms.service.InvestorService;

@Controller
@SessionAttributes("Investor")
@RequestMapping("/user")
public class InvestorContoller {

	@Autowired
	private CompanyHistoricalDataService CompanyHistoricalDataService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private InvestorService investorService;

	

	@Autowired
	private CompanyHistoricalDataService historicalService;
	
	@RequestMapping(value = { "/home", "/dashboard", "/index" })
	public String home(@SessionAttribute("Investor") LoginDto investorLoginDto, Model model) {
		model.addAttribute("balance",this.investorService.getWalletBalance(investorLoginDto));
		HomePageOutputDto homePageOutputDto = this.investorService.fetchPortFolioDetails(investorLoginDto.getLoginKey());
		model.addAttribute("Investor", investorLoginDto);
		model.addAttribute("homePageOutputDto", homePageOutputDto);
		return "InvestorDashboardPage";
	}

	@RequestMapping("/searchCompany")
	public String company(@ModelAttribute("company") SearchCompanyDto company, Model model) {
		List<CompanyDto> companyDto= this.companyService.fetchAllCompanies();
		model.addAttribute("companyDto", companyDto);
		return "CompanySearch";
	}
	
		

	@RequestMapping("/historicalPrices/{companyCode}")
	public String companyHistoricalPrice(@PathVariable("companyCode") Long companyCode, Model model) {
		List<CompanyHistoricalDataOutputDto> companyHistoricalDataOutputDto = 
				this.historicalService.fetchSingleByCompanyId(companyCode);
		
		model.addAttribute("companyHistoricalDataOutputDto", companyHistoricalDataOutputDto);
		return "CompHistoricalPrices"; 
	}

	@RequestMapping("/searchCompanyName")
	public String searchCompanyName(@Valid @ModelAttribute("company") SearchCompanyDto company, BindingResult result,
			Model model, @SessionAttribute("Investor") LoginDto investorLoginDto) {
		if (result.hasErrors()) {
			return "CompanySearch";
		}
		CompanyDto searchCompany = this.companyService.fetchSingleCompanyByName(company);
		this.investorService.addRecentViewCompany(investorLoginDto, searchCompany);

		model.addAttribute("searchCompany", searchCompany);
		return "CompanyPage";
	}

	

	@RequestMapping("/company/{companyTitle}")
	public String searchCompanyByName(@PathVariable("companyTitle") String companyTitle, Model model,
			@SessionAttribute("Investor") LoginDto investorLoginDto) {

		CompanyDto searchCompany = this.companyService.fetchSingleCompanyByName(companyTitle);
		this.investorService.addRecentViewCompany(investorLoginDto, searchCompany);

		model.addAttribute("searchCompany", searchCompany);
		return "CompanyPage";
	}

	
	@RequestMapping()
	public String defaultResponse() {

		return "redirect:/user/home";
	}
	
	/**
	 * currentPortfolio method is used to display the portfolio values
	 * @param investorLoginDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value= {"/currentPortfolio"})
	public String currentPortfolio(@SessionAttribute("Investor") LoginDto investorLoginDto, Model model) {
		
		HomePageOutputDto homePageOutputDto = this.investorService.fetchPortFolioDetails(investorLoginDto.getLoginKey());
		
		model.addAttribute("Investor", investorLoginDto);
		model.addAttribute("homePageOutputDto", homePageOutputDto);
		return "CurrentPortfolio";
	}


	@RequestMapping("/wallet")
	public String wallet() {

		return "invWallet";
	}

	@RequestMapping("/recentViewCompanies")
	public String recentViewCompanies(@SessionAttribute("Investor") LoginDto investorLoginDto, Model model) {

		List<CompanyDto> companyDto = this.investorService.getAllRecentViewCompanies(investorLoginDto.getLoginKey());

		model.addAttribute("recentViewCompanies", companyDto);

		return "RecentViewCompanies";
	}
	
	@RequestMapping("/depositMoney")
	public String depositMoney(@SessionAttribute("Investor") LoginDto investorLoginDto,@ModelAttribute("moneyInputDto") MoneyInputDto moneyInputDto,Model model) {
		model.addAttribute("balance",this.investorService.getWalletBalance(investorLoginDto));
		moneyInputDto.setAmount(Long.valueOf(0));
		return "DepositMoney";
	}

	@RequestMapping("/AddMoney")
	public String walletAddMoney(@Valid @ModelAttribute("moneyInputDto") MoneyInputDto moneyInputDto,BindingResult result, Model model,
			@SessionAttribute("Investor") LoginDto investorLoginDto) {
		
		WalletDto walletDto = this.investorService.fetchWalletDetails(investorLoginDto.getLoginKey());
		model.addAttribute("walletDto", walletDto);
		if(result.hasErrors()) {
			return "DepositMoney";
		}
		
		String message = this.investorService.addMoneyToWallet(investorLoginDto.getLoginKey(), moneyInputDto.getAmount());
		
		model.addAttribute("message", message);
		model.addAttribute("balance",this.investorService.getWalletBalance(investorLoginDto));
		return "DepositMoney";
	}
	
	@RequestMapping("/withdrawMoney")
	public String returnWithdrawMoney(@ModelAttribute("moneyInputDto") MoneyInputDto moneyInputDto,
			@SessionAttribute("Investor") LoginDto investorLoginDto,
			Model model) {
		model.addAttribute("balance",this.investorService.getWalletBalance(investorLoginDto));
		return "WithdrawMoney";
	}
	
	@RequestMapping("/withdraw")
	public String withdraw(@ModelAttribute("moneyInputDto") MoneyInputDto moneyInputDto,BindingResult result,
			@SessionAttribute("Investor") LoginDto investorLoginDto,
			Model model) {
		if (result.hasErrors()) {
			return "WithdrawMoney";
		}	
		this.investorService.withdrawMoneyFromWallet(investorLoginDto.getLoginKey(), moneyInputDto.getAmount());
		model.addAttribute("balance",this.investorService.getWalletBalance(investorLoginDto));
		model.addAttribute("Message","Amount Withdrawn Successfully");
		return "WithdrawMoney";
	}
	
	
	@RequestMapping("/buyCompany/{stockName}")
	public String returnBuyPage(@PathVariable("stockName") String companyName, Model model,
			@ModelAttribute("shareCount") ShareCountInputDto shareCount) {
		model.addAttribute("stockName", companyName);
		model.addAttribute("commodtiyCompany", "Company");
		model.addAttribute("transactionType", "Buy");
		CompanyDto companyDto = this.companyService.fetchSingleCompanyByName(companyName);
		
		model.addAttribute("stockDto",companyDto);
		return "BuySellPage";
	}
	
	@RequestMapping("/BuyCompanyShares/{stockName}")
	public String buyShares(@PathVariable("stockName") String companyName, Model model,
			@Valid @ModelAttribute("shareCount") ShareCountInputDto shareCount, BindingResult result,
			@SessionAttribute("Investor") LoginDto investorLoginDto) {
		model.addAttribute("commodtiyCompany", "Company");
		model.addAttribute("transactionType", "Buy");
		CompanyDto companyDto = this.companyService.fetchSingleCompanyByName(companyName);
		model.addAttribute("stockDto",companyDto);
		if (result.hasErrors()) {
			return "BuySellPage";
		}
		
		String message= this.investorService.buySellShares(companyName, investorLoginDto.getLoginKey(), "Buy", 
				"Company", shareCount.getShareCount());
		model.addAttribute("message", message);
		
		return "BuySellPage";
	}
	
	@RequestMapping("/sellCompany/{stockName}")
	public String returnSellPage(@PathVariable("stockName") String companyName, Model model,
			@ModelAttribute("shareCount") ShareCountInputDto shareCount) {
		model.addAttribute("companyTitle", companyName);
		model.addAttribute("commodtiyCompany", "Company");
		model.addAttribute("transactionType", "Sell");
		CompanyDto companyDto = this.companyService.fetchSingleCompanyByName(companyName);
		model.addAttribute("stockDto",companyDto);
		
		return "BuySellPage";
	}
	
	@RequestMapping("/SellCompanyShares/{stockName}")
	public String sellShares(@PathVariable("stockName") String companyName, Model model,
			@Valid @ModelAttribute("shareCount") ShareCountInputDto shareCount, BindingResult result,
			@SessionAttribute("Investor") LoginDto investorLoginDto) {
		model.addAttribute("commodtiyCompany", "Company");
		model.addAttribute("transactionType", "Sell");
		CompanyDto companyDto = this.companyService.fetchSingleCompanyByName(companyName);
		model.addAttribute("stockDto",companyDto);
		if (result.hasErrors()) {
			return "BuySellPage";
		}
		
		String message= this.investorService.buySellShares(companyName, investorLoginDto.getLoginKey(), "Sell", 
				"Company", shareCount.getShareCount());
		
		model.addAttribute("message", message);
		
		return "BuySellPage";
	}
	
	


	
}
