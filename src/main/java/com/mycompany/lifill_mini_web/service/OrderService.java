package com.mycompany.lifill_mini_web.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.mycompany.lifill_mini_web.dao.OrderDao;
import com.mycompany.lifill_mini_web.dao.OrderDetailDao;
import com.mycompany.lifill_mini_web.dto.Orders;
import com.mycompany.lifill_mini_web.dto.OrdersDetail;
import com.mycompany.lifill_mini_web.dto.request.SingleOrderRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderService {

	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderDetailDao orderDetailDao;
	
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
				.ordstatus("상품준비중")
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
		
		orderDao.createOrders(orders);
		orderDetailDao.createOrdersDetail(odt);
	}
}
