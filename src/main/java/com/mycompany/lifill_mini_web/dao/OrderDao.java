package com.mycompany.lifill_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Orders;
import com.mycompany.lifill_mini_web.dto.Payment;
import com.mycompany.lifill_mini_web.dto.response.OrderResponse;

@Mapper
public interface OrderDao {

	public int orderCount();
	public int createOrders(Orders orders);
	public List<OrderResponse> selectOrderList(String mid);
	public int selectWaitDepositStatusByMid(String mid);
	public int selectCompletePaymentStatusByMid(String mid);
	public int selectPreparingDeliveryStatusByMid(String mid);
	public int selectShippingStatusByMid(String mid);
	public int selectDeliveryCompletedStatusByMid(String mid);
	public OrderResponse selectOrderDetailByOrdid(String ordid);
	public void createPayment(Payment pmt);
	public List<OrderResponse> selectOrderListInThisMonth(String mid);
	public int selectWaitDepositStatusInThisMonthByMid(String mid);
	public int selectCompletePaymentStatusInThisMonthByMid(String mid);
	public int selectPreparingDeliveryStatusInThisMonthByMid(String mid);
	public int selectShippingStatusInThisMonthByMid(String mid);
	public int selectDeliveryCompletedStatusInThisMonthByMid(String mid);
	public int selectOrderCountByMid(String mid);
	public int selectOrderCountInThisMonthByMid(String mid);
}
