package com.discount.model;

import java.util.List;
import org.hibernate.*;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class DiscountDAO implements DiscountDAO_interface{

	private static final String GET_ALL_STMT = "from DiscountVO";
	
	
	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }
	
	@Override
	public void insert(DiscountVO discountVO) {	
		hibernateTemplate.saveOrUpdate(discountVO);
	}

	@Override
	public void update(DiscountVO discountVO) {
		hibernateTemplate.saveOrUpdate(discountVO);
	}

	@Override
	public void delete(Integer disc_id) {
		DiscountVO discountVO =(DiscountVO) hibernateTemplate.get(DiscountVO.class, disc_id);
		hibernateTemplate.delete(discountVO);
	}

	@Override
	public DiscountVO findByPrimaryKey(Integer disc_id) {
		DiscountVO discountVO =(DiscountVO) hibernateTemplate.get(DiscountVO.class, disc_id);
		return discountVO;
	}

	@Override
	public List<DiscountVO> getAll() {
		List<DiscountVO> list = null;
		list=hibernateTemplate.find(GET_ALL_STMT);
		return list;
	}
	
	public static void main(String[] args) {

		DiscountDAO dao = new DiscountDAO();
		List<DiscountVO> list = dao.getAll();
		for (DiscountVO aEmp : list) {
			System.out.print(aEmp.getDisc_id() + ",");
			System.out.print(aEmp.getDisc_name() + ",");
			System.out.print(aEmp.getDisc_value() + ",");
		
		}
	}
}
