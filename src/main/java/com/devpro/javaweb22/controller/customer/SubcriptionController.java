package com.devpro.javaweb22.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.controller.BaseController;
import com.devpro.javaweb22.model.Contact;
import com.devpro.javaweb22.model.Signup;

@Controller
public class SubcriptionController extends BaseController {
	@RequestMapping(value = { "/Subcription" }, method = RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		
		
		return "customer/Subcription";
	}
	
	/*
	 * */
	
	@RequestMapping(value = { "/admin/subcription-ajax" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_contact(final Model model,
									final HttpServletRequest request,
									final HttpServletResponse response,
									final @RequestBody  Contact contact){
		System.out.println(contact.getEmail());
		System.out.println(contact.getMessage());
		
		//tra ve ket qua
		Map<String, Object> jsonResult = new HashMap<String,Object>();
		jsonResult.put("statusCode", 200);
		jsonResult.put("statusMessage",
				"Cam on ban "+
		contact.getEmail()+
		", Chung toi se lien he som nhat!!!");
		
		return ResponseEntity.ok(jsonResult);
	}
}
