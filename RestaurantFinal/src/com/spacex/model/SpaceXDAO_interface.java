package com.spacex.model;

import java.util.List;
import java.util.Map;

import com.space.model.SpaceVO;

public interface SpaceXDAO_interface {
	public void insert(SpaceXVO spaceXVO);
	public void update(SpaceXVO spaceXVO,String table_id);
	public void delete(Integer space_id);
	public SpaceXVO findByPrimaryKey(Integer space_id,String table_id);
//	public List<SpaceXVO> getAll();
	public List<Map<String, String>> getAll();
}
