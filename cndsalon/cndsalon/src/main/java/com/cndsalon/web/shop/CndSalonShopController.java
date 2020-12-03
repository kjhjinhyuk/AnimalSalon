package com.cndsalon.web.shop;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cndsalon.domain.shop.CndSalonShopInfoVO;
import com.cndsalon.service.shop.ShopListService;

import lombok.extern.java.Log;

@Controller
@Log
public class CndSalonShopController {

	@Autowired
	private ShopListService service;
	@RequestMapping("/")
	public String home() {
		log.info("Main Start");
		return "index";
	}
	@RequestMapping("/search")
	public String searchShop() {
		log.info("---- Main Start ----");
		
		return "/shop/test.html";
	}
	
	@RequestMapping(value="/getAll")
	public String getAll(@RequestParam("userLocalX") String userLocalX,
			@RequestParam("userLocalY") String userLocalY, Model model) {
		log.info("---좌표 계산 ---"+userLocalX+userLocalY);
		log.info("---------getAll Start--------------------");
		CndSalonShopInfoVO shopVO = new CndSalonShopInfoVO();
		shopVO.setUserLocalX(userLocalX);
		shopVO.setUserLocalY(userLocalY);
		//log.info("----userLocalX(Float)"+shopVO.getUserLocalX());
		//log.info("----userLocalX(Float)"+shopVO.getUserLocalY());
		model.addAttribute("list", service.getAll(userLocalX,userLocalY));
		return "/shop/test2.html";
	}
	
	@RequestMapping(value="/getOne")
	public String getOne(@RequestParam("sCode") String sCode, Model model) {
		log.info("--------getOne Start---------"+sCode);
		model.addAttribute("shop",service.getOne(sCode));
		
		return "/shop/test4_shop_detail.html";
	}
	
	@RequestMapping("/getLocation")
	public String getAll() {
		log.info("---------getLocation Start--------------------");
		InetAddress local;
		try {
			// 중복방지
			local=InetAddress.getLocalHost();
			String ip = local.getHostAddress();
			log.info("------ client IP "+ip+"-----");
			
		}catch(UnknownHostException e) {
			e.printStackTrace();
		}
		return "/shop/test_location.html";
	}

	@RequestMapping("/getAll_ajax")
	public String getAll_ajax(Model model) {
		log.info("---------getAll_ajax Start--------------------");
		//model.addAttribute("list", service.getAll());
		return "/shop/test3_ajax.html";
	}
	

	
	public CndSalonShopController() {
		// TODO Auto-generated constructor stub
	}// 기본 생성자 END

}//Class END