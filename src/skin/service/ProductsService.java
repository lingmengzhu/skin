package skin.service;

import java.util.List;

import skin.entity.Products;
import skin.util.Pager;

public interface ProductsService {

	Pager<Products> productsM(int currentPage, int pageSize, String key);

	void addP(Products p);

	void updateP(Products p);

	Products findP(int pId);

	void delP(Products p);

	Pager<Products> findProductsPager(int currentPage, int pageSize, int productsTypeId, String key);

	List<Products> findPByTypeId(int tId);

	List<Products> findPByFunction(int tId);

}
