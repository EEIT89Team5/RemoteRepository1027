package com.rest89.facade;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.table.model.TableService;
import com.table.model.TableVO;

@Path("/tables")
@Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
public class TableFacade {

	TableService tableSvc = null;

	public void setTableService(TableService tableSvc) {
		this.tableSvc = tableSvc;
	}

	public TableFacade() {
		tableSvc = new TableService();
		this.setTableService(tableSvc);
	}

	@GET
	@Path("/{table_name}")
	@Produces({ MediaType.APPLICATION_JSON })
	public TableVO getOneTable(@PathParam("table_name") String table_name) {
		TableVO tableVO=null;
		System.out.println(table_name);
		tableVO = tableSvc.getOneTable(table_name);
		System.out.println(tableVO);
		return tableVO;
	}

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public List<TableVO> getTableReadyToOrder() {

		List<TableVO> list = null;
		list = tableSvc.getAllTableReadyToOrder();

		return list;
	}
}
