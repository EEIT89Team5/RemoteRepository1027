package com.orderx.model;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.emp.model.EmpDAO_interface;
import com.order.model.OrderVO;
import com.product.model.ProductVO;
public class OrderXService {

	private OrderXDAO_interface dao;
	
	public OrderXService(){
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config-JndiObjectFactoryBean.xml");
		dao =(OrderXDAO_interface) context.getBean("orderxDAO");
	}
	
	public OrderXVO insert(Integer order_id, Integer product_id, Timestamp orderX_time,Integer orderX_num, String orderX_status ){
		OrderXVO orderXVO=new OrderXVO();
		
		OrderVO orderVO=new OrderVO();
		orderVO.setOrder_id(order_id);
		orderXVO.setOrderVO(orderVO);
		ProductVO productVO =new ProductVO();
		productVO.setProduct_id(product_id);
		orderXVO.setProductVO(productVO);
		orderXVO.setOrderX_time(orderX_time);
		orderXVO.setOrderX_num(orderX_num);
		orderXVO.setOrderX_status(orderX_status);
		
		dao.insert(orderXVO);
		
		return orderXVO;
	}
	
	public OrderXVO insert(OrderXVO orderXVO){
		dao.insert(orderXVO);
		return orderXVO;
	}
	
	public void deleteOrderX(Integer order_id,Integer product_id){
		
		dao.delete(order_id, product_id);
		
	}
	
	public List<OrderXVO> getAllOrderX(){
		
		return dao.getAll();
	}
	public Integer getDishQuantity(Integer kind_id,Integer class_id,List<OrderXVO> list){
		
		return dao.getDishQuantity(kind_id, class_id, list);
	}
	
	public Integer getPackageQuantity(List<OrderXVO> list){
		return dao.getPackageQuantity(list);
	}
	public Integer getTotalPrice(List<OrderXVO> list){
		return dao.getTotalPrice(list);
	}
	
//	===============================================
	public OrderXVO update(Integer order_id, Integer product_id, String orderX_status,
			java.sql.Timestamp orderX_time,Integer orderX_num) {

		OrderXVO orderXVO = new OrderXVO();
		OrderVO orderVO = new OrderVO();
		ProductVO productVO =new ProductVO();
		if(orderX_status.equals("待出餐")){
			orderVO.setOrder_id(order_id);
			orderXVO.setOrderVO(orderVO);
			productVO.setProduct_id(product_id);
			orderXVO.setProductVO(productVO);
			orderXVO.setOrderX_status("出餐完成");
			orderXVO.setOrderX_time(orderX_time);
			orderXVO.setOrderX_num(orderX_num);
			dao.update(orderXVO);
			return orderXVO;
			
		}
		else if(orderX_status.equals("製作中")){
			orderVO.setOrder_id(order_id);
			orderXVO.setOrderVO(orderVO);
			productVO.setProduct_id(product_id);
			orderXVO.setProductVO(productVO);
			orderXVO.setOrderX_status("待出餐");
			orderXVO.setOrderX_time(orderX_time);
			orderXVO.setOrderX_num(orderX_num);
			dao.update(orderXVO);
			return orderXVO;
		}else{
		orderVO.setOrder_id(order_id);
		orderXVO.setOrderVO(orderVO);
		productVO.setProduct_id(product_id);
		orderXVO.setProductVO(productVO);
		orderXVO.setOrderX_status("製作中");
		orderXVO.setOrderX_time(orderX_time);
		orderXVO.setOrderX_num(orderX_num);
		dao.update(orderXVO);
		return orderXVO;}
	}
	//===============================以下為出餐口更改狀態=============================================
		
		public List<OrderXVO> getAll(Date d2) {
			return dao.getAll(d2);
		}
		public Integer  IDMAX(OrderXVO orderXVO){
			return dao.IDMAX(orderXVO);
		}
		public Integer  FINISHNUM(OrderXVO orderXVO){
			return dao.FINISHNUM(orderXVO);
			
		}
		
	//----------------------------------------------------------------------------------
		
		public List<Object[]> getPcgAmountByMonth(String year, String month, String date) {
			if(month.length()<2) month="0"+month;
			if(date.length()<2) date="0"+date;
			String dd = year+"-"+month;
			List<Object[]> list = dao.getPcgAmountByMonth(dd+"-01", dd+"-"+date);
			return list;
		}
		
		public List<Object[]> getEachPcgByMonth(String year, String month, String date, String pcgName) {
			if(month.length()<2) month="0"+month;
			if(date.length()<2) date="0"+date;
			String dd = year+"-"+month;
			List<Object[]> list = dao.getEachPcgByMonth(dd+"-01", dd+"-"+date, pcgName);
			return list;
		}
		
		public List<Object[]> getDishesAmount(String beginDate, String endDate, Integer class_id){
			return dao.getDishesAmount(beginDate, endDate, class_id);
		}
		
		public List<Object[]> getEachDishes(String beginDate, String endDate, String dishesName){
			return dao.getEachDishes(beginDate, endDate, dishesName);
		}
		
		
}
