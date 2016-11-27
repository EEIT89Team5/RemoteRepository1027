package com.schedule.model;

import java.sql.Date;
import java.util.List;


public interface ScheduleDAO_interface {
	 public void insert(ScheduleVO scheduleVO);
     public void update(ScheduleVO scheduleVO);
     public void delete(String sched_class,Date date);
     public List<ScheduleVO> getAll(String date);
     public List<ScheduleVO> getOnes(String date,Integer emp_id);
}
