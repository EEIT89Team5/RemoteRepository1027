package com.space.model;

import java.util.List;

public interface SpaceDAO_interface {
	
	public void insert(SpaceVO spaceVO);
	public void update(SpaceVO spaceVO);
	public void delete(Integer space_id);
	public SpaceVO findByPrimaryKey(Integer space_id);
	public SpaceVO findBySpaceName(String space_name);
	public List<SpaceVO> getAll();
}
