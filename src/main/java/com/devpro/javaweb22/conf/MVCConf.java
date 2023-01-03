package com.devpro.javaweb22.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

//Bước 2: khi tích hơp một spring module vào spring-boot project đó là cấu hình module đó
//1.Báo cho spring biết đây là 1 file cấu hình
//2.Tạo ra môt Bean và được quản lí bởi spring-container
@Configuration
public class MVCConf implements WebMvcConfigurer{
	
	
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		
		//ERROR: http://localhost:8080/css/styles.css 404
		//bất cứ request nào có dạng: http://localhost:8080/css/thumuccon/dcf.css sẽ vào folder src/main/resources/css
		//classpath: = /src/main/resources
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		
		//ERROR: http://localhost:8080/js/scripts.js 404
		//bất cứ request nào có dạng: http://localhost:8080/js/thumuccon/dcf.js sẽ vào folder src/main/resources/js
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");		
		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/img/");
		
		registry.addResourceHandler("/Admin/**").addResourceLocations("classpath:/Admin/");
		
		registry.addResourceHandler("/js_Subcription/**").addResourceLocations("classpath:/js_Subcription/");
		
		//đăng kí thêm folder upload
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + "C:/upload/");	
		
		registry.addResourceHandler("/summernote/**").addResourceLocations("classpath:/summernote/");
	}
	
	@Bean
	public ViewResolver viewResolver() {
		
		//Class InternalResourceViewResolver implements ViewResolver
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		
		//Thiết lập view engine
		bean.setViewClass(JstlView.class);
		
		//Đường dẫn thư mục chứa Views
		bean.setPrefix("/WEB-INF/views/");
		
		//Tên đuôi của view
		bean.setSuffix(".jsp");
		
		return bean;
	}
}
