package com.mycompany.lifill_mini_web.controller.admin;

import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.lifill_mini_web.dto.Pager;
import com.mycompany.lifill_mini_web.dto.request.CreateProductRequest;
import com.mycompany.lifill_mini_web.dto.response.ProductResponse;
import com.mycompany.lifill_mini_web.service.AdminItemService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("admin/item")
@Slf4j
@Controller
public class AdminItemController {
	@Autowired
	private AdminItemService adminItemService;
	
	@RequestMapping("/dashboard")
	public String dashboard() {
		log.info("dashboard() 실행");
		return "admin/item/dashboard";
	}
	
	// 상품 등록 -----------------------------------------------------
	@RequestMapping("/createItemForm")
	public String createItemForm(Model model) {
		log.info("createItemForm() 실행");
		
		List<String> fnvalList = adminItemService.getFnvalList();
		log.info("fnvalList={}", fnvalList.toString());
		
		// jsp 에서 각 기능별에 해당하는 성분 리스트를 사용할 수 있도록 설정
	    model.addAttribute("fnvalList", fnvalList);
				
		return "admin/item/createItemForm";
	}

	@PostMapping("/createItem")
	public String createItem(CreateProductRequest request) {
		log.info("실행");

		log.info("request.toString={}", request.toString());
		
		for (MultipartFile fileTemp : request.getPrdimglist()) {
			log.info("fileName={}", fileTemp.getOriginalFilename());
		}
		
		log.info("fileDetailName={}", request.getPrdimgdetailattach().getOriginalFilename());
		
		adminItemService.createItem(request);

		return "redirect:/admin/item/itemList";
	}

	// 상품 목록 조회 ---------------------------------------------------
	// public String itemList(String pageNo, Model model, HttpSession session) {
	@RequestMapping("/itemList")
	public String itemLis(String pageNo, Model model, HttpSession session) {
		log.info("itemList() 실행");

		/*
		 * 상품 수정하기에서 목록을 누르면 첫번째 페이지로 이동 -> 
		 * session에서 페이지 넘버 가져오기 pageNo를 받지 못했을 경우, 저장되어있는지 확인
		 */
		if (pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if (pageNo == null) {
				// 세션에 저장되어 있지 않을 경우 "1"로 강제 세팅
				pageNo = "1";
			}
		}
		// 세션에 pageNo 저장
		session.setAttribute("pageNo", pageNo);
		// 문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		
		// 페이징 대상이 되는 전체 행의 수 구하기
		// 만약에, 검색어를 이용해서 전체 행의 수를 구한다면 searchRows 라는 서비스 메소드를 만들어서 진행하기
		int rows = adminItemService.getTotalRows();
		
		// adminBoardService 에서 게시물 목록 요청
		Pager pager = new Pager(5, 5, rows, intPageNo);
		List<ProductResponse> productList = adminItemService.getProductList(pager);
		
		// jsp 에서 사용할 수 있도록 설정
		model.addAttribute("pager", pager);
		model.addAttribute("productList", productList);
		
		return "admin/item/itemList";
	}
	
	@GetMapping("/attachDownload")
	public void attachDownload(String prdcode, HttpServletResponse response) throws Exception {
		// 다운로드할 데이터를 준비
		ProductResponse product = adminItemService.getProduct(prdcode);
		byte[] data = adminItemService.getAttachData(prdcode);

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

	@RequestMapping("/itemUpdate")
	public String itemUpdate() {
		log.info("itemUpdate() 실행");
		return "admin/item/itemUpdate";
	}

}
