package com.mycompany.lifill_mini_web.controller;

import java.io.OutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.lifill_mini_web.dto.OrderDetail;
import com.mycompany.lifill_mini_web.dto.response.ProductResponse;
import com.mycompany.lifill_mini_web.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/item")
@Slf4j
@Controller
public class ItemController {

	@Resource
	private ProductService service;
	
	@RequestMapping("")
	public String index() {
		log.info("index() 실행");
		return "item/index";
	}
	
	@RequestMapping("/category1")
	public String category1() {
		log.info("category1() 실행");
		return "item/category1";
	}
	
	@RequestMapping("/category2")
	public String category2() {
		log.info("category2() 실행");
		return "item/category2";
	}
	
	@RequestMapping("/category3")
	public String category3() {
		log.info("category3() 실행");
		return "item/category3";
	}
	
	@RequestMapping("/category4")
	public String category4() {
		log.info("category4() 실행");
		return "item/category4";
	}
	
	@RequestMapping("/category5")
	public String category5() {
		log.info("category5() 실행");
		return "item/category5";
	}
	
	@RequestMapping("/category6")
	public String category6() {
		log.info("category6() 실행");
		return "item/category6";
	}
	
	@RequestMapping("/item_view")
	public String itemView(Model model, String prdcode) {
		log.info("itemView() 실행");
		
		ProductResponse product = service.getProduct("P100-0010");
		
		model.addAttribute("product", product);
		
		return "item/item_view";
	}
	
	@GetMapping("/attachDownload")
	public void attachDownload(String prdcode, HttpServletResponse response) throws Exception {
		// 다운로드할 데이터를 준비
		ProductResponse product = service.getProduct(prdcode);
		byte[] data = service.getAttachData(prdcode);

		// 응답 헤더 구성
		response.setContentType(product.getPrdimgrep1type());
		// 한글 파일의 이름 -> 인코딩 변경
		String fileName = new String(product.getPrdimgrep1oname().getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		// 응답 본문에 파일 데이터 출력
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.write(data);
		os.flush();
		os.close();
	}
	
	@RequestMapping("/order")
	public String order(String prdcode, int ordAmount, int ordPrice, Model model) {
		log.info("order() 실행");
		
		OrderDetail odt = new OrderDetail();
		odt.setPrdcode(prdcode);
		odt.setOdtamount(ordAmount);
		odt.setPrdprice(ordPrice);
		
		model.addAttribute("orderDetail", odt);
		
		return "item/order";
	}
}
