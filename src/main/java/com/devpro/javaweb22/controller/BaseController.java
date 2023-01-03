package com.devpro.javaweb22.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.javaweb22.model.Categories;
import com.devpro.javaweb22.services.CategoriesService;

public abstract class BaseController {
	
	@Autowired
	private CategoriesService categoriesService;
	
	@ModelAttribute("categories")
	public List<Categories> getAllCategories(){
		return categoriesService.findAll();
	}

}
