package com.www.controller;



import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.www.entity.SanPham;
import com.www.repository.SanPhamRepository;
import com.www.service.SanPhamService;





@Controller
@Transactional
@EnableWebMvc
public class MainController {


	
	

	// san pham
	@Autowired
	private SanPhamRepository sanPhamRepository;
	

	 @RequestMapping(value="/showFormItemProduct",method = RequestMethod.GET)
	public String getItemProduct(Model model, @RequestParam("sanpham") long theID) {
		 SanPham sanpham = sanPhamRepository.findById(theID);
		if (sanpham == null) {
			System.out.println("aaaaa");
			model.addAttribute("sp", new SanPham());
			model.addAttribute("listSanPham", new ArrayList<>());
		}else {
			System.out.println(sanpham+"bbb");
			model.addAttribute("sp", sanpham);
			model.addAttribute("listSanPham", sanPhamRepository.findByTheLoai(sanpham.getTheLoai()));
		}
		return "item-product";
	}
	
	@GetMapping("/")
	public String spItem(Model model) {
	    model.addAttribute("sanPham", sanPhamRepository.findAll());
	    return "index";
	}
    
}
