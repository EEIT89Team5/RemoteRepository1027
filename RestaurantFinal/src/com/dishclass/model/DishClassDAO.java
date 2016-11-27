package com.dishclass.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;


public class DishClassDAO implements DishClassDAO_interface {
	
	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }
	
	@Override
	public DishClassVO getOneClass(Integer class_id) {
		
		DishClassVO dishClassVO = (DishClassVO)hibernateTemplate.get(DishClassVO.class, class_id);
		return dishClassVO;
	}
	
	@Override
	public List<DishClassVO> getAllDishClass() {
		List<DishClassVO> dishClassVOs=null;
		dishClassVOs=hibernateTemplate.find("FROM DishClassVO ORDER BY class_id");
		return dishClassVOs;

	}
		
	public static void main(String[] args) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config-DriverManagerDataSource.xml");
		
		DishClassDAO_interface dao=(DishClassDAO_interface) context.getBean("dishclassDAO");
//		DishClassDAO dao=new DishClassDAO();
		
		DishClassVO classVO=dao.getOneClass(30);
		
		System.out.println(classVO.getClass_id());
		System.out.println(classVO.getClass_name());
		
		List<DishClassVO> list=dao.getAllDishClass();
		
		for(DishClassVO VOs :list){
			System.out.println(VOs.getClass_id());
			System.out.println(VOs.getClass_name());
		}

	}

}
