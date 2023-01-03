package com.devpro.javaweb22.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.model.Product;
import com.devpro.javaweb22.services.BaseService;
import com.devpro.javaweb22.services.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = {"/home"}, method = RequestMethod.GET)
	public String home(final Model model,
					 final HttpServletRequest request,
					 final HttpServletResponse response)
				throws IOException{
		
		
		
		String sql = "SELECT * FROM shop.tbl_products";
		List<Product> products = productService.getEntitiesByNativeSQL(sql);
		
		String sql_productHot = "SELECT * FROM shop.tbl_products where is_hot=true";
		List<Product> productHots = productService.getEntitiesByNativeSQL(sql_productHot);
		
		
		
		model.addAttribute("products",products);
		model.addAttribute("productHots",productHots);
		
		
		return "customer/home";
	}

}
