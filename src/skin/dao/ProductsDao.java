package skin.dao;

import java.util.List;

import skin.entity.Products;

public interface ProductsDao {

	int getProductsCount(String key);

	List<Products> productsM(int currentPage, int pageSize, String key);

	void addP(Products p);

	void updateP(Products p);

	Products findP(int pId);

	void delP(Products p);

	int getCount(int productsTypeId, String key);

	List<Products> findProductsPager(int currentPage, int pageSize, int productsTypeId, String key);

	List<Products> findPByTypeId(int tId);

	List<Products> findPByFunction(int tId);

}
