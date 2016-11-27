package com.orderx.model;


import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;


import com.product.model.ProductVO;

public class OrderXDAO implements OrderXDAO_interface {

	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void insert(OrderXVO orderXVO) {
		hibernateTemplate.saveOrUpdate(orderXVO);

	}

	@Override
	public void delete(Integer order_id, Integer product_id) {

		hibernateTemplate.update("DELETE FROM OrderXVO WHERE order_id=? AND product_id=?",
				new Object[] { order_id, product_id });
		// Session session =
		// HibernateUtil.getSessionFactory().getCurrentSession();
		// try {
		// session.beginTransaction();
		// Query query = session.createQuery("DELETE FROM OrderXVO WHERE
		// order_id=? AND product_id=?");
		// query.setInteger(0, order_id);
		// query.setInteger(1, product_id);
		// query.executeUpdate();
		// session.getTransaction().commit();
		// } catch (RuntimeException ex) {
		// session.getTransaction().rollback();
		// throw ex;
		// }
	}

	@Override
	public List<OrderXVO> findByProductName(String product_name) {

		return null;
	}

	@Override
	public List<OrderXVO> getAll() {
		List<OrderXVO> list = null;

		list = hibernateTemplate.find("FROM OrderXVO");

		return list;

	}

	@Override
	public Integer getDishQuantity(Integer kind_id, Integer class_id, List<OrderXVO> list) {

		Integer MDQ = 0;
		List<Long> listRS = null;

		for (OrderXVO orderXs : list) {

			listRS = hibernateTemplate.find(
					"SELECT COUNT(*) FROM ProductVO WHERE product_kind=? AND product_class=? AND product_id=?",
					new Object[] { kind_id, class_id, orderXs.getProductVO().getProduct_id() });
			for (Long rs : listRS) {
				if (rs.intValue() == 1) {
					MDQ = MDQ + orderXs.getOrderX_num();
				}
			}
		}

		return MDQ;

	}

	@Override
	public Integer getPackageQuantity(List<OrderXVO> list) {
		Integer PCGQ = 0;
		List<Long> listRS = null;

		for (OrderXVO orderXs : list) {
			listRS = hibernateTemplate.find("SELECT COUNT(*) FROM ProductVO WHERE product_kind=2 AND product_id=?",
					orderXs.getProductVO().getProduct_id());
			for (Long rs : listRS) {
				if (rs.intValue() == 1) {
					PCGQ = PCGQ + orderXs.getOrderX_num();
				}
			}
		}

		return PCGQ;
	}

	@Override
	public Integer getTotalPrice(List<OrderXVO> list) {
		Integer totalP = 0;
		ProductVO productVO = new ProductVO();
		List<Long> listRS = null;

		for (OrderXVO orderXs : list) {
			productVO = hibernateTemplate.get(ProductVO.class, orderXs.getProductVO().getProduct_id());
			totalP = totalP + (productVO.getProduct_price()) * (orderXs.getOrderX_num());
		}

		return totalP;
	}

	public static void main(String args[]) {

		ApplicationContext context = new ClassPathXmlApplicationContext("model-config-DriverManagerDataSource.xml");
		OrderXDAO_interface dao = (OrderXDAO_interface) context.getBean("orderxDAO");
		
	
//		java.sql.Date d=new java.sql.Date(System.currentTimeMillis());
		java.sql.Date d2=java.sql.Date.valueOf("2016-10-10");
	
		    List<OrderXVO> list = dao.getAll(d2);
		    
		for (OrderXVO orderXVOs : list) {
			System.out.println(orderXVOs);
			System.out.println("orderXVOs.getOrderVO()="+orderXVOs.getOrderVO());
			System.out.println("orderXVOs.getOrderVO().getOrder_id()="+orderXVOs.getOrderVO().getOrder_id() );
//			System.out.println("order_id" + orderXVOs.getOrderVO().getOrder_id());
//			System.out.println("product_id" + orderXVOs.getProductVO().getProduct_id());
//			System.out.println("orderX_time" + orderXVOs.getOrderX_time());
//			System.out.println("orderX_num" + orderXVOs.getOrderX_num());
//			System.out.println("orderX_status" + orderXVOs.getOrderX_status());
		}
		
	}

	// ===============================================
	@Override
	public void update(OrderXVO orderXVO) {
		hibernateTemplate.saveOrUpdate(orderXVO);
		// Session session =
		// HibernateUtil.getSessionFactory().getCurrentSession();
		// try {
		// session.beginTransaction();
		//// Query query=session.createQuery("from OrderXVO where order_id=? and
		// product_id=? and orderX_time=?");
		// session.saveOrUpdate(orderXVO);
		// session.getTransaction().commit();
		//
		// } catch (RuntimeException ex) {
		// session.getTransaction().rollback();
		// throw ex;
		// }
	}

	@Override
	public List<OrderXVO> getAll(Date d2) {
		List<OrderXVO> list = null;
		list = hibernateTemplate.find("FROM OrderXVO where orderVO.order_date =? and productVO.productKindVO.kind_id !=2   order by orderVO.order_id,productVO.dishClassVO.class_id",d2);
		
		// Session session =
		// HibernateUtil.getSessionFactory().getCurrentSession();
		// try {
		// session.beginTransaction();
		// Query query = session.createQuery(GET_ALL_STMT);
		// query.setParameter(0,d2);
		// list = query.list();
		// session.getTransaction().commit();
		// } catch (RuntimeException ex) {
		// session.getTransaction().rollback();
		// throw ex;
		// }
		return list;
	}

	@Override
	public Integer FINISHNUM(OrderXVO orderXVO) {
		List<Integer> list = null;
		List<Long> list2 = null;
		Integer num2 = null;
		list2 = hibernateTemplate.find(" select count(*) from OrderXVO where orderVO.order_id=? and orderX_status=?",
				new Object[]{orderXVO.getOrderVO().getOrder_id(),orderXVO.getOrderX_status()}
				);
		num2=list2.get(0).intValue();
//		System.out.println("num2="+num2);
//		for(Integer a:list2){
//			num2=a;
//		}

		
		// Session session =
		// HibernateUtil.getSessionFactory().getCurrentSession();
		// try {
		// session.beginTransaction();
		//// =====可查到狀態筆數========================================================
		// Query query2 = session.createSQLQuery(FINISHNUM);
		// query2.setParameter(0,orderXVO.getOrderVO().getOrder_id());
		// query2.setParameter(1,"出餐完成");
		// list2 = query2.list();
		// num2=list2.get(0);
		// session.getTransaction().commit();
		// } catch (RuntimeException ex) {
		// session.getTransaction().rollback();
		// throw ex;
		// }
		return num2;
	}

	@Override
	public Integer IDMAX(OrderXVO orderXVO) {
		List<Integer> list = null;
		List<Long> list2 = null;
		Integer num = null;
		list2 = hibernateTemplate.find("select count(orderX_status) from OrderXVO where orderVO.order_id=? and productVO.dishClassVO.class_id !=2  ",
				orderXVO.getOrderVO().getOrder_id()
				);
		num=list2.get(0).intValue();
//		System.out.println("num="+num);

		// Session session =
		// HibernateUtil.getSessionFactory().getCurrentSession();
		// try {
		// session.beginTransaction();
		//// =====可查到狀態筆數========================================================
		// Query query = session.createSQLQuery(IDMAX);
		// query.setParameter(0,orderXVO.getOrderVO().getOrder_id());
		// list2 = query.list();
		// num=list2.get(0);
		// session.getTransaction().commit();
		// } catch (RuntimeException ex) {
		// session.getTransaction().rollback();
		// throw ex;
		// }
		return num;
	}
	 private static final String PCG_CHART="select productVO.product_name,SUM(orderX_num) from OrderXVO  "
	+ " WHERE orderVO.order_date between ? And ? "
	+ "and productVO.productKindVO.kind_id=2 group by productVO.product_name";

	@Override
	 public List<Object[]> getPcgAmountByMonth(String begin, String end) {
		 List<Object[]> list=null;
		 list=hibernateTemplate.find(PCG_CHART,new Object[]{java.sql.Date.valueOf(begin),java.sql.Date.valueOf(end)});
//			Session session = HibernateUtil.getSessionFactory().openSession();
//			try {
//				session.beginTransaction();
//				Query query = session.createQuery(PCG_CHART);
//				query.setParameter(0, java.sql.Date.valueOf(begin));
//				query.setParameter(1, java.sql.Date.valueOf(end));
//				list = query.list();
////				System.out.println(list.size());
//				session.getTransaction().commit();
//			} catch (RuntimeException ex) {
//				session.getTransaction().rollback();
//				throw ex;
//			}
			return list;
	 }
	 	 
	 private static final String EACH_PCG_CHART="select productVO.product_name,SUM(orderX_num) from OrderXVO "
	+ " where orderVO.order_date between ? and ? AND productVO.pcgVO.product_name=? "
	+ " group by productVO.product_id,productVO.product_name";

	@Override
	 public List<Object[]> getEachPcgByMonth(String begin, String end , String pcgName) {
		 List<Object[]> list=null;
		 list=hibernateTemplate.find(EACH_PCG_CHART,new Object[]{java.sql.Date.valueOf(begin),java.sql.Date.valueOf(end),pcgName});
//			Session session = HibernateUtil.getSessionFactory().openSession();
//			try {
//				session.beginTransaction();
//				Query query = session.createQuery(EACH_PCG_CHART);
//				query.setParameter(0, java.sql.Date.valueOf(begin));
//				query.setParameter(1, java.sql.Date.valueOf(end));
//				query.setParameter(2, pcgName);
//				list = query.list();
////				System.out.println(list.size());
//				session.getTransaction().commit();
//			} catch (RuntimeException ex) {
//				session.getTransaction().rollback();
//				throw ex;
//			}
			return list;
	 }
	 
	 String DISHES_CHART="select productVO.product_name,SUM(orderX_num) from OrderXVO "
	 		+ " where orderVO.order_date between ? and ? And productVO.productKindVO.kind_id!=2 "
	 		+ " and productVO.dishClassVO.class_id=? group by productVO.product_name";

	@Override
	public List<Object[]> getDishesAmount(String beginDate, String endDate, Integer class_id) {
		List<Object[]> list=null;
		list=hibernateTemplate.find(DISHES_CHART,new Object[]{java.sql.Date.valueOf(beginDate),java.sql.Date.valueOf(endDate),class_id});
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery(DISHES_CHART);
//			query.setParameter(0, java.sql.Date.valueOf(beginDate));
//			query.setParameter(1, java.sql.Date.valueOf(endDate));
//			query.setParameter(2, class_id);
//			list = query.list();
////			System.out.println(list.size());
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return list;
	}
	
	String EACH_DISHES_CHART="select pp.product_id,pp.product_name,SUM(oo.orderX_num) from OrderXVO oo "
			+ " left join oo.productVO.pcgVO pp "
			+ " where oo.orderVO.order_date between ? and ? and oo.productVO.product_name=? "
			+ " group by pp.product_id,pp.product_name";
	
	@Override
	public List<Object[]> getEachDishes(String beginDate, String endDate, String dishesName) {
		List<Object[]> list=null;
		list=hibernateTemplate.find(EACH_DISHES_CHART,new Object[]{java.sql.Date.valueOf(beginDate),java.sql.Date.valueOf(endDate),dishesName});
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createSQLQuery(EACH_DISHES_CHART);
//			query.setParameter(0, java.sql.Date.valueOf(beginDate));
//			query.setParameter(1, java.sql.Date.valueOf(endDate));
//			query.setParameter(2, dishesName);
//			list = query.list();;
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return list;
	}

	// ===============================================
}
