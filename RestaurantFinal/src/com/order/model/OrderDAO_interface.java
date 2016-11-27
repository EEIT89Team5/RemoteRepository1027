package com.order.model;

import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import com.orderx.model.OrderXVO;

public interface OrderDAO_interface {
	
	public void insert(OrderVO orderVO);

	public OrderVO insertWithXs(OrderVO orderVO, List<OrderXVO> orderXVOs);
	
	public OrderVO insertXs(OrderVO orderVO,List<OrderXVO> orderXVOs);

	public void update(OrderVO orderVO);

	public void delete(Integer order_id);

	public OrderVO findsByPrimaryKey(Integer order_id);

	public List<OrderXVO> getOrderDetailsByPrimaryKey(Integer order_id);
	
	public List<OrderVO> getUnpaidOrdersByDate(Date order_date);

	public List<OrderVO> getAll();
	
	public OrderVO findsByTableName(String order_table);
	
	public OrderVO getOrderDetailsByTableName(String order_table);
	
	public List<Object[]> getRevenueByMonth(String begin, String end);

}
