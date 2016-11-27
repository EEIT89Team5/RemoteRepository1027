package com.reserve.model;

import java.sql.Timestamp;
import java.util.List;

public interface ReserveDAO_interface {
	
	public void insert(ReserveVO reserveVO);
	public void update(ReserveVO reserveVO);
	public void delete(Timestamp res_time,String res_phone);
	public ReserveVO findByPrimaryKey(Timestamp res_time,String res_phone);
	public List<ReserveVO> findByDate(String res_time);
	public List<ReserveVO> findByMonth(String res_time);
	public List<ReserveVO> getAll();
	
}
