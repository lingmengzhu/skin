package skin.daoimpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import skin.dao.ProductsDao;
import skin.entity.Products;

@Repository(value = "productsDao")
public class ProductsDaoImpl implements ProductsDao {
	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	@Override
	public int getProductsCount(String key) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from Products where 1=1";
		if (key != null && key.length() > 0) {
			sql += " and productsName LIKE '%" + key + "%'";
	}
		List<Long> list = (List<Long>) hibernateTemplate.find(sql);
		return list.get(0).intValue();
	}

	@Override
	public List<Products> productsM(int currentPage, int pageSize, String key) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Products.class);
		if (key != null && key.length() > 0) {
			criteria.add(Restrictions.like("productsName", "%" + key + "%"));
		}
		return (List<Products>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize, pageSize);
	}

	@Override
	public void addP(Products p) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(p);
	}

	@Override
	public void updateP(Products p) {
		// TODO Auto-generated method stub
		hibernateTemplate.update(p);
	}

	@Override
	public Products findP(int pId) {
		// TODO Auto-generated method stub
		return hibernateTemplate.get(Products.class, pId);
	}

	@Override
	public void delP(Products p) {
		// TODO Auto-generated method stub
		hibernateTemplate.delete(p);
	}

	@Override
	public int getCount(int productsTypeId,String key) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from Products where 1=1";
		if (productsTypeId != 0) {
			sql += " and productsTypeId = '" + productsTypeId + "'";
	    }
		if (key != null && key.length() > 0) {
		sql += " and productsName LIKE '%" + key + "%'";
        }
		List<Long> list = (List<Long>) hibernateTemplate.find(sql);
		return list.get(0).intValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Products> findProductsPager(int currentPage, int pageSize, int productsTypeId,String key) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Products.class);
		if (productsTypeId!=0) {
			criteria.add(Restrictions.eq("productsTypeId",productsTypeId));
		}
		if (key != null && key.length() > 0) {
			criteria.add(Restrictions.like("productsName", "%"+key+"%"));
		}
		return (List<Products>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize, pageSize);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Products> findPByTypeId(int tId) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Products.class);
		criteria.add(Restrictions.eq("productsTypeId",tId));
		return (List<Products>) hibernateTemplate.findByCriteria(criteria,0,6);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Products> findPByFunction(int tId) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Products.class);
		criteria.add(Restrictions.eq("productsTypeId",tId));
		return (List<Products>) hibernateTemplate.findByCriteria(criteria,0,3);
	}
}
