package com.order.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.discount.model.DiscountVO;
import com.dishclass.model.DishClassDAO_interface;
import com.emp.model.EmpVO;
import com.member.model.MemberVO;
import com.orderx.model.OrderXVO;
import com.product.model.ProductVO;


public class OrderDAO implements OrderDAO_interface {

	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void insert(OrderVO orderVO) {
		hibernateTemplate.saveOrUpdate(orderVO);
	}

	@Override
	public OrderVO insertWithXs(OrderVO orderVO, List<OrderXVO> orderXVOs) {

		OrderVO neworderVO = new OrderVO();
		Integer newID = null;

		hibernateTemplate.saveOrUpdate(orderVO);

		List<Integer> orderRS = hibernateTemplate.find("SELECT MAX(order_id) FROM OrderVO ");
		for (Integer id : orderRS) {
			newID = id;
		}

		neworderVO.setOrder_id(newID);
		for (OrderXVO orderXs : orderXVOs) {
			orderXs.setOrderVO(neworderVO);
			hibernateTemplate.saveOrUpdate(orderXs);
		}

		// Session session =
		// HibernateUtil.getSessionFactory().getCurrentSession();
		// try {
		// session.beginTransaction();
		//
		// // 新增訂單(with total price)
		// session.save(orderVO);
		// // 查詢最新訂單ID
		// Query query = session.createQuery("SELECT MAX(order_id) FROM OrderVO
		// ");
		// List<Integer> orderRS = (List<Integer>) query.list();
		// for (Integer id : orderRS) {
		// newID = id;
		// }
		// neworderVO.setOrder_id(newID);
		// ;
		// // 新增訂單明細(加入查詢到之最新訂單ID)
		// for (OrderXVO orderXs : orderXVOs) {
		// orderXs.setOrderVO(neworderVO);
		// session.saveOrUpdate(orderXs);
		// }
		// // commit
		// session.getTransaction().commit();
		//
		// } catch (RuntimeException e) {
		// session.getTransaction().rollback();
		// throw e;
		// }

		return orderVO;
	}

	@Override
	public OrderVO insertXs(OrderVO orderVO, List<OrderXVO> orderXVOs) {

		hibernateTemplate.saveOrUpdate(orderVO);

		for (OrderXVO orderXs : orderXVOs) {
			orderXs.setOrderVO(orderVO);
			hibernateTemplate.saveOrUpdate(orderXs);
		}

		// Session session =
		// HibernateUtil.getSessionFactory().getCurrentSession();
		// try {
		// session.beginTransaction();
		//
		// // 更新訂單價格
		// session.update(orderVO);
		//
		// // 新增加訂明細
		// for (OrderXVO orderXs : orderXVOs) {
		// orderXs.setOrderVO(orderVO);
		// session.saveOrUpdate(orderXs);
		// }
		// // commit
		// session.getTransaction().commit();
		//
		// } catch (RuntimeException e) {
		// session.getTransaction().rollback();
		// throw e;
		// }

		return orderVO;
	}

	@Override
	public void update(OrderVO orderVO) {
		hibernateTemplate.saveOrUpdate(orderVO);
	}

	@Override
	public void delete(Integer order_id) {

		OrderVO orderVO = (OrderVO) hibernateTemplate.get(OrderVO.class, order_id);
		hibernateTemplate.delete(orderVO);
	}

	@Override
	public OrderVO findsByPrimaryKey(Integer order_id) {
		OrderVO orderVO = (OrderVO) hibernateTemplate.get(OrderVO.class, order_id);
		return orderVO;
	}

	@Override
	public List<OrderXVO> getOrderDetailsByPrimaryKey(Integer order_id) {

		List<OrderXVO> list = null;
		list = hibernateTemplate.find("FROM OrderXVO WHERE orderVO.order_id = ?", order_id);

		return list;
	}

	@Override
	public List<OrderVO> getUnpaidOrdersByDate(Date order_date) {
		List<OrderVO> list = null;
		list = hibernateTemplate.find("FROM OrderVO WHERE order_paytime IS NULL AND order_date=? ", order_date);
		return list;
	}

	@Override
	public List<OrderVO> getAll() {
		List<OrderVO> list = null;
		list = hibernateTemplate.find("FROM OrderVO");
		return list;
	}

	@Override
	public OrderVO findsByTableName(String order_table) {
		OrderVO orderVO = null;
		List<OrderVO> list=hibernateTemplate.find("FROM OrderVO WHERE order_table = ? order by order_id desc",order_table);
		if(list.size()!=0)
			orderVO=list.get(0);
		// Session session =
		// HibernateUtil.getSessionFactory().getCurrentSession();
		//
		// try {
		// session.beginTransaction();
		// Query query = session.createQuery("FROM OrderVO WHERE order_table = ?
		// order by order_id");
		// query.setParameter(0, order_table);
		// List<OrderVO> list = query.list();
		// if(list.size()!=0)
		// orderVO=list.get(0);
		// session.getTransaction().commit();
		// } catch (RuntimeException e) {
		// session.getTransaction().rollback();
		// throw e;
		// }
		return orderVO;
	}

	@Override
	public OrderVO getOrderDetailsByTableName(String order_table) {
		OrderVO orderVO = null;
		List<OrderVO> list = hibernateTemplate.find("FROM OrderVO WHERE order_table=? and order_paytime is null",order_table);
		if(list.size()!=0)
			orderVO=list.get(0);
		// Session session = HibernateUtil.getSessionFactory().openSession();
		// try {
		// session.beginTransaction();
		// Query query = session.createQuery("FROM OrderVO WHERE order_table=?
		// and order_paytime is null");
		// query.setParameter(0, order_table);
		// List<OrderVO> list = query.list();
		// if(list.size()!=0)
		// orderVO=list.get(0);
		// session.getTransaction().commit();
		// } catch (RuntimeException ex) {
		// session.getTransaction().rollback();
		// throw ex;
		// }
		return orderVO;
	}
	
	@Override
	public List<Object[]> getRevenueByMonth(String begin, String end) {
		List<Object[]> list=null;
		list=hibernateTemplate.find("select order_date,SUM(order_price) from OrderVO "
				+ " WHERE order_date between ? and ? group by order_date",new Object[]{Date.valueOf(begin),Date.valueOf(end)});
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("select order_date,SUM(order_price) from OrderVO WHERE order_date between ? and ? group by order_date");
//			query.setParameter(0, Date.valueOf(begin));
//			query.setParameter(1, Date.valueOf(end));
//			list = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return list;
	}

	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext("model-config-DriverManagerDataSource.xml");

		OrderDAO_interface orderDAO = (OrderDAO_interface) context.getBean("orderDAO");
//		OrderDAO orderDAO = new OrderDAO();
		OrderVO ordervo1 = new OrderVO();
		//
		ordervo1.setOrder_id(3);
		ordervo1.setOrder_table("八九桌");
		ordervo1.setOrder_price(11000);
		ordervo1.setOrder_date(new Date(System.currentTimeMillis()));
		ordervo1.setOrder_numP(5);
		MemberVO memvo = new MemberVO();
		memvo.setMember_id(10001);
		ordervo1.setMemberVO(memvo);
		EmpVO empvo = new EmpVO();
		empvo.setEmp_id(1001);
		ordervo1.setEmpVO(empvo);
		DiscountVO discvo = new DiscountVO();
		discvo.setDisc_id(2);
		ordervo1.setDiscountVO(discvo);

		// ------------insertWithXs()---------------
		// OrderXVO orderXVO1=new OrderXVO();
		// ProductVO productvo1=new ProductVO();
		// productvo1.setProduct_id(10030);
		// orderXVO1.setProductVO(productvo1);
		// orderXVO1.setOrderX_time(new Timestamp(System.currentTimeMillis()));
		// orderXVO1.setOrderX_num(5);
		// orderXVO1.setOrderX_status("YAYA");
		//
		// OrderXVO orderXVO2=new OrderXVO();
		// ProductVO productvo2=new ProductVO();
		// productvo2.setProduct_id(17240);
		// orderXVO2.setProductVO(productvo2);
		// orderXVO2.setOrderX_time(new Timestamp(System.currentTimeMillis()));
		// orderXVO2.setOrderX_num(5);
		// orderXVO2.setOrderX_status("YOYO");
		//
		// List<OrderXVO> orderXlist=new LinkedList<OrderXVO>();
		// orderXlist.add(orderXVO1);
		// orderXlist.add(orderXVO2);
		//
		// orderDAO.insertWithXs(ordervo1, orderXlist);

		// orderDAO.insert(ordervo1);
		// orderDAO.findsByPrimaryKey(2);
		//
		OrderXVO orderXVO1 = new OrderXVO();

		ProductVO productVO1 = new ProductVO();
		productVO1.setProduct_id(10290);
		orderXVO1.setProductVO(productVO1);
		orderXVO1.setOrderX_time(Timestamp.valueOf("2016-10-19 18:11:21"));
		orderXVO1.setOrderX_num(6);
		orderXVO1.setOrderX_status("出餐中YAYA1");

		OrderXVO orderXVO2 = new OrderXVO();

		ProductVO productVO2 = new ProductVO();
		productVO2.setProduct_id(10310);
		orderXVO2.setProductVO(productVO2);
		orderXVO2.setOrderX_time(Timestamp.valueOf("2016-10-19 18:11:21"));
		orderXVO2.setOrderX_num(3);
		orderXVO2.setOrderX_status("出餐中YAYA2");

		OrderXVO orderXVO3 = new OrderXVO();

		ProductVO productVO3 = new ProductVO();
		productVO3.setProduct_id(10690);
		orderXVO3.setProductVO(productVO3);
		orderXVO3.setOrderX_time(Timestamp.valueOf("2016-10-19 18:11:21"));
		orderXVO3.setOrderX_num(3);
		orderXVO3.setOrderX_status("出餐中YAYA2");

		List<OrderXVO> listXVO = new LinkedList<OrderXVO>();

		listXVO.add(orderXVO1);
		listXVO.add(orderXVO2);
		listXVO.add(orderXVO3);
		 //orderDAO.insertWithXs(ordervo1, listXVO);

		orderDAO.insertXs(ordervo1, listXVO);

		// // --------getMainCourseQuantity()------------
		// Integer MDQ = orderDAO.getDishQuantity(3,60,listXVO);
		// System.out.println(MDQ);

		// orderDAO.update(ordervo1);

		// orderDAO.updatePrice(2);

		// orderDAO.delete(4);

		// OrderVO ordervo2 = orderDAO.findsByPrimaryKey(2);
		//
		// System.out.println("---------------------------");
		// System.out.println("訂單編號(orderID):" + ordervo2.getOrder_id());
		// System.out.println("桌號(tableID):" + ordervo2.getOrder_table());
		// System.out.println("日期(date):" + ordervo2.getOrder_date());
		// System.out.println("價格(price):" + ordervo2.getOrder_price());
		// System.out.println("人數(numP):" + ordervo2.getOrder_numP());
		// System.out.println("會員(member):" + ordervo2.getMemberVO());
		// System.out.println("服務員工(employee):" + ordervo2.getEmpVO());
		// System.out.println("折扣(discount):" + ordervo2.getDiscountVO());
		// System.out.println("結帳時間(pay time):" + ordervo2.getOrder_paytime());

		//
		// List<OrderXVO> listlist = new LinkedList<OrderXVO>();
		// listlist.add(orderXVO1);
		// listlist.add(orderXVO2);
		// System.out.println(orderDAO.getMainDishQuantity(listlist));

		// -----------getOrderDetailsByPrimaryKey()--------

		// List<OrderXVO> listX = orderDAO.getOrderDetailsByPrimaryKey(2);
		//
		// for (OrderXVO orderXs : listX) {
		// System.out.println("---------------------------");
		// System.out.println("訂單編號(orderID):" +
		// orderXs.getOrderVO().getOrder_id());
		// System.out.println("商品編號(productID):" +
		// orderXs.getProductVO().getProduct_name());
		// System.out.println("商品菜色類別(productID):" +
		// orderXs.getProductVO().getProductKindVO().getKind_name());
		// System.out.println("點餐時間(time):" + orderXs.getOrderX_time());
		// System.out.println("數量(number):" + orderXs.getOrderX_num());
		// System.out.println("狀態(status):" + orderXs.getOrderX_status());
		// }

		// List<OrderVO> list = new LinkedList<OrderVO>();// orderDAO.getAll();

		// --------------getAll()--------------

		List<OrderVO> list = orderDAO.getAll();

		for (OrderVO orders : list) {
			System.out.println("---------------------------");
			System.out.println("訂單編號(orderID):" + orders.getOrder_id());
			System.out.println("桌號(tableID):" + orders.getOrder_table());
			System.out.println("日期(date):" + orders.getOrder_date());
			System.out.println("價格(price):" + orders.getOrder_price());
			System.out.println("人數(numP):" + orders.getOrder_numP());
			if (orders.getMemberVO() != null) {
				System.out.println("會員(member):" + orders.getMemberVO().getMember_name());
			} else {
				System.out.println("會員(member):無會員");
			}
			System.out.println("服務員工(employee):" + orders.getEmpVO().getEmp_name());

			if (orders.getDiscountVO() != null) {
				System.out.println("折扣(discount):" + orders.getDiscountVO().getDisc_name());
			} else {
				System.out.println("折扣(discount):無折扣");
			}

			System.out.println("結帳時間(pay time):" + orders.getOrder_paytime());
		}

	}

}
