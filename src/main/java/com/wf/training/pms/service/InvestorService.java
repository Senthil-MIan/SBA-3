package com.wf.training.pms.service;

import java.util.List;

import com.wf.training.pms.dto.HomePageOutputDto;
import com.wf.training.pms.dto.PortfolioDto;
import com.wf.training.pms.dto.PortfolioReportDto;
import com.wf.training.pms.dto.ReportTypeInputDto;
import com.wf.training.pms.dto.ShareTransactionDto;
import com.wf.training.pms.dto.WalletDto;
import com.wf.training.pms.dto.WalletTransactionsDto;
import com.wf.training.pms.dto.CompanyDto;
import com.wf.training.pms.dto.InvestorDto;
import com.wf.training.pms.dto.LoginDto;
import com.wf.training.pms.entity.RecentlyViewedCompanies;

public interface InvestorService {

	public List<InvestorDto> fetchAllInvestors();
	public InvestorDto fetchSingleInvestor(Long id);
	public InvestorDto addInvestor(InvestorDto investorDto);
	public InvestorDto editInvestor(Long id, InvestorDto investorDto);
	public InvestorDto deleteInvestor(Long id);
	boolean validateInvestor(LoginDto investorLoginDto);
	public RecentlyViewedCompanies addRecentViewCompany(LoginDto investorLoginDto, CompanyDto companyDto);
	public List<CompanyDto> getAllRecentViewCompanies(String loginKey);
	public double getWalletBalance(LoginDto investorLoginDto);	
	public String addMoneyToWallet(String loginKey, double amount);
	public WalletDto fetchWalletDetails(String loginKey);
	
	
	String withdrawMoneyFromWallet(String loginKey, double amount);
	List<WalletTransactionsDto> fetchAllWalletTransactions(String loginKey);
	
	String buySellShares(String stockName, String loginKey, String transactionType, String companyCommodity,
			int transactionShareCount);
	
	ShareTransactionDto findShareTransactionsById(Long shareTransactionId);
	
	HomePageOutputDto fetchPortFolioDetails(String loginKey);
	List<Double> getEarningFor10Weeks(String loginKey);
	List<PortfolioDto> getPortfolio(String loginKey);
	List<PortfolioReportDto> getPortfolioReport(String loginKey, ReportTypeInputDto reportTypeInputDto);
	List<ShareTransactionDto> findAllShareTransaction();
	List<ShareTransactionDto> findAllShareTransactionBetweenDates(String startDate, String endDate);	
	
}
