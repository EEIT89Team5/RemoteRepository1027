package com.table.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.classic.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.spacex.model.SpaceXVO;

public class TableDAO implements TableDAO_interface {

//	private static final String INSERT_STMT="INSERT INTO SpaceTable (table_name,table_x,table_y,table_shape,table_maxP) "
//			+ "SELECT table_id,table_x,table_y,table_shape,table_maxP FROM SpaceX WHERE space_id=?";

	private static final String INSERT_STMT="INSERT INTO TableVO (table_name,table_x,table_y,table_shape,table_maxP) "
			+ "SELECT table_id,table_x,table_y,table_shape,table_maxP FROM SpaceXVO WHERE space_id=?";
	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }
	
	@Override
	public void insert(Integer space_id) {
		List<TableVO> tableVOAll = hibernateTemplate.find("from TableVO");
		hibernateTemplate.deleteAll(tableVOAll);
		hibernateTemplate.bulkUpdate(INSERT_STMT, space_id);
//		hibernateTemplate.findByNamedQuery(INSERT_STMT,space_id);
//		List<SpaceXVO> list = hibernateTemplate.find("from SpaceXVO where space_id=?",space_id);
//		for(SpaceXVO vo : list){
//			
//		}
		
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query queryDel = session.createQuery("delete from TableVO");
//			queryDel.executeUpdate();
//			Query queryIn = session.createSQLQuery(INSERT_STMT);
//			queryIn.setParameter(0, space_id);
//			int oo = queryIn.executeUpdate();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
	}

	@Override
	public void updateNumP(TableVO tablevo) {
		hibernateTemplate.update(tablevo);
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			TableVO tableVO = (TableVO)session.get(TableVO.class,tablevo.getTable_name());
//			tableVO.setTable_numP(tablevo.getTable_numP());
//			tableVO.setTable_status(tablevo.getTable_status());
//			tableVO.setTable_time(tablevo.getTable_time());
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}

	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
	}

	@Override
	public TableVO findByPrimaryKey(String table_name) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		TableVO tableVO=null;
		tableVO=hibernateTemplate.get(TableVO.class,table_name);
//		try {
//			session.beginTransaction();
//			tableVO = (TableVO)session.get(TableVO.class,table_name);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return tableVO;
	}

	@Override
	public List<TableVO> getAll() {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<TableVO> list = null;
		list=hibernateTemplate.find("from TableVO");
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("from TableVO");
//			list = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return list;
	}
	
	
	
	@Override
	public void update(TableVO tableVO) {
		hibernateTemplate.saveOrUpdate(tableVO);
	}
	
	@Override
	public List<TableVO> getAllReadyToOrder() {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<TableVO> list = null;
		list=hibernateTemplate.find("from TableVO where table_status='未點餐'");
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("from TableVO where table_status='未點餐'");
//			list = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return list;
	}

	public static void main(String[] args) {
//		TableDAO dao = new TableDAO();
//		dao.insert(10);
//		TableVO tablevo = dao.findByPrimaryKey("07桌");
//		System.out.println(tablevo.getTable_name());
//		System.out.println(tablevo.getTable_maxP());
//		System.out.println(tablevo.getTable_x());
//		System.out.println(tablevo.getTable_y());
//		System.out.println(tablevo.getTable_shape());
//		System.out.println(tablevo.getTable_status());
//		tablevo.setTable_numP(100);
//		tablevo.setTable_status("菜上齊");
//		dao.update(tablevo);
		
//		List<TableVO> list = dao.getAll();
//		for(TableVO tablevo: list){
//			System.out.print(tablevo.getTable_name()+" , ");
//			System.out.print(tablevo.getTable_maxP()+" , ");
//			System.out.print(tablevo.getTable_x()+" , ");
//			System.out.print(tablevo.getTable_y()+" , ");
//			System.out.print(tablevo.getTable_shape()+" , ");
//			System.out.println(tablevo.getTable_status());
//		}
		
	}

}
