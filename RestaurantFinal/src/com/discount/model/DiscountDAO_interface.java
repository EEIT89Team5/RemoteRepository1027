package com.discount.model;

import java.util.List;


public interface DiscountDAO_interface {
	 public void insert(DiscountVO discountVO);
     public void update(DiscountVO discountVO);
     public void delete(Integer disc_id);
     public DiscountVO findByPrimaryKey(Integer disc_id);
     public List<DiscountVO> getAll();
}
