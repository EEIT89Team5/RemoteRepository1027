package com.product.model;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.dishclass.model.DishClassVO;
import com.packageformat.model.PackageFormatVO;

public interface ProductDAO_interface {
	
	
	public ProductVO findByPrimaryKey(Integer product_id);
	//單點
	//	全部菜色
	public List<ProductVO> getAllSingleDishes();
	//	分類別菜色
	public List<ProductVO> getSingleDishesByClass(Integer class_id);

	//套餐
	//	套餐
	public List<ProductVO> getAllPackages();
	//	套餐類別

	public List<ProductVO> getDishesByOnePackage(Integer product_pcg);
	//	套餐類別菜色
	public List<ProductVO> getDishesByPackageAndClass(Integer pcg_id,Integer class_id);

	//查詢套餐菜色的類別
	public List<PackageFormatVO> getDishClassByPackage(Integer pcg_id);
			
	//全部商品
	public List<ProductVO> getAllProducts();
	

	//======================================================================================
	public ProductVO insertSinglePro (ProductVO productVO);
	public ProductVO insertPack (ProductVO productVO);
	public ProductVO insertPackPro (ProductVO productVO);
	public ProductVO update (ProductVO productVO);
	public ProductVO proimgup (ProductVO productVO);
	public Integer SelectMAXPack(Integer product_kind);
	public PackageFormatVO AddClassNum(PackageFormatVO packageFormatVO);
	public PackageFormatVO UPclassNumber(PackageFormatVO packageFormatVO);
	public List<ProductVO> SelectPack(Integer product_kind);
	public List<ProductVO> selectPackPro (ProductVO productVO);
	public List<ProductVO> getOneClass (Integer product_class,Integer inMenu);
	public List<ProductVO> getOneSingleClass (Integer product_class,Integer product_price);
	public List<ProductVO> getClass (Integer product_pcg);
	public List<ProductVO> getAll();
	public List<ProductVO> getSingle();
	public ProductVO UpdatePackPro(ProductVO productVO);
	public List<PackageFormatVO> getFormat(Integer product_id);
	public void delete (Integer product_id);
	
	//------------------eating的
	
	public List<Object> getProductByPackage(String pcgName);
	
	public List<ProductVO> getProductByClass(Integer class_id);
	
}
