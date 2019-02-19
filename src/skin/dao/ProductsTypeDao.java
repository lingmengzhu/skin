package skin.dao;

import java.util.List;

import skin.entity.ProductsType;

public interface ProductsTypeDao {

	List<ProductsType> productstypeM(int currentPage, int pageSize, String key);

	int productstypeCount();

	void addPT(ProductsType pt);

	void updatePT(ProductsType pt);

	ProductsType findPT(int ptId);

	void delPT(ProductsType pt);

	List<ProductsType> findTypeOne();

	List<ProductsType> findTypeNameByFunction(String productsFunctionTitle);

	ProductsType findProductsTypeId(String productsFunctionTitle, String productsTypeName);

	ProductsType findPt(int productsTypeId);

	List<String> findFunction();

	int findTypeIdByTypeName(String type);

}
