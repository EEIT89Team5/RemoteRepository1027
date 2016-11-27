package com.table.model;

import java.util.List;

public interface TableDAO_interface {
	
	public void insert(Integer space_id);
	public void updateNumP(TableVO tableVO);
	public void delete();
	public TableVO findByPrimaryKey(String table_name);
	public List<TableVO> getAll();
	
	public void update(TableVO tableVO);
	
	public List<TableVO> getAllReadyToOrder();

}
