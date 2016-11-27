package com.orderx.model;

import java.util.Date;
import java.util.List;

import com.order.model.OrderVO;

public interface OrderXDAO_interface {
	
	public void insert(OrderXVO orderXVO);

	public void delete(Integer order_id, Integer product_id);

	public List<OrderXVO> findByProductName(String product_name);

	public List<OrderXVO> getAll();

	public Integer getPackageQuantity(List<OrderXVO> list);
	
	public Integer getDishQuantity(Integer kind_id, Integer class_id, List<OrderXVO> list);
	
	public Integer getTotalPrice(List<OrderXVO> list);
//==========================================================
	public void update(OrderXVO orderXVO);

	List<OrderXVO> getAll(Date d2);

	public Integer FINISHNUM(OrderXVO orderXVO);

	public Integer IDMAX(OrderXVO orderXVO);
//	==========================================================
	
	public List<Object[]> getPcgAmountByMonth(String begin, String end);
	
	public List<Object[]> getEachPcgByMonth(String begin, String end, String pcgName);
	
	public List<Object[]> getDishesAmount(String beginDate, String endDate, Integer class_id);

	public List<Object[]> getEachDishes(String beginDate, String endDate, String dishesName);
}
