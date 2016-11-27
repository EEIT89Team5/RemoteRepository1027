package com.space.model;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.classic.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.spacex.model.SpaceXVO;


public class SpaceDAO implements SpaceDAO_interface {

	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }
	@Override
	public void insert(SpaceVO spaceVO) {
		hibernateTemplate.save(spaceVO);
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			session.save(spaceVO);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}

	}

	@Override
	public void update(SpaceVO spaceVO) {

	}

	@Override
	public void delete(Integer space_id) {
		SpaceVO spacevo = hibernateTemplate.get(SpaceVO.class, space_id);
		hibernateTemplate.delete(spacevo);
		
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			SpaceVO spacevo = (SpaceVO)session.get(SpaceVO.class,space_id);
//			session.delete(spacevo);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}

	}

	@Override
	public SpaceVO findByPrimaryKey(Integer space_id) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		SpaceVO spaceVO=null;
		spaceVO=hibernateTemplate.get(SpaceVO.class, space_id);
//		try {
//			session.beginTransaction();
//			spaceVO = (SpaceVO)session.get(SpaceVO.class, space_id);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return spaceVO;
	}

	@Override
	public SpaceVO findBySpaceName(String space_name) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		SpaceVO spacevo=null;
		List<SpaceVO> vo= hibernateTemplate.find("from SpaceVO where space_name=?",space_name);
		if(vo.size()!=0)
			spacevo=vo.get(0);
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("from SpaceVO where space_name=?");
//			query.setParameter(0, space_name);
//			List<SpaceVO> vo = query.list();
//			if(vo.size()!=0)
//				spacevo=vo.get(0);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return spacevo;
	}

	@Override
	public List<SpaceVO> getAll() {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<SpaceVO> list = null;
		list=hibernateTemplate.find("from SpaceVO");
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("from SpaceVO");
//			list=query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return list;
	}

	public static void main(String[] args) {
		SpaceDAO sdao = new SpaceDAO();
		
//		SpaceVO spacevo = new SpaceVO();
//		spacevo.setSpace_name("疊疊溪");
//		spacevo.setSpace_size("大型");
//		sdao.insert(spacevo);
		
//		SpaceVO dd = sdao.findByPrimaryKey(20);
//		System.out.println(dd.getSpace_id());
//		System.out.println(dd.getSpace_name());
//		System.out.println(dd.getSpace_size());
//		Set<SpaceXVO> set = dd.getSpacexs();
//		for(SpaceXVO ww : set){
//			System.out.println(ww.getTable_id());
//			System.out.println(ww.getTable_maxP());
//			System.out.println(ww.getTable_shape());
//			System.out.println(ww.getTable_x());
//			System.out.println(ww.getTable_y());
//			System.out.println("--------------------------");
//		}

//		List<SpaceVO> listx = sdao.getAll();
//		for(SpaceVO yy : listx){
//			System.out.println(yy.getSpace_id());
//			System.out.println(yy.getSpace_name());
//			System.out.println(yy.getSpace_size());
//			System.out.println("-------------------------------");
//		}
//		sdao.delete(10);
		
		sdao.findBySpaceName("疊疊溪00");
//		System.out.println(oo.getSpace_name());
//		System.out.println(oo.getSpace_id());
//		System.out.println(oo.getSpace_size());
		
	}

}
