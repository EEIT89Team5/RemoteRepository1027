package com.space.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import com.spacex.model.SpaceXVO;

@XmlRootElement
public class SpaceVO implements Serializable {
	private int space_id;
	private String space_name;
	private String space_size;
	private Set<SpaceXVO> spacexs = new HashSet<SpaceXVO>();
	
	@XmlTransient
	public Set<SpaceXVO> getSpacexs() {
		return spacexs;
	}
	public void setSpacexs(Set<SpaceXVO> spacexs) {
		this.spacexs = spacexs;
	}
	public int getSpace_id() {
		return space_id;
	}
	public void setSpace_id(int space_id) {
		this.space_id = space_id;
	}
	public String getSpace_name() {
		return space_name;
	}
	public void setSpace_name(String space_name) {
		this.space_name = space_name;
	}
	public String getSpace_size() {
		return space_size;
	}
	public void setSpace_size(String space_size) {
		this.space_size = space_size;
	}
	
	
}
