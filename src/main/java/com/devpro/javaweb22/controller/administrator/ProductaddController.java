package com.devpro.javaweb22.controller.administrator;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb22.controller.BaseController;
import com.devpro.javaweb22.dto.ProductSearch;
import com.devpro.javaweb22.model.Categories;
import com.devpro.javaweb22.model.Contact;
import com.devpro.javaweb22.model.Product;
import com.devpro.javaweb22.model.ProductAdd;
import com.devpro.javaweb22.services.BaseService;
import com.devpro.javaweb22.services.CategoriesService;
import com.devpro.javaweb22.services.PagerData;
import com.devpro.javaweb22.services.ProductService;

@Controller
public class ProductaddController extends BaseController {

	@Autowired
	private ProductService productService;

	// ex: /admin/productadd/144 (thông tin sản phẩm có id = 144) <=> Path Variable
	// ex: /admin/productadd?productId=144 <=> request param
	
	@RequestMapping(value = { "/admin/productadd/{productId}" }, method = RequestMethod.GET)
	public String adminProductDetail(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,

			@PathVariable("productId") int productId) throws IOException {
		// Lấy product trong db theo productId

		Product productInDatabase = productService.getById(productId);

		model.addAttribute("productaddModel", productInDatabase);

		// đẩy danh sách categories xuống view(thêm mới sản phẩm) để hiển thị
		// selectbox cho phép chọn category
		/*
		 * String sql = "select * from tbl_category"; List<Categories> categories =
		 * categoriesService.getEntitiesByNativeSQL(sql);
		 * model.addAttribute("categories", categories ); ==> thay vào bên trong
		 * BaseController
		 */

		// trả về view
		return "administrator/productadd";
	}

	@RequestMapping(value = { "/admin/productadd" }, method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		// khởi tạo 1 product (entity) mới
		Product newProduct = new Product();

		model.addAttribute("productaddModel", newProduct);

		// đẩy danh sách categories xuống view(thêm mới sản phẩm) để hiển thị
		// selectbox cho phép chọn category
		/*
		 * String sql = "select * from tbl_category"; List<Categories> categories =
		 * categoriesService.getEntitiesByNativeSQL(sql);
		 * model.addAttribute("categories", categories ); ==> thay vào bên trong
		 * BaseController
		 */

		// trả về view
		return "administrator/productadd";
	}

	/*
	 * Để hứng dữ liệu khi click submit button trong một spring form thì cần sử dụng
	 * {@ModelAttribute} và giá trị phải giống với html attribute modelAttribute
	 */
	@RequestMapping(value = { "/admin/productadd-spring-form" }, method = RequestMethod.POST)
	public String productAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @ModelAttribute("productaddModel") Product product, // spring-form
																											// binding
			@RequestParam("productAvatar") MultipartFile productAvatar,
			@RequestParam("productPictures") MultipartFile[] productPictures) throws IOException {

		// System.out.println(productAvatar.getOriginalFilename());

		// C:/upload/abc.png
		// productAvatar.transferTo(new File("C:/upload/"+
		// productAvatar.getOriginalFilename()));

		// kiểm tra xem thông tin product đẩy lên khi click submit nên là tạo mới hay
		// chỉnh sửa
		if (product.getId() != null && product.getId() > 0) { // chỉnh sửa sản phẩm
			productService.updateProduct(product, productAvatar, productPictures);
		} else { // thêm mới
			productService.saveProduct(product, productAvatar, productPictures);
		}

		// trở về trang danh sách sản phẩm

		return "administrator/productadd";
	}

	@RequestMapping(value = { "/admin/product/list" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {

		// Lấy thông tin từ request param
		String keyword = request.getParameter("keyword");
		Integer categoryId = 0;
		try {
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		} catch (Exception e) {

		}
		Integer currentPage = BaseService.NO_PAGING;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {

		}
		// set các giá trị lấy được vào ProductSearch
		ProductSearch productSearch = new ProductSearch();
		productSearch.setKeyword(keyword);
		productSearch.setCategoryId(categoryId);
		productSearch.setCurrentPage(currentPage);
		PagerData<Product> products = productService.searchProduct(productSearch);

		model.addAttribute("productSearch", productSearch);
		model.addAttribute("products", products);

		return "administrator/product_list";

	}
	
	@RequestMapping(value = {"/admin/product/delete"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model,
															 final  HttpServletRequest request,
															 final HttpServletResponse response,
															 final @RequestBody Product product){
		 
		Product productInDb = productService.getById(product.getId());
		productInDb.setStatus(false);
		productService.saveOrUpdate(productInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message", "Đã xóa thành công");
		
		return ResponseEntity.ok(jsonResult);
	}

}
