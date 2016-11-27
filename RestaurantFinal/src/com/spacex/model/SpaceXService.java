package com.spacex.model;

import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.emp.model.EmpDAO_interface;
import com.space.model.SpaceVO;

public class SpaceXService {

	private SpaceXDAO_interface dao;
	
	public SpaceXService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config-JndiObjectFactoryBean.xml");
		dao =(SpaceXDAO_interface) context.getBean("spacexDAO");
	}

	public void insert(Integer space_id,String table_id,Integer table_maxP,Double table_x,
						Double table_y,String table_shape){
		SpaceVO spaceVO = new SpaceVO();
		spaceVO.setSpace_id(space_id);
		SpaceXVO spaceXVO = new SpaceXVO();
		spaceXVO.setSpaceVO(spaceVO);
		spaceXVO.setTable_id(table_id);
		spaceXVO.setTable_maxP(table_maxP);
		spaceXVO.setTable_x(table_x);
		spaceXVO.setTable_y(table_y);
		spaceXVO.setTable_shape(table_shape);
		dao.insert(spaceXVO);
	}
	
	public void delete(Integer space_id) {
		dao.delete(space_id);
	}
	
//	public List<SpaceXVO> getAll() {
//		return dao.getAll();
//	}
	public List<Map<String,String>> getAll(){
		return dao.getAll();
	}
}
