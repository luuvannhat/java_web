package com.devpro.javaweb22.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.controller.BaseController;
import com.devpro.javaweb22.model.Contact;
import com.devpro.javaweb22.model.Employee;
import com.devpro.javaweb22.model.Signup;

@Controller
public class SignupController extends BaseController {
	
	@RequestMapping(value = { "/Signup" }, method = RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		model.addAttribute("signupModel", new Signup());
		
		return "customer/Signup";
	}
	
	
	/*
	 * Để hứng dữ liệu khi click submit button trong một spring form
	 * thì cần sử dụng {@ModelAttribute} và giá trị phải giống với html attribute modelAttribute
	 * */
	@RequestMapping(value = { "/signup-spring-form" }, method = RequestMethod.POST)
	public String signup_post_springform(final Model model,
									final HttpServletRequest request,
									final HttpServletResponse response,
									final @ModelAttribute("signupModel") Signup signup) throws IOException{
		System.out.println(signup.getFirstName()+" "+ signup.getLastName());
		
		
		
		return "customer/Signup";
	}
}
