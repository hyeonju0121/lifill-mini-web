package com.mycompany.lifill_mini_web.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.lifill_mini_web.dao.CartDao;
import com.mycompany.lifill_mini_web.dao.OrderDao;
import com.mycompany.lifill_mini_web.dao.OrderDetailDao;
import com.mycompany.lifill_mini_web.dto.Orders;
import com.mycompany.lifill_mini_web.dto.OrdersDetail;
import com.mycompany.lifill_mini_web.dto.Payment;
import com.mycompany.lifill_mini_web.dto.request.MultipleOrdersRequest;
import com.mycompany.lifill_mini_web.dto.request.OrderItemRequest;
import com.mycompany.lifill_mini_web.dto.request.SingleOrderRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderService {

	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderDetailDao orderDetailDao;
	@Autowired
	private CartDao cartDao;
	
	public String createOrdid() {
		
		// 현재 날짜 구하기
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);
		
		int num = orderDao.orderCount();
		
		log.info("num:", num);
		
		if (num == 0) {
			num = 1;
		} else {
			num++;
		}
		
		String numStr = String.valueOf(num);
		numStr = String.format("%05d", Integer.parseInt(numStr));
		
		String resultOrdid = formatedNow + "-" + numStr;

		return resultOrdid;
	}
	
	public void createOrder(SingleOrderRequest singleOrder) {
		
		String ordid = createOrdid();
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		String mid = authentication.getName();
		
		Orders orders = Orders.builder()
				.ordid(ordid)
				.mid(mid)
				.ordtotalamount(singleOrder.getOrdtotalamount())
				.ordtotalprice(singleOrder.getOrdtotalprice())
				.ordrequest(singleOrder.getOrdrequest())
				.ordstatus("결제완료")
				.ordcreatedat(singleOrder.getOrdcreatedat())
				.ordreceivername(singleOrder.getOrdreceivername())
				.ordreceiveraddress(singleOrder.getOrdreceiveraddress())
				.ordreceiverzipcode(singleOrder.getOrdreceiverzipcode())
				.ordreceiverphone(singleOrder.getOrdreceiverphone())
				.build();
		
		// 단건 주문은 상품 수량 및 가격 = 전체 수량 및 가격이므로 total 값을 그대로 저장
		OrdersDetail odt = new OrdersDetail();
		odt.setOrdid(ordid);
		odt.setPrdcode(singleOrder.getPrdcode());
		odt.setPrdprice(singleOrder.getOrdtotalprice());
		odt.setOdtamount(singleOrder.getOrdtotalamount());
		
		Payment pmt = new Payment();
		pmt.setOrdid(ordid);
		
		orderDao.createOrders(orders);
		orderDetailDao.createOrdersDetail(odt);
		orderDao.createPayment(pmt);
	}
	
	@Transactional
	public void createOrders(MultipleOrdersRequest orders) {
		String ordid = createOrdid();
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		
		List<OrderItemRequest> itemsList = orders.getOrders();
		/*
		 orders=[
		 OrderItemRequest(prdcode=P100-0025, ordtotalamount=5, prdtotalprice=75000), 
		 OrderItemRequest(prdcode=P100-0030, ordtotalamount=2, prdtotalprice=72600), 
		 OrderItemRequest(prdcode=P500-0059, ordtotalamount=3, prdtotalprice=150000), 
		 OrderItemRequest(prdcode=P200-0072, ordtotalamount=1, prdtotalprice=34900)] 
		 
		 * */
		// ordtotalamount값 저장해서 넣어줘야함 
		int ordtotalamount = 0;
		for (OrderItemRequest temp : itemsList) {
			ordtotalamount++;
		}	
		
		// ordreceiveraddress 이거 지금 폼에서 요청이 안가는데 이유를 모르겠음
		// 성준 오빠한테 물어보기 
		String ordreceiveraddress = "대전 도안북로 93번길 10-31, 317호";
		
		log.info("ordid={}", ordid);
		
		Orders items = Orders.builder()
				.ordid(ordid)
				.mid(mid)
				.ordtotalamount(ordtotalamount)
				.ordtotalprice(orders.getOrdtotalprice())
				.ordrequest(orders.getOrdrequest())
				.ordstatus("상품준비중")
				.ordcreatedat(orders.getOrdcreatedat())
				.ordreceivername(orders.getOrdreceivername())
				.ordreceiveraddress(ordreceiveraddress)
				.ordreceiverzipcode(orders.getOrdreceiverzipcode())
				.ordreceiverphone(orders.getOrdreceiverphone())
				.build();
		
		log.info("items={}", items.toString());
		
		orderDao.createOrders(items);
		
		for (OrderItemRequest order : itemsList) {
			log.info("order={}", order.toString());
			String prdcode = order.getPrdcode();
			
			OrdersDetail odt = new OrdersDetail();
				odt.setOrdid(ordid);
				odt.setPrdcode(order.getPrdcode());
				odt.setPrdprice(order.getPrdtotalprice());
				odt.setOdtamount(order.getOrdtotalamount());
				log.info("odt={}", odt.toString());
				
				orderDetailDao.createOrdersDetail(odt);
				log.info("삽입 성공!");
			
			// 해당 사용자 장바구니 내역에서 주문한 상품은 삭제하기 
			OrderItemRequest request = new OrderItemRequest();
			request.setMid(mid);
			request.setPrdcode(prdcode);
			cartDao.deleteCartItem(request);
		}	
		
		Payment pmt = new Payment();
		pmt.setOrdid(ordid);
		
		orderDao.createPayment(pmt);
	}
}
