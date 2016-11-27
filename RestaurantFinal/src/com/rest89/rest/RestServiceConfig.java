package com.rest89.rest;

import javax.ws.rs.ApplicationPath;

import org.glassfish.jersey.server.ResourceConfig;

@ApplicationPath("/services")
public class RestServiceConfig extends ResourceConfig {
	
	public RestServiceConfig(){
		this.packages("com.rest89.rest","com.rest89.facade");
	}
}
