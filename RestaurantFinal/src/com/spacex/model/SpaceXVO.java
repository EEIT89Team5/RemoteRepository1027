package com.spacex.model;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

import com.space.model.SpaceVO;

@XmlRootElement
public class SpaceXVO implements Serializable {
//	private int space_id;
	private SpaceVO spaceVO;
	
	private String table_id;
	private int table_maxP;
	private double table_x;
	private double table_y;
	private String table_shape;
	
	
//	public int getSpace_id() {
//		return space_id;
//	}
//	public void setSpace_id(int space_id) {
//		this.space_id = space_id;
//	}
	public SpaceVO getSpaceVO() {
		return spaceVO;
	}
	public void setSpaceVO(SpaceVO spaceVO) {
		this.spaceVO = spaceVO;
	}
	
	public String getTable_id() {
		return table_id;
	}
	public void setTable_id(String table_id) {
		this.table_id = table_id;
	}
	public int getTable_maxP() {
		return table_maxP;
	}
	public void setTable_maxP(int table_maxP) {
		this.table_maxP = table_maxP;
	}
	public double getTable_x() {
		return table_x;
	}
	public void setTable_x(double table_x) {
		this.table_x = table_x;
	}
	public double getTable_y() {
		return table_y;
	}
	public void setTable_y(double table_y) {
		this.table_y = table_y;
	}
	public String getTable_shape() {
		return table_shape;
	}
	public void setTable_shape(String table_shape) {
		this.table_shape = table_shape;
	}
	
}
