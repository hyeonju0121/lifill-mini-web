package com.mycompany.lifill_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.lifill_mini_web.dao.FunctionDao;
import com.mycompany.lifill_mini_web.dao.IngredientDao;
import com.mycompany.lifill_mini_web.dao.PrdContentsDao;
import com.mycompany.lifill_mini_web.dao.PrdDetailDao;
import com.mycompany.lifill_mini_web.dao.PrdHashtagDao;
import com.mycompany.lifill_mini_web.dao.ProductDao;
import com.mycompany.lifill_mini_web.dto.Function;
import com.mycompany.lifill_mini_web.dto.Ingredient;
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
	public void createItem(Product.createProductRequest request) {
		/*
		 * 1. 넘어온 request 객체에서 
		 * product, prdDetail, prdContents, prdHashtag,
		 * function, ingredient 각 객체 셋팅 
		 * 
		 * 1.1 prdContent 에서 MultipartFile 대표이미지, 상세이미지 분리
		 * 대표이미지 같은 경우에는 총 3장을 등록할 수 있음 -> 
		 * prdimglist 사이즈가 4장이면 대표이미지 3장, 상세이미지 1장 등록된 경우
		 * 
		 * 2. 상품코드 생성
		 * */
		
		// 상품코드 생성
		String productCode = createPrdCode(request.getFnval());
		// Product 객체 생성
		Product product = Product.builder()
				.prdcode(productCode)
				.prdname(request.getPrdname())
				.prdbrand(request.getPrdbrand())
				.prdprice(request.getPrdprice())
				.prdstock(request.getPrdstock())
				.prdsubscribable(true)
				.prdsalesstatus(true)
				.build();
		
		// Product 객체 db 에 저장 
		int prdRowNum = productDao.prdinsert(product);
		
		log.info("product={}", product.toString());
		log.info("prdRowNum : " + prdRowNum);
		
		// PrdDetail 객체 생성 후  db 저장
		PrdDetail prdDetail = new PrdDetail();
		prdDetail.setPrdcode(productCode);
		log.info("prdDetail={}", prdDetail.toString());
		
		int prdDetailRowNum = prdDetailDao.prddetailinsert(prdDetail);
		
		// function, ingredient 객체 생성 후 db 저장
		Function function = Function.builder()
				.prdcode(productCode)
				.fnval(request.getFnval())
				.build();
		
		Ingredient ingredient = Ingredient.builder()
				.prdcode(productCode)
				.igdval(request.getIgdval())
				.build();
		
		int prdfnRowNum = functionDao.fninsert(function);
		int prdingRowNum = ingredientDao.igdinsert(ingredient);
		
		// prdContents 객체 생성
		PrdContents prdContents = new PrdContents();
		prdContents.setPrdcode(productCode);
		
		// 대표 이미지 리스트 가져오기
		List<MultipartFile> itemList = request.getPrdimglist();
		
		if (itemList.size() > 0) {
			MultipartFile imgRep = itemList.get(0);
			prdContents.setPrdimgrep1oname(imgRep.getOriginalFilename());
			prdContents.setPrdimgrep1type(imgRep.getContentType());
			
			MultipartFile imgDetail = itemList.get(itemList.size()-1);
			prdContents.setPrdimgdetailoname(imgDetail.getOriginalFilename());
			prdContents.setPrdimgdetailtype(imgDetail.getContentType());
			
			try {
				prdContents.setPrdimgrep1(imgRep.getBytes());
				prdContents.setPrdimgdetail(imgDetail.getBytes());
			} catch (Exception e) {}
		}
		
		prdContents.setPrdtarget(request.getPrdtarget());
		prdContents.setPrdtimes(request.getPrdtimes());
		prdContents.setPrdmethod(request.getPrdmethod());
		prdContents.setPrdeffect(request.getPrdeffect());
		prdContents.setPrdtype(request.getPrdtype());
		prdContents.setPrdingredient(request.getPrdingredient());
		
		// prdcontents 객체 db에 저장
		int prdContentsRowNum = prdContentsDao.prdcontentsinsert(prdContents);
		
		// prdhashtag 객체 생성 후 저장
		PrdHashtag prdHashtag = new PrdHashtag();
		prdHashtag.setPrdcode(productCode);
		prdHashtag.setTagval(request.getTagval());
		
		int prdHashtagRowNum = prdHashtagDao.prdhashtaginsert(prdHashtag);
	}
	
	/**
	 * 상품 코드 생성 메소드
	 * ex) P100-0001
	 * 
	 * 눈 : fneye -> 100
	 * 장 : fnintestine -> 200
	 * 간 : fnliver -> 300
	 * 관절: fnjoint -> 400
	 * 면역/항산화: fnimmunity -> 500
	 * 혈행개선: fnblood -> 600
	 * 
	 * @param fnval
	 * @return resultItemCode
	 */
	public String createPrdCode(String fnval) {
		String resultItemCode = "P";
		
		switch(fnval) {
			case "fneye": resultItemCode += "100"; break;
			case "fnintestine": resultItemCode += "200"; break;
			case "fnliver": resultItemCode += "300"; break;
			case "fnjoint": resultItemCode += "400"; break;
			case "fnimmunity": resultItemCode += "500"; break;
			case "fnblood": resultItemCode += "600"; break;
			default: 
				throw new RuntimeException("상품 타입 설정이 잘못 되었습니다.");
		}
		
		int num = productDao.prdcount();
		
		if (num == 0) { num = 1;}
		
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
	
}
