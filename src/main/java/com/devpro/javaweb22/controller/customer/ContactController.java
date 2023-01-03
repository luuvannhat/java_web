package com.devpro.javaweb22.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.validator.internal.util.privilegedactions.NewInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb22.controller.BaseController;
import com.devpro.javaweb22.model.Contact;
import com.devpro.javaweb22.model.Employee;
import com.devpro.javaweb22.services.ContactService;

@Controller
public class ContactController extends BaseController {
	
	//Cách sử dụng 1 spring-bean trong một spring-bean khác
	@Autowired //inject bean 
	private ContactService contactService;

	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		String sql = "select * from tbl_contact where status = 1";
		List<Contact> contacts = contactService.getEntitiesByNativeSQL(sql);
		System.out.println("SL = "+ contacts.size());
		
		String sql2 = "select * from tbl_contact where id = 21";
		Contact contact = contactService.getEntityByNativeSQL(sql2);
		System.out.println(contact.getEmail());

		String fullName = request.getParameter("fullName");
		System.out.println("fullname= " + fullName);

		// Đẩy danh sách nhân viên xuống view
		List<Employee> employees = new ArrayList<Employee>();
		employees.add(new Employee(1001, "Lưu Văn Nhật"));
		employees.add(new Employee(1002, "Vi Thùy Dương"));
		employees.add(new Employee(1003, "Hoàng Thị Thiện Hoa"));
		model.addAttribute("employees", employees);

		// đẩy một data có tên là contactModel xuống view
		// và có kiểu là Contact=> spring-form mới có thể
		// mapping giữa html attribute với class property

		model.addAttribute("contactModel", new Contact());

		return "customer/contact";
	}

	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
	public String contact_(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		// lấy dữ liệu từ view đẩy lên thông qua object request
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		System.out.println(firstName + " " + lastName);

		// đẩy dữ liệu xuống view thông qua object model
		model.addAttribute("message", "Cảm ơn bạn " + firstName + " " + lastName + " đã liên hệ với chúng tôi!!");

		return "customer/contact";
	}
	/*
	 * Để hứng dữ liệu khi click submit button trong một spring form
	 * thì cần sử dụng {@ModelAttribute} và giá trị phải giống với html attribute modelAttribute
	 * */
	@RequestMapping(value = { "/contact-spring-form" }, method = RequestMethod.POST)
	public String contact_post_springform(final Model model,
									final HttpServletRequest request,
									final HttpServletResponse response,
									final @ModelAttribute("contactModel") Contact contact) throws IOException{
		System.out.println(contact.getFirstName()+" "+contact.getLastName()+" "+ contact.getEmail());
		
		//lưu contact vào trong database
		contactService.saveOrUpdate(contact);
		
		model.addAttribute("contactModel",new Contact());
		
		
		return "customer/contact";
	}
	
	/*
	 * */
	
	@RequestMapping(value = { "/contact-ajax" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_contact(final Model model,
									final HttpServletRequest request,
									final HttpServletResponse response,
									final @RequestBody  Contact contact){
		System.out.println(contact.getFirstName());
		System.out.println(contact.getLastName());
		System.out.println(contact.getEmail());
		System.out.println(contact.getMessage());
		
		//tra ve ket qua
		Map<String, Object> jsonResult = new HashMap<String,Object>();
		jsonResult.put("statusCode", 200);
		jsonResult.put("statusMessage",
				"Cam on ban "+
		contact.getFirstName()+ " "+contact.getLastName()+
		", Chung toi se lien he som nhat!!!");
		
		return ResponseEntity.ok(jsonResult);
	}
}
