package com.spacex.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.classic.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.space.model.SpaceVO;
import com.table.model.TableVO;

public class SpaceXDAO implements SpaceXDAO_interface {

	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }
	
	@Override
	public void insert(SpaceXVO spaceXVO) {
		hibernateTemplate.save(spaceXVO);
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			session.save(spaceXVO);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}

	}

	@Override
	public void update(SpaceXVO spaceXVO, String table_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer space_id) {
		List<SpaceXVO> list = hibernateTemplate.find("from SpaceXVO where space_id=?",space_id);
		hibernateTemplate.deleteAll(list);
//		for(SpaceXVO vo : list){
//			hibernateTemplate.delete(vo);
//		}
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("delete from SpaceXVO where space_id=?");
//			query.setParameter(0, space_id);
//			int count=query.executeUpdate();
//			System.out.println("刪除了幾筆資料 : "+count);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}

	}

	@Override
	public SpaceXVO findByPrimaryKey(Integer space_id, String table_id) {

		return null;
	}

	@Override
	public List<Map<String, String>> getAll() {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<Map<String, String>> list1=new ArrayList<Map<String, String>>();
		List<SpaceXVO> listxx=null;
		listxx=hibernateTemplate.find("from SpaceXVO");
		for(SpaceXVO vo : listxx){
			Map<String,String> m1 = new HashMap<>();
			m1.put("space_id",String.valueOf(vo.getSpaceVO().getSpace_id()));
			m1.put("table_id",vo.getTable_id());
			m1.put("table_maxP",String.valueOf(vo.getTable_maxP()));
			m1.put("table_x",String.valueOf(vo.getTable_x()));
			m1.put("table_y",String.valueOf(vo.getTable_y()));
			m1.put("table_shape",vo.getTable_shape());
			list1.add(m1);
		}
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("from SpaceXVO");
//			 listxx = query.list();
//			for(SpaceXVO vo : listxx){
//				Map<String,String> m1 = new HashMap<>();
//				m1.put("space_id",String.valueOf(vo.getSpaceVO().getSpace_id()));
//				m1.put("table_id",vo.getTable_id());
//				m1.put("table_maxP",String.valueOf(vo.getTable_maxP()));
//				m1.put("table_x",String.valueOf(vo.getTable_x()));
//				m1.put("table_y",String.valueOf(vo.getTable_y()));
//				m1.put("table_shape",vo.getTable_shape());
//				list1.add(m1);
//			}
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return list1;
	}

	public static void main(String[] args) {
		SpaceXDAO sdao = new SpaceXDAO();
		
//		SpaceVO spacevo = new SpaceVO();
//		spacevo.setSpace_id(10);
//		SpaceXVO svo = new SpaceXVO();
//		svo.setSpaceVO(spacevo);
//		svo.setTable_id("yyyyyyyy");
//		svo.setTable_maxP(100);
//		svo.setTable_shape("small");
//		svo.setTable_x(900);
//		svo.setTable_y(900);
//		sdao.insert(svo);
		
//		sdao.delete(20);
		
		List<Map<String, String>> list = sdao.getAll();
		for(Map<String, String> a: list){	
			System.out.print(a.get("space_id"));
			System.out.print(a.get("table_id"));
			System.out.print(a.get("table_maxP"));
			System.out.print(a.get("table_x"));
			System.out.print(a.get("table_y"));
			System.out.println(a.get("table_shape"));
			System.out.println("--------------------------------------------------");

		}

	}

}
