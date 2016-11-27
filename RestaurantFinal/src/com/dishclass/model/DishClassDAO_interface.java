package com.dishclass.model;

import java.util.List;

public interface DishClassDAO_interface {
	public DishClassVO getOneClass(Integer class_id);
	public List<DishClassVO> getAllDishClass();
}
