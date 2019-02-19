package skin.daoimpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import skin.dao.ProductsTypeDao;
import skin.entity.ProductsType;

@Repository(value = "productsTypeDao")
public class ProductsTypeDaoImpl implements ProductsTypeDao {
	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductsType> productstypeM(int currentPage, int pageSize, String key) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(ProductsType.class);
		if (key != null && key.length() > 0) {
			criteria.add(Restrictions.like("productsFunctionTitle", "%" + key + "%"));
		}
		return (List<ProductsType>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize, pageSize);
	}

	@SuppressWarnings("unchecked")
	@Override
	public int productstypeCount() {
		// TODO Auto-generated method stub
		String sql = "select count(*) from ProductsType where 1=1";
		List<Long> list = (List<Long>) hibernateTemplate.find(sql);
		return list.get(0).intValue();
	}

	@Override
	public void addPT(ProductsType pt) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(pt);
	}

	@Override
	public void updatePT(ProductsType pt) {
		// TODO Auto-generated method stub
		hibernateTemplate.update(pt);
	}

	@Override
	public void delPT(ProductsType pt) {
		// TODO Auto-generated method stub
		hibernateTemplate.delete(pt);

	}

	@Override
	public ProductsType findPT(int ptId) {
		// TODO Auto-generated method stub
		return hibernateTemplate.get(ProductsType.class, ptId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductsType> findTypeOne() {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(ProductsType.class);
		return (List<ProductsType>) hibernateTemplate.findByCriteria(criteria);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductsType> findTypeNameByFunction(String productsFunctionTitle) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(ProductsType.class);
		criteria.add(Restrictions.eq("productsFunctionTitle", productsFunctionTitle));
		return (List<ProductsType>) hibernateTemplate.findByCriteria(criteria);
	}

	@Override
	public ProductsType findProductsTypeId(String productsFunctionTitle, String productsTypeName) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(ProductsType.class);
		criteria.add(Restrictions.eq("productsFunctionTitle", productsFunctionTitle));
		criteria.add(Restrictions.eq("productsTypeName", productsTypeName));
		return (ProductsType) hibernateTemplate.findByCriteria(criteria).get(0);
	}

	@Override
	public ProductsType findPt(int productsTypeId) {
		// TODO Auto-generated method stub
		return hibernateTemplate.get(ProductsType.class, productsTypeId);
	}

	@Override
	public List<String> findFunction() {
		// TODO Auto-generated method stub
		String sql = "select distinct productsFunctionTitle from ProductsType";
		List<String> ls = new ArrayList<>();
		ls=(List<String>) hibernateTemplate.find(sql);
		return ls;
	}

	@Override
	public int findTypeIdByTypeName(String type) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(ProductsType.class);
		criteria.add(Restrictions.eq("productsTypeName", type));
		ProductsType pt=(ProductsType) hibernateTemplate.findByCriteria(criteria).get(0);
		return pt.getProductsTypeId();
	}

}
