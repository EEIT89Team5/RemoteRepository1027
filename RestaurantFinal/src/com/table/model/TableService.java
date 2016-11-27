package com.table.model;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.emp.model.EmpDAO_interface;

public class TableService {

	private TableDAO_interface dao;

	public TableService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config-JndiObjectFactoryBean.xml");
		dao =(TableDAO_interface) context.getBean("tableDAO");
	}

	public void addTable(Integer space_id) {
		dao.insert(space_id);
	}
	public TableVO updateTable(String table_name,Integer table_numP,String table_status,Time table_time){
		TableVO tableVO = dao.findByPrimaryKey(table_name);
		tableVO.setTable_numP(table_numP);
		tableVO.setTable_status(table_status);
		tableVO.setTable_time(table_time);
		dao.updateNumP(tableVO);
		
		return dao.findByPrimaryKey(table_name);
	}

	
//	public TableVO updateTable(String table_name,Integer table_maxP,Integer table_numP,String table_status,Timestamp table_time){
//		TableVO tableVO = dao.findByPrimaryKey(table_name);
//		tableVO.setTable_name(table_name);
//		tableVO.setTable_maxP(table_maxP);
//		tableVO.setTable_numP(table_numP);
//		tableVO.setTable_status(table_status);
//		tableVO.setTable_time(table_time);
//		dao.update(tableVO);
//		
//		return dao.findByPrimaryKey(table_name);
//	}
	
	public void deleteTable(){
		dao.delete();
	}
	
	public TableVO getOneTable(String table_name){
		return dao.findByPrimaryKey(table_name);
	}
	
	public List<TableVO> getAllTable(){
		return dao.getAll();
	}
	
	public void update(TableVO tableVO){
		dao.update(tableVO);
	}

	public List<TableVO> getAllTableReadyToOrder(){
		return dao.getAllReadyToOrder();
	}

	
}
