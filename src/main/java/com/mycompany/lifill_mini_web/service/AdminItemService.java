package com.mycompany.lifill_mini_web.service;

import java.util.List;

import javax.annotation.Resource;
import javax.management.RuntimeErrorException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.lifill_mini_web.dao.FunctionDao;
import com.mycompany.lifill_mini_web.dao.IngredientDao;
import com.mycompany.lifill_mini_web.dao.PrdContentsDao;
import com.mycompany.lifill_mini_web.dao.PrdDetailDao;
import com.mycompany.lifill_mini_web.dao.PrdHashtagDao;
import com.mycompany.lifill_mini_web.dao.ProductDao;
import com.mycompany.lifill_mini_web.dto.CreateProductRequest;
import com.mycompany.lifill_mini_web.dto.Function;
import com.mycompany.lifill_mini_web.dto.GetProductResponse;
import com.mycompany.lifill_mini_web.dto.Ingredient;
import com.mycompany.lifill_mini_web.dto.Pager;
import com.mycompany.lifill_mini_web.dto.PrdContents;
import com.mycompany.lifill_mini_web.dto.PrdDetail;
import com.mycompany.lifill_mini_web.dto.PrdHashtag;
import com.mycompany.lifill_mini_web.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminItemService {
	@Resource
	private ProductDao productDao;
	@Resource
	private PrdDetailDao prdDetailDao;
	@Resource
	private PrdContentsDao prdContentsDao;
	@Resource
	private PrdHashtagDao prdHashtagDao;
	@Resource
	private FunctionDao functionDao;
	@Resource
	private IngredientDao ingredientDao;

	// 상품 등록
	@Transactional
	public void createItem(CreateProductRequest request) {
		// 상품코드 생성
		String productCode = createPrdCode(request.getFnval());
		
		// Product 객체 생성
		int fnno = functionDao.fnSelectByFnval(request.getFnval());
		
		Product product = Product.builder()
				.prdcode(productCode)
				.fnno(fnno)
				.prdname(request.getPrdname())
				.prdbrand(request.getPrdbrand())
				.prdprice(request.getPrdprice())
				.prdstock(request.getPrdstock())
				.prdsubscribable(strbool(request.getPrdsubscribable()))
				.prdsalesstatus(strbool(request.getPrdsalesstatus()))
				.build();
		
		log.info("product={}", product.toString());
		
		// 사용자가 성분 직접 입력했는지 검사 메소드
		String igdval = request.getIgdval();
		if (igdval.equals("direct")) { // 직접 입력한 경우
			 igdval = request.getDirectval();
		}
		
		// ingredient 객체 생성
		Ingredient ingredient = Ingredient.builder()
				.fnno(fnno)
				.igdval(igdval)
				.build();
		
		// PrdDetail 객체 생성
		PrdDetail prdDetail = new PrdDetail();
		prdDetail.setPrdcode(productCode);
		log.info("prdDetail={}", prdDetail.toString());
		
		// prdContents 객체 생성
		PrdContents prdContents = new PrdContents();
		prdContents.setPrdcode(productCode);
		
		// 대표 이미지 리스트 가져오기
		if(!request.getPrdimglist().isEmpty()) { // 이미지가 등록된 경우
			List<MultipartFile> itemList = request.getPrdimglist();
			log.info("itemList.size()={}", itemList.size());
			
			// 대표이미지 1장은 고정
			MultipartFile imgRep = itemList.get(0);
			prdContents.setPrdimgrep1oname(imgRep.getOriginalFilename());
			prdContents.setPrdimgrep1type(imgRep.getContentType());
			
			// 상세이미지는 1장으로 고정
			MultipartFile imgDetail = request.getPrdimgdetailattach();
			prdContents.setPrdimgdetailoname(imgDetail.getOriginalFilename());
			prdContents.setPrdimgdetailtype(imgDetail.getContentType());
			
			if (itemList.size() == 3) {
				log.info("대표이미지 3장 들어옴");
				try {
					MultipartFile imgRep2 = itemList.get(1);
					prdContents.setPrdimgrep2oname(imgRep2.getOriginalFilename());
					prdContents.setPrdimgrep2type(imgRep2.getContentType());
					
					MultipartFile imgRep3 = itemList.get(2);
					prdContents.setPrdimgrep3oname(imgRep3.getOriginalFilename());
					prdContents.setPrdimgrep3type(imgRep3.getContentType());
					
					prdContents.setPrdimgrep1(imgRep.getBytes());
					prdContents.setPrdimgrep2(imgRep2.getBytes());
					prdContents.setPrdimgrep3(imgRep3.getBytes());
					
					prdContents.setPrdimgdetail(imgDetail.getBytes());
				} catch (Exception e) {}
			} else if(itemList.size() == 2) {
				log.info("대표이미지 2장 들어옴");
				try {
					MultipartFile imgRep2 = itemList.get(1);
					prdContents.setPrdimgrep2oname(imgRep2.getOriginalFilename());
					prdContents.setPrdimgrep2type(imgRep2.getContentType());
					
					prdContents.setPrdimgrep1(imgRep.getBytes());
					prdContents.setPrdimgrep2(imgRep2.getBytes());
					prdContents.setPrdimgdetail(imgDetail.getBytes());
				} catch (Exception e) {}
				
			} else {
				log.info("대표이미지 1장 들어옴");
				try {
					prdContents.setPrdimgrep1(imgRep.getBytes());
					prdContents.setPrdimgdetail(imgDetail.getBytes());
				} catch (Exception e) {}
			}
		} else {
			// 이미지가 등록되지 않은 경우
			throw new RuntimeException("이미지가 추가되지 않았습니다. 상품 이미지를 추가해주세요.");
		}
		
		prdContents.setPrdtarget(request.getPrdtarget());
		prdContents.setPrdtimes(request.getPrdtimes());
		prdContents.setPrdmethod(request.getPrdmethod());
		prdContents.setPrdeffect(request.getPrdeffect());
		prdContents.setPrdtype(request.getPrdtype());
		prdContents.setPrdingredient(request.getPrdingredient());
		
		// prdhashtag 객체 생성
		PrdHashtag prdHashtag = new PrdHashtag();
		prdHashtag.setPrdcode(productCode);
		prdHashtag.setTagval(request.getTagval());
		
		// Product 객체 db 에 저장 
		int prdRowNum = productDao.prdinsert(product);
		// PrdDetail 객체 db 에 저장
		int prdDetailRowNum = prdDetailDao.prddetailinsert(prdDetail);
		// Ingredient 객체 db 에 저장
		int prdingRowNum = ingredientDao.igdinsert(ingredient);
		// prdcontents 객체 db에 저장
		int prdContentsRowNum = prdContentsDao.prdcontentsinsert(prdContents);
		// PrdHashtag 객체 db 에 저장
		int prdHashtagRowNum = prdHashtagDao.prdhashtaginsert(prdHashtag);
	}
	
	//public List<Product.GetProductResponse> getProductList(Pager pager) {
	// 상품 목록 조회
	public List<GetProductResponse> getProductList() {
		log.info("실행");
		
		//List<Product.GetProductResponse> productList = productDao.prdselect(pager);
		List<GetProductResponse> productList = productDao.prdselect();
		
		for (GetProductResponse product : productList) {
			log.info("product={}", product.toString());
		}
		
		return productList;
	}
	
	/**
	 * 상품 코드 생성 메소드
	 * ex) P100-0001
	 * 
	 * 눈건강 -> 100
	 * 장건강 -> 200
	 * 간건강 -> 300
	 * 뼈,관절건강 -> 400
	 * 면역력 -> 500
	 * 만성피로 -> 600
	 * 혈액순환 -> 700
	 * 
	 * @param fnval
	 * @return resultItemCode
	 */
	public String createPrdCode(String fnval) {
		String resultItemCode = "P";
		
		switch(fnval) {
			case "눈건강": resultItemCode += "100"; break;
			case "장건강": resultItemCode += "200"; break;
			case "간건강": resultItemCode += "300"; break;
			case "뼈,관절건강": resultItemCode += "400"; break;
			case "면역력": resultItemCode += "500"; break;
			case "만성피로": resultItemCode += "600"; break;
			case "혈액순환": resultItemCode += "700"; break;
			default: 
				throw new RuntimeException("상품 타입 설정이 잘못 되었습니다.");
		}
		
		int num = productDao.prdcount();
		
		if (num == 0) { 
			num = 1;
		}
		num++;
		
		String numStr = String.valueOf(num);
		numStr = String.format("%04d", Integer.parseInt(numStr));
		
		resultItemCode = resultItemCode + "-" + numStr;
		
		return resultItemCode;
	}
	
	
	// String -> boolean
	public boolean strbool(String str) {
		if (str.equals("true")) {
			return true;
		} else {
			return false;
		}
	}

	// 기능별 테이블에 존재하는 fnval 값들 리스트로 생성하는 메소드
	public List<String> getFnvalList() {
		return functionDao.fnSelectFnval();
	}

	public int getTotalRows() {
		return productDao.prdcount();
	}
}
