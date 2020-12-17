package com.wf.training.pms;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import static org.assertj.core.api.Assertions.assertThat;

import com.wf.training.pms.controller.*;

@SpringBootTest
class PMSApplicationTests {

	
	@Autowired
	private HomeController HomeController;
	
	@Autowired
	private AdminController AdminController;
	
	@Autowired
	private BackOfficeController BackOfficeController;
	
	@Autowired
	private InvestorContoller InvestorContoller;

	@Test
	public void HomeController() throws Exception {
		assertThat(HomeController).isNotNull();
	}
	@Test
	public void AdminController() throws Exception {
		assertThat(AdminController).isNotNull();
	}
	@Test
	public void BackOfficeController() throws Exception {
		assertThat(BackOfficeController).isNotNull();
	}
	@Test
	public void InvestorContoller() throws Exception {
		assertThat(InvestorContoller).isNotNull();
	}

}
