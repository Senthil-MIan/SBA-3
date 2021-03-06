package com.wf.training.pms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wf.training.pms.dto.AdminLoginDto;
import com.wf.training.pms.dto.BackOfficeLoginDto;
import com.wf.training.pms.dto.HomePageOutputDto;
import com.wf.training.pms.dto.InvestorDto;
import com.wf.training.pms.dto.LoginDto;
import com.wf.training.pms.service.AdminUserService;
import com.wf.training.pms.service.BackOfficeUserService;
import com.wf.training.pms.service.InvestorService;

@Controller
@SessionAttributes("Investor")
public class HomeController {

	@Autowired
	private BackOfficeUserService BackOfficeService;

	@Autowired
	private InvestorService investorService;
	
	@Autowired
	private AdminUserService adminService;

	@RequestMapping(value = { "/logout", "/index", "" })
	public String logout() {
		return "HomePage";
	}

	@RequestMapping("/InvestorRegistration")
	public String userRegistration(@ModelAttribute("newInvestor") InvestorDto newInvestor) {
		return "InvestorRegistrationPage";
	}

	@PostMapping("/validate")
	public String loginValidate(@Valid @ModelAttribute("superuser") AdminLoginDto dto, BindingResult result,
			Model model) {
		/*
		 * Map<String,String> map = new HashMap<>(); map.put("username",
		 * dto.getSuperUserId()); map.put("type", ); request.getSession("")
		 */
		System.out.println("Logging in");
		if (result.hasErrors()) {
			return "AdminLogin";
		} else if (adminService.validateUser(dto)) {
			System.out.println("superuser");
			return "AdminHomePage";
		} else
			model.addAttribute("Message", "Invalid Credentials");
		return "AdminLogin";
	}

	@RequestMapping("/createInvestor")
	public String createInvestor(@Valid @ModelAttribute("newInvestor") InvestorDto newInvestor, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "InvestorRegistrationPage";
		}
		InvestorDto newInvestorOut = this.investorService.addInvestor(newInvestor);

		if (newInvestorOut == null) {
			model.addAttribute("Message", "Investor already registered");
			return "InvestorRegistrationPage";
		}

		model.addAttribute("newInvestorOut", newInvestorOut);

		return "InvestorConfirmationPage";
	}

	@RequestMapping("/LoginValidate")
	public String invValidate(@Valid @ModelAttribute("investorLoginDto") LoginDto investorLoginDto,
			BindingResult result, Model model, HttpServletRequest request, HttpSession session) {
		if (result.hasErrors()) {
			return "LoginPage";
		}

		session.invalidate();
		HttpSession newSession = request.getSession();
		
		

		boolean status = this.investorService.validateInvestor(investorLoginDto);
		newSession.setAttribute("Investor", investorLoginDto);
		if (status == true) {
			HomePageOutputDto homePageOutputDto = this.investorService.fetchPortFolioDetails(investorLoginDto.getLoginKey());
			model.addAttribute("Investor", investorLoginDto);
			model.addAttribute("homePageOutputDto", homePageOutputDto);
			model.addAttribute("balance",this.investorService.getWalletBalance(investorLoginDto));
//			return "InvestorDashboardPage";
			return "redirect:user/home";
		} else {
			model.addAttribute("Message", "Invalid Credentials");
			return "LoginPage";
		}
	}

	@RequestMapping("/BackOfficeUserLogin")
	public String backOfficeUserLogin(Model model) {
		BackOfficeLoginDto backofficeuser = new BackOfficeLoginDto();
		model.addAttribute("backofficeuser", backofficeuser);
		return "BackOfficeUserLogin";
	}

	@PostMapping("/BackOfficeLoginvalidate")
	public String boLoginValidate(@Valid @ModelAttribute("backofficeuser") BackOfficeLoginDto user,
			BindingResult result, Model model, HttpServletRequest request, HttpSession session) {
		session.invalidate();
		HttpSession newSession = request.getSession();
		if (result.hasErrors()) {
			return "BackOfficeUserLogin";
		} else if (BackOfficeService.validateUser(user)) {
			newSession.setAttribute("BO", user);
			return "BackOfficeUserHomePage";
		} else {
			model.addAttribute("Message", "Invalid Credentials");
			return "BackOfficeUserLogin";
		}
	}

	@RequestMapping("/access-denied")
	public String accessDenied() {
		return "error-page";
	}

	@RequestMapping("/custom-login")
	public String customLogin() {
		return "custom-login";
	}

	@RequestMapping("/LoginPage")
	public String userLogin(@ModelAttribute("investorLoginDto") LoginDto investorLoginDto) {
		return "LoginPage";
	}

	@RequestMapping("/AdminLogin")
	public String superUserLogin(Model model) {
		AdminLoginDto superuser = new AdminLoginDto();
		model.addAttribute("superuser", superuser);
		return "AdminLogin";
	}
	

}
