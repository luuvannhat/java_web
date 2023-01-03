package com.devpro.javaweb22.controller.customer;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.controller.BaseController;

//1.Báo cho spring-mvc biết đây là  controller
//2.Tạo ra  Bean và được quản lý bởi spring-container 
@Controller
public class TestController extends BaseController{
	
	//Đăng ký 1 request cho controller này
	@RequestMapping(value = {"/test"}, method = RequestMethod.GET)
	public String test(final Model model,
					 final HttpServletRequest request,
					 final HttpServletResponse response)
				throws IOException{
		return "customer/test";
	}
}
