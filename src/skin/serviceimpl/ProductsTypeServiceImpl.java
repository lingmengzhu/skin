package skin.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import skin.dao.ProductsTypeDao;
import skin.entity.ProductsType;
import skin.entity.User;
import skin.service.ProductsTypeService;
import skin.util.Pager;

@Service(value = "productsTypeService")
@Transactional
public class ProductsTypeServiceImpl implements ProductsTypeService {
	@Autowired
	private ProductsTypeDao productsTypeDao;

	@Override
	public Pager<ProductsType> productstypeM(int currentPage, int pageSize, String key) {
		// TODO Auto-generated method stub
		int recordTotal=productsTypeDao.productstypeCount();
		int pageTotal=(int) Math.ceil(recordTotal * 1.0 / pageSize);
		List<ProductsType> list = productsTypeDao.productstypeM(currentPage, pageSize,key);
		Pager<ProductsType> pb = new Pager<>();
		pb.setPageTotal(pageTotal);
		pb.setCurrentPage(currentPage);
		pb.setContent(list);
		pb.setRecordTotal(recordTotal);
		return pb;
	}

	@Override
	public void addPT(ProductsType pt) {
		// TODO Auto-generated method stub
		productsTypeDao.addPT(pt);
	}

	@Override
	public void updatePT(ProductsType pt) {
		// TODO Auto-generated method stub
		productsTypeDao.updatePT(pt);
	}

	@Override
	public void delPT(ProductsType pt) {
		// TODO Auto-generated method stub
		productsTypeDao.delPT(pt);
	}

	@Override
	public ProductsType findPT(int ptId) {
		// TODO Auto-generated method stub
		return productsTypeDao.findPT(ptId);
	}

	@Override
	public List<ProductsType> findTypeOne() {
		// TODO Auto-generated method stub
		return productsTypeDao.findTypeOne();
	}

	@Override
	public List<ProductsType> findTypeNameByFunction(String productsFunctionTitle) {
		// TODO Auto-generated method stub
		return productsTypeDao.findTypeNameByFunction(productsFunctionTitle);
	}

	@Override
	public ProductsType findProductsTypeId(String productsFunctionTitle, String productsTypeName) {
		// TODO Auto-generated method stub
		return productsTypeDao.findProductsTypeId(productsFunctionTitle,productsTypeName);
	}

	@Override
	public ProductsType findPt(int productsTypeId) {
		// TODO Auto-generated method stub
		return productsTypeDao.findPt(productsTypeId);
	}

	@Override
	public List<String> findFunction() {
		// TODO Auto-generated method stub
		return productsTypeDao.findFunction();
	}

	@Override
	public int findTypeIdByTypeName(String type) {
		// TODO Auto-generated method stub
		return productsTypeDao.findTypeIdByTypeName(type);
	}



}
