package com.reserve.model;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.classic.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;


public class ReserveDAO implements ReserveDAO_interface {

	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }
	
	@Override
	public void insert(ReserveVO reserveVO) {
		hibernateTemplate.save(reserveVO);
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			session.save(reserveVO);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}

	}

	@Override
	public void update(ReserveVO reserveVO) {
		hibernateTemplate.update(reserveVO);
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			session.update(reserveVO);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}

	}

	@Override
	public void delete(Timestamp res_time, String res_phone) {
//		List<ReserveVO> listReserveVO = hibernateTemplate.find("delete from ReserveVO where res_time=? and res_phone=?",new Object[]{res_time,res_phone});
		hibernateTemplate.bulkUpdate("delete from ReserveVO where res_time=? and res_phone=?",new Object[]{res_time,res_phone});
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("delete from ReserveVO where res_time=? and res_phone=?");
//			query.setParameter(0, res_time);
//			query.setParameter(1, res_phone);
//			query.executeUpdate();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}

	}

	@Override
	public ReserveVO findByPrimaryKey(Timestamp res_time, String res_phone) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		ReserveVO reserveVO = null;
		List<ReserveVO> listOne = hibernateTemplate.find("from ReserveVO where res_time=? and res_phone=?",new Object[]{res_time,res_phone});
		if(listOne.size()!=0)
			reserveVO = listOne.get(0);
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("from ReserveVO where res_time=? and res_phone=?");
//			query.setParameter(0, res_time);
//			query.setParameter(1, res_phone);
//			List<ReserveVO> listOne = query.list();
//			if(listOne.size()!=0)
//				reserveVO = listOne.get(0);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return reserveVO;
	}

	@Override
	public List<ReserveVO> findByMonth(String res_time) {
		Timestamp after = null;
		String m = res_time.substring(5,7);
		Timestamp before = Timestamp.valueOf(res_time + "-01 00:00:00");
		if("01".equals(m) || "03".equals(m) || "05".equals(m) || "07".equals(m) || "08".equals(m) || "10".equals(m) || "12".equals(m)){
			after = Timestamp.valueOf(res_time + "-31 23:59:59");
		}else{
			after = Timestamp.valueOf(res_time + "-30 23:59:59");
		}
		List<ReserveVO> list = null;
		list=hibernateTemplate.find("from ReserveVO where res_time > ? and res_time < ?",new Object[]{before,after});
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("from ReserveVO where res_time > ? and res_time < ?");
//			query.setParameter(0, before);
//			query.setParameter(1, after);
//			list = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return list;
	}

	@Override
	public List<ReserveVO> findByDate(String res_time) {
		List<ReserveVO> list = null;
		Timestamp before = Timestamp.valueOf(res_time + " 00:00:00");
		Timestamp after = Timestamp.valueOf(res_time + " 23:59:59");
		list=hibernateTemplate.find("from ReserveVO where res_time > ? and res_time < ?",new Object[]{before,after});
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("from ReserveVO where res_time > ? and res_time < ?");
//			query.setParameter(0, before);
//			query.setParameter(1, after);
//			list = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return list;
	}

	@Override
	public List<ReserveVO> getAll() {
		List<ReserveVO> list = null;
		list=hibernateTemplate.find("from ReserveVO");
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("from ReserveVO");
//			list = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return list;
	}

	public static void main(String[] args) {
		ReserveDAO dao = new ReserveDAO();
		// ReserveVO reserveVO = new ReserveVO();
		// Timestamp time = new Timestamp(System.currentTimeMillis());
		// reserveVO.setRes_time(time);
		// reserveVO.setRes_phone("0911222333");
		// reserveVO.setRes_name("許");
		// reserveVO.setRes_gender("先生");
		// reserveVO.setRes_numP(50);
		// dao.insert(reserveVO);

		// Timestamp res_time = Timestamp.valueOf("2016-10-28 16:01:46.827");
		// dao.delete(res_time, "0911222333");

		List<ReserveVO> list = dao.findByDate("2016-10-28");
		for (ReserveVO vo : list) {
			System.out.print(vo.getRes_time() + " , ");
			System.out.print(vo.getRes_phone() + " , ");
			System.out.print(vo.getRes_name() + " , ");
			System.out.print(vo.getRes_gender() + " , ");
			System.out.print(vo.getRes_numP() + " , ");
			System.out.println(vo.getRes_remark());
			System.out.println("----------------------------------");
		}

	}

}
