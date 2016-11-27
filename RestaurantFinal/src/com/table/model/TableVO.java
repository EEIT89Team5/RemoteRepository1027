package com.table.model;

import java.io.Serializable;
import java.sql.Time;
import java.sql.Timestamp;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class TableVO implements Serializable {
	private String table_name;
	private double table_x;
	private double table_y;
	private String table_shape;
	private int table_maxP;
	private int table_numP;
	private String table_status;
	private Time table_time;
	private String table_paid;

	public String getTable_name() {
		return table_name;
	}

	public void setTable_name(String table_name) {
		this.table_name = table_name;
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

	public int getTable_maxP() {
		return table_maxP;
	}

	public void setTable_maxP(int table_maxP) {
		this.table_maxP = table_maxP;
	}

	public int getTable_numP() {
		return table_numP;
	}

	public void setTable_numP(int table_numP) {
		this.table_numP = table_numP;
	}

	public String getTable_status() {
		return table_status;
	}

	public void setTable_status(String table_status) {
		this.table_status = table_status;
	}

	public Time getTable_time() {
		return table_time;
	}

	public void setTable_time(Time table_time) {
		this.table_time = table_time;
	}

	public String getTable_paid() {
		return table_paid;
	}

	public void setTable_paid(String table_paid) {
		this.table_paid = table_paid;
	}

}
