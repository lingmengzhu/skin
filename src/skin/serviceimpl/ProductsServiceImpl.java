package skin.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import skin.dao.ProductsDao;
import skin.entity.Products;
import skin.entity.User;
import skin.service.ProductsService;
import skin.util.Pager;

@Service(value = "productsService")
@Transactional
public class ProductsServiceImpl implements ProductsService {
	@Autowired
	private ProductsDao productsDao;

	@Override
	public Pager<Products> productsM(int currentPage, int pageSize, String key) {
		// TODO Auto-generated method stub
		int recordTotal = productsDao.getProductsCount(key);
		System.out.println("recordTotal"+recordTotal);
		int pageTotal = (int) Math.ceil(recordTotal * 1.0 / pageSize);
		System.out.println("pageTotal"+pageTotal);
		List<Products> list = productsDao.productsM(currentPage, pageSize, key);
		Pager<Products> pb = new Pager<>();
		pb.setPageTotal(pageTotal);
		pb.setCurrentPage(currentPage);
		pb.setContent(list);
		pb.setRecordTotal(recordTotal);
		return pb;
	}

	@Override
	public void addP(Products p) {
		// TODO Auto-generated method stub
		productsDao.addP(p);
	}

	@Override
	public void updateP(Products p) {
		// TODO Auto-generated method stub
		productsDao.updateP(p);
	}

	@Override
	public Products findP(int pId) {
		// TODO Auto-generated method stub
		return productsDao.findP(pId);
	}

	@Override
	public void delP(Products p) {
		// TODO Auto-generated method stub
		productsDao.delP(p);
	}

	@Override
	public Pager<Products> findProductsPager(int currentPage, int pageSize, int productsTypeId,String key) {
		// TODO Auto-generated method stub
		int recordTotal = productsDao.getCount(productsTypeId,key);
		System.out.println("recordTotal"+recordTotal);
		int pageTotal = (int) Math.ceil(recordTotal * 1.0 / pageSize);
		System.out.println("pageTotal"+pageTotal);
		List<Products> list = productsDao.findProductsPager(currentPage, pageSize, productsTypeId,key);
		Pager<Products> pb = new Pager<>();
		pb.setPageTotal(pageTotal);
		pb.setCurrentPage(currentPage);
		pb.setContent(list);
		pb.setRecordTotal(recordTotal);
		return pb;
	}

	@Override
	public List<Products> findPByTypeId(int tId) {
		// TODO Auto-generated method stub
		return productsDao.findPByTypeId(tId);
	}

	@Override
	public List<Products> findPByFunction(int tId) {
		// TODO Auto-generated method stub
		return productsDao.findPByFunction(tId);
	}

}
