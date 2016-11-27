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

import com.product.model.ProductService;
import com.product.model.ProductVO;

@Path("/products")
@Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
public class ProductFacade {

	ProductService productSvc = null;

	public void setProductService(ProductService productSvc) {
		this.productSvc = productSvc;
	}

	public ProductFacade() {
		productSvc = new ProductService();
		this.setProductService(productSvc);
	}

	@GET
	@Path("/{product_id}")
	@Produces({ MediaType.APPLICATION_JSON })
	public ProductVO getOneProduct(@PathParam("product_id") Integer product_id) {
		ProductVO productVO = null;
		productVO = productSvc.findByPrimaryKey(product_id);
		return productVO;
	}

	@GET
	@Path("/single/{class_id}")
	@Produces({ MediaType.APPLICATION_JSON })
	public List<ProductVO> getSingleDishesByClass(@PathParam("class_id") Integer class_id) {

		List<ProductVO> list = null;
		list = productSvc.getSingleDishesByClass(class_id);

		return list;
	}
}
