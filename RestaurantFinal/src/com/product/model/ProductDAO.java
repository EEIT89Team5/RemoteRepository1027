package com.product.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.classic.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.dishclass.model.DishClassVO;
import com.packageformat.model.PackageFormatVO;
import com.productkind.model.ProductKindVO;



public class ProductDAO implements ProductDAO_interface {
	
	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }
	
	@Override
	public ProductVO findByPrimaryKey(Integer product_id) {
		ProductVO productVO=null;
		productVO=hibernateTemplate.get(ProductVO.class, product_id);
		
		return productVO;
	}
	
	@Override
	public List<PackageFormatVO> getFormat(Integer product_id){
		
		List<PackageFormatVO> productVOs = new LinkedList<PackageFormatVO>();

		productVOs=hibernateTemplate.find("FROM PackageFormatVO WHERE pcg_id=?", product_id);
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("FROM PackageFormatVO WHERE pcg_id=?");
//			query.setParameter(0, product_id);
//			productVOs = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException e) {
//			session.getTransaction().rollback();
//			throw e;
//		}
		return productVOs;
	}
	
	
	@Override
	public List<ProductVO> getAllSingleDishes() {
		List<ProductVO> productVOs = new LinkedList<ProductVO>();

		productVOs=hibernateTemplate.find("FROM ProductVO WHERE product_kind=1 ");
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("FROM ProductVO WHERE product_kind=1 ");
//			productVOs = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException e) {
//			session.getTransaction().rollback();
//			throw e;
//		}
		return productVOs;
	}

	@Override
	public List<ProductVO> getSingleDishesByClass(Integer class_id) {
		List<ProductVO> productVOs = new LinkedList<ProductVO>();

		productVOs=hibernateTemplate.find("FROM ProductVO WHERE product_kind=1 AND inMenu=1 AND product_class=?", class_id);
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("FROM ProductVO WHERE product_kind=1 AND inMenu=1 AND product_class=?");
//			query.setInteger(0, class_id);
//			productVOs = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException e) {
//			session.getTransaction().rollback();
//			throw e;
//		}
		return productVOs;
	}

	@Override
	public List<ProductVO> getAllPackages() {
		List<ProductVO> productVOs = new LinkedList<ProductVO>();
		productVOs= hibernateTemplate.find("FROM ProductVO WHERE product_kind=2 AND inMenu=1 ");
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("FROM ProductVO WHERE product_kind=2 AND inMenu=1 ");
//			productVOs = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException e) {
//			session.getTransaction().rollback();
//			throw e;
//		}
		return productVOs;
	}

	@Override
	public List<ProductVO> getDishesByOnePackage(Integer product_pcg) {
		List<ProductVO> productVOs = new LinkedList<ProductVO>();
//		productVOs = hibernateTemplate.find("select distinct dishClassVO FROM ProductVO WHERE product_pcg=? order by class_id ", product_pcg);
		productVOs = hibernateTemplate.find("FROM ProductVO WHERE product_pcg=? order by product_id ", product_pcg);
		
		// Session session =
		// HibernateUtil.getSessionFactory().getCurrentSession();
		// try {
		// session.beginTransaction();
		// Query query = session.createQuery("FROM ProductVO WHERE
		// product_pcg=?");
		// query.setInteger(0, pcg_id);
		// productVOs = query.list();
		// session.getTransaction().commit();
		// } catch (RuntimeException e) {
		// session.getTransaction().rollback();
		// throw e;
		// }
		return productVOs;
	}

	@Override //(測試)
	public List<PackageFormatVO> getDishClassByPackage(Integer pcg_id) {
		List<PackageFormatVO> packageFormatVOs = new LinkedList<PackageFormatVO>();
		packageFormatVOs = hibernateTemplate.find("FROM PackageFormatVO WHERE pcg_id =? order by class_id ", pcg_id);
		
		
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction(); // dishClassVO.class_name product_pcg
//			Query query = session.createQuery("FROM PackageFormatVO WHERE pcg_id =? order by class_id ");
//			query.setInteger(0, pcg_id);
//			packageFormatVOs = query.list();
//			System.out.println(query.list());
//
//			session.getTransaction().commit();
//		} catch (RuntimeException e) {
//			session.getTransaction().rollback();
//			throw e;
//		}
		return packageFormatVOs;
	}
	

	@Override
	public List<ProductVO> getDishesByPackageAndClass(Integer pcg_id, Integer class_id) {
		List<ProductVO> productVOs = new LinkedList<ProductVO>();
		productVOs=hibernateTemplate.find("FROM ProductVO WHERE product_pcg=? AND product_class=?", new Object[]{pcg_id,class_id});
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("FROM ProductVO WHERE product_pcg=? AND product_class=?");
//			query.setInteger(0, pcg_id);
//			query.setInteger(1, class_id);
//			productVOs = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException e) {
//			session.getTransaction().rollback();
//			throw e;
//		}
		return productVOs;
	}

	@Override
	public List<ProductVO> getAllProducts() {
		List<ProductVO> productVOs = new LinkedList<ProductVO>();
		productVOs=hibernateTemplate.find("FROM ProductVO");
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery("FROM ProductVO");
//			productVOs = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException e) {
//			session.getTransaction().rollback();
//			throw e;
//		}
		return productVOs;
	}
	
	//===================================從Servlet轉交===================================		
	
		
		//Service的updatePro轉交
		@Override
		public ProductVO update(ProductVO productVO) {
//			hibernateTemplate.get(ProductVO.class, productVO.getProduct_id());
//			byte[] img=img1.getProduct_img();
//			productVO.setProduct_img(img);
			hibernateTemplate.saveOrUpdate(productVO);
			
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//			try {
//				session.beginTransaction();
//				Query query=session.createQuery("update ProductVO set product_name=?,product_price=?,product_kind=?,product_class=?,product_pcg=?,InMenu=?,product_intro=? where product_id=?");
//				query.setParameter(0, productVO.getProduct_name());
//				query.setParameter(1, productVO.getProduct_price());
//				query.setParameter(2, productVO.getProductKindVO().getKind_id());
//				query.setParameter(3, productVO.getDishClassVO().getClass_id());
//				query.setParameter(4, productVO.getProduct_pcg());
//				query.setParameter(5, productVO.getInMenu());
//				query.setParameter(6, productVO.getProduct_intro());
//				query.setParameter(7, productVO.getProduct_id());
//				query.executeUpdate();
//				session.getTransaction().commit();
//			}catch(RuntimeException ex){
//				session.getTransaction().rollback();
//				ex.printStackTrace();
//			}
			return productVO;
		}
		
		
		//Service的updateProimg轉交
		@Override
		public ProductVO proimgup(ProductVO productVO) {
			ProductVO proup=hibernateTemplate.get(ProductVO.class, productVO.getProduct_id());
			proup.setProduct_img(productVO.getProduct_img());
			hibernateTemplate.saveOrUpdate(proup);
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//			try {
//				session.beginTransaction();
//				ProductVO productVOO=(ProductVO)session.get(ProductVO.class,productVO.getProduct_id());
//				productVOO.setProduct_img(productVO.getProduct_img());
//				session.getTransaction().commit();
//			}catch(RuntimeException ex){
//				session.getTransaction().rollback();
//				ex.printStackTrace();
//			}
			return productVO;
		}

		
		//Service的deletePro轉交
		@Override
		public void delete(Integer product_id) {
			ProductVO proVO=hibernateTemplate.get(ProductVO.class,product_id);
			hibernateTemplate.delete(proVO);
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//			try {
//				session.beginTransaction();
//				ProductVO proVO=(ProductVO)session.get(ProductVO.class,product_id);
//				session.delete(proVO);
//				session.getTransaction().commit();
//			}catch(RuntimeException ex){
//				session.getTransaction().rollback();
//				ex.printStackTrace();
//			}

		}
		
		
		//Service的addSinglePro轉交
		@Override
		public ProductVO insertSinglePro(ProductVO productVO) {
			hibernateTemplate.saveOrUpdate(productVO);
			
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//			try{
//				session.beginTransaction();
//				session.saveOrUpdate(productVO);
//				session.getTransaction().commit();
//			}catch(RuntimeException ex){
//				session.getTransaction().rollback();
//			}
//			
			return productVO;
		}
		
		
		//Service的addPack轉交
		@Override
		public ProductVO insertPack(ProductVO productVO) {
			hibernateTemplate.saveOrUpdate(productVO);
//				Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//			try {
//				session.beginTransaction();
//				session.saveOrUpdate(productVO);
//				session.getTransaction().commit();	
//			}catch(RuntimeException ex){
//				session.getTransaction().rollback();
//			}
			return productVO;
		}
		

		//Service的addPackPro轉交
		@Override
		public ProductVO insertPackPro(ProductVO productVO) {
			hibernateTemplate.saveOrUpdate(productVO);
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//			try {
//				session.beginTransaction();
//				session.saveOrUpdate(productVO);
//				session.getTransaction().commit();
//			}catch(RuntimeException ex){
//				
//				ex.printStackTrace();
//			}
			return productVO;

		}
		
		
		//Service的selectPackPro轉交
		@Override
		public List<ProductVO> selectPackPro(ProductVO productVO) {
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//			 list=null;
			 List<ProductVO>list=hibernateTemplate.find("FROM ProductVO WHERE product_pcg=? and product_kind=? and product_price=? order by product_class" ,new Object[]{productVO.getProduct_pcg(),productVO.getProductKindVO().getKind_id(),productVO.getProduct_price()});
//			try {
//				session.beginTransaction();
//				Query query=session.createQuery("from ProductVO where product_pcg=? and product_kind=? and product_price=? order by product_class");
//				query.setParameter(0,productVO.getProduct_pcg());
//				query.setParameter(1,productVO.getProductKindVO().getKind_id());
//				query.setParameter(2,productVO.getProduct_price());
//				list=query.list();
//				session.getTransaction().commit();
//			}catch(RuntimeException ex){
//				session.getTransaction().rollback();
//				ex.printStackTrace();
//			}
			return list;
		}
		
		@Override
		public PackageFormatVO AddClassNum(PackageFormatVO packageFormatVO){
			hibernateTemplate.saveOrUpdate(packageFormatVO);
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//			try {
//				session.beginTransaction();
//				session.saveOrUpdate(packageFormatVO);
//				session.getTransaction().commit();
//			}catch(RuntimeException ex){
//				session.getTransaction().rollback();
//				ex.printStackTrace();
//			}
			return packageFormatVO;
			
			
		}
		
		@Override
		public PackageFormatVO UPclassNumber(PackageFormatVO packageFormatVO){
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();		
			hibernateTemplate.saveOrUpdate(packageFormatVO);
//			try {
//				session.beginTransaction();
//				Query query=session.createQuery("update PackageFormatVO set class_number=? where pcg_id=? and class_id=?");
//				query.setParameter(0,packageFormatVO.getClass_number());
//				query.setParameter(1,packageFormatVO.getProductVO().getProduct_id());
//				query.setParameter(2,packageFormatVO.getDishClassVO().getClass_id());
//				query.executeUpdate();
//				session.getTransaction().commit();
//			}catch(RuntimeException ex){
//				session.getTransaction().rollback();
//				ex.printStackTrace();
//			}
			return packageFormatVO;
			
			
		}
		
		@Override
		public ProductVO UpdatePackPro(ProductVO productVO) {
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			ProductVO proVO=hibernateTemplate.get(ProductVO.class,productVO.getProduct_id());
			Integer pcg=proVO.getProduct_pcg();
			productVO.setProduct_pcg(pcg);
	
			hibernateTemplate.saveOrUpdate(productVO);
//			try {
//				session.beginTransaction();
//				Query query=session.createQuery("update ProductVO set product_name=?,product_price=?,product_kind=? where product_id=?");
//				query.setParameter(0,productVO.getProduct_name());
//				query.setParameter(1,productVO.getProduct_price());
//				query.setParameter(2,productVO.getProductKindVO().getKind_id());
//				query.setParameter(3,productVO.getProduct_id());
//				query.executeUpdate();
//				session.getTransaction().commit();
//			}catch(RuntimeException ex){
//				session.getTransaction().rollback();
//				ex.printStackTrace();
//			}
			return productVO;
		}

		
	//=================================================================================
		
		
	//===================================非Servlet轉交===================================		
		@Override
		public List<ProductVO> getSingle(){
			List<ProductVO> list=null;
			list=hibernateTemplate.find("FROM ProductVO WHERE product_kind=?", 1);
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//		try{	
//			session.beginTransaction();
//			Query query=session.createQuery("from ProductVO where product_kind=1");
//			list=query.list();
//			session.getTransaction().commit();
//		}catch(RuntimeException ex){
//			session.getTransaction().rollback();
//			throw ex;
//		}	
			return list;
		}
		
		
		
		
		//Service的getAll轉交
		@Override
		public List<ProductVO> getAll() {
			List<ProductVO> list = new LinkedList<ProductVO>();
			list=hibernateTemplate.find("FROM ProductVO");
//				Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//			try{	
//				session.beginTransaction();
//				Query query=session.createQuery("from ProductVO");
//				list=query.list();
//				session.getTransaction().commit();
//			}catch(RuntimeException ex){
//				session.getTransaction().rollback();
//				throw ex;
//			}
			return list;
		}
		

		//Service的SelectPack轉交
		@Override
		public List<ProductVO> SelectPack(Integer product_kind) {
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			List<ProductVO> list=null;
			list=hibernateTemplate.find("FROM ProductVO WHERE product_kind=?", product_kind);
//			try {
//				session.beginTransaction();
//				Query query=session.createQuery("from ProductVO where product_kind=?");
//				query.setParameter(0, product_kind);
//				list=query.list();
//				session.getTransaction().commit();
//			}catch(RuntimeException ex){
//				session.getTransaction().rollback();
//				ex.printStackTrace();
//			}
			return list;
		}

		
		//Service的SelectMAXPack轉交
		@Override
		public Integer SelectMAXPack(Integer product_kind) {
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//			 Integer result=null;
			 List<Integer> result0=hibernateTemplate.find("select MAX(product_id) from ProductVO where product_kind=?",2);
			 Integer result=null;
			 for(Integer readresult:result0){
				 System.out.println(readresult);
				 result=readresult;
			 }
 
//			try{
//				session.beginTransaction();
//				Query query=session.createSQLQuery("select max(product_id) from Product where product_kind=?");
//				query.setParameter(0, product_kind);
//				 result = (Integer) query.uniqueResult();
//				session.beginTransaction().commit();
//			}catch(RuntimeException ex){
//				session.getTransaction().rollback();
//				ex.printStackTrace();
//			}
			return result;
		}

		
		//Service的getOneClass轉交
		@Override
		public List<ProductVO> getOneClass(Integer product_class,Integer inMenu) {
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			List<ProductVO> list=null;
			list=hibernateTemplate.find("from ProductVO where product_class=? and product_price!=0 and inMenu=?",new Object[]{product_class,inMenu});
//			try {
//				session.beginTransaction();
//				Query query=session.createQuery("from ProductVO where product_class=? and product_price!=? ");
//				query.setParameter(0, product_class);
//				query.setParameter(1, product_price);		
//				list=query.list();		
//				session.getTransaction().commit();
//			} catch (RuntimeException ex) {
//				session.getTransaction().rollback();
//			
//			} 
			return list;
		}
		
		

		//Service的getOneSingleClass轉交
		@Override
		public List<ProductVO> getOneSingleClass(Integer product_class,Integer product_price) {
//			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			List<ProductVO> list=null;
			list=hibernateTemplate.find("from ProductVO where product_class=? and product_price=?",new Object[]{product_class,product_price} );
//			try {
//				session.beginTransaction();
//				Query query=session.createQuery("from ProductVO where product_class=? and product_price=?");
//				query.setParameter(0, product_class);
//				query.setParameter(1, product_price);
//				list=query.list();
//				session.getTransaction().commit();
//			}catch(RuntimeException ex){
//				session.getTransaction().rollback();
//				ex.printStackTrace();
//			}
			return list;
		}
		

		//Service的getPro轉交
		@Override
		public List<ProductVO> getClass(Integer product_pcg) {
			List<ProductVO> list=null;
			list=hibernateTemplate.find("from ProductVO where product_pcg=? order by product_class",product_pcg);
//				Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//			try {
//				session.beginTransaction();
//				Query query=session.createQuery("from ProductVO where product_pcg=? order by product_class");
//				query.setParameter(0, product_pcg);
//				list=query.list();
//				session.getTransaction().commit();
//			} catch(RuntimeException ex){
//				session.getTransaction().rollback();
//					ex.printStackTrace();
//			}
			return list;
		}
		
		//------------------------eating!!!--------------
		@Override
			public List<Object> getProductByPackage(String pcgName) {
				List<Object> list=null;
				list=hibernateTemplate.find("select product_name from ProductVO where pcgVO.product_name=? order by product_id",pcgName);
//				Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//				try {
//					session.beginTransaction();
//					Query query=session.createQuery("select product_name from ProductVO where pcgVO.product_name=? order by product_id");
//					query.setParameter(0, pcgName);
//					list=query.list();
//					session.getTransaction().commit();
//				} catch(RuntimeException ex){
//					session.getTransaction().rollback();
//						ex.printStackTrace();
//				}
				return list;
			}
		
		@Override
		public List<ProductVO> getProductByClass(Integer class_id) {
			List<ProductVO> productVOs = new LinkedList<ProductVO>();
			productVOs=hibernateTemplate.find("FROM ProductVO WHERE product_kind=1 AND product_class=?",class_id);
//			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//			try {
//				session.beginTransaction();
//				Query query = session.createQuery("FROM ProductVO WHERE product_kind=1 AND product_class=?");
//				query.setInteger(0, class_id);
//				productVOs = query.list();
//				session.getTransaction().commit();
//			} catch (RuntimeException e) {
//				session.getTransaction().rollback();
//				throw e;
//			}
			return productVOs;
		}

	public static void main(String args[]) {

//		ProductDAO productDAO = new ProductDAO();
//		 List<PackageFormatVO> list=productDAO.getFormat(10570);
//		for(PackageFormatVO ww:list){
//			System.out.println(ww.getClass_number());
//			System.out.println(ww.getDishClassVO().getClass_id());
//		}
		
//		ProductDAO productDAO = new ProductDAO();
		// List<ProductVO> list=productDAO.getSingleDishesByClass(20);

//		List<ProductVO> list = productDAO.getAllSingleDishes();
//		List<ProductVO> list = productDAO.getSingleDishesByClass(30);
//		List<ProductVO> list = productDAO.getAllPackages();
//		List<ProductVO> list = productDAO.getDishesByPackageAndClass(11070, 40);
//		List<ProductVO> list = productDAO.getDishesByPackage(10700);
//		 List<ProductVO> list=productDAO.getAllProducts();

//		for (ProductVO productVOs : list) {
//			System.out.println("--------------------------");
//			System.out.println("商品編號:" + productVOs.getProduct_id());
//			System.out.println("商品名稱:" + productVOs.getProduct_name());
//			System.out.println("商品價格:" + productVOs.getProduct_price());
//			System.out.println("商品種類:" + productVOs.getProductKindVO().getKind_name());
//			if (productVOs.getDishClassVO() != null) {
//				System.out.println("所屬菜色類型:" + productVOs.getDishClassVO().getClass_name());
//			} else {
//				System.out.println("所屬菜色類型:無");
//			}
//			System.out.println("所屬套餐編號:"+productVOs.getProduct_pcg());
//			if (productVOs.getPcgVO() != null) {
//				System.out.println("所屬套餐名稱:" + productVOs.getPcgVO().getProduct_name());
//			} else {
//				System.out.println("所屬套餐名稱:無");
//			}
//			System.out.println("商品圖片:" + productVOs.getProduct_img());
//			System.out.println("在菜單中" + productVOs.getInMenu());
//			System.out.println("商品介紹" + productVOs.getProduct_intro());

//		}
		

	}


}
