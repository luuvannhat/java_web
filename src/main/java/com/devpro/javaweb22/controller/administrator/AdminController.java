package com.devpro.javaweb22.controller.administrator;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.controller.BaseController;
import com.devpro.javaweb22.model.Signup;

@Controller
public class AdminController extends BaseController  {
	
	@RequestMapping(value = {"/admin/home"}, method = RequestMethod.GET)
	public String home(final Model model,
					 final HttpServletRequest request,
					 final HttpServletResponse response)
				throws IOException{
		return "administrator/home";
	}

}
