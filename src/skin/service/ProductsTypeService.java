package skin.service;

import java.util.List;

import skin.entity.ProductsType;
import skin.util.Pager;

public interface ProductsTypeService {

	void addPT(ProductsType pt);

	void updatePT(ProductsType pt);

	ProductsType findPT(int ptId);

	void delPT(ProductsType pt);

	Pager<ProductsType> productstypeM(int currentPage, int pageSize, String key);

	List<ProductsType> findTypeOne();

	List<ProductsType> findTypeNameByFunction(String productsFunctionTitle);

	ProductsType findProductsTypeId(String productsFunctionTitle, String productsTypeName);

	ProductsType findPt(int productsTypeId);

	List<String> findFunction();

	int findTypeIdByTypeName(String type);

}
