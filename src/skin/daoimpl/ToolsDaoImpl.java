package skin.daoimpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import skin.dao.ToolsDao;
import skin.entity.Products;
import skin.entity.Tools;
import skin.entity.User;

@Repository(value = "toolsDao")
public class ToolsDaoImpl implements ToolsDao {
	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	@Override
	public int getToolsCount(String key) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from Tools where 1=1";
		if (key != null && key.length() > 0) {
			sql += " and toolsName LIKE '%" + key + "%'";
		}
		List<Long> list = (List<Long>) hibernateTemplate.find(sql);
		System.out.println(list.get(0).intValue());
		return list.get(0).intValue();
	}

	@Override
	public List<Tools> ToolsM(int currentPage, int pageSize, String key) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Tools.class);
		if (key != null && key.length() > 0) {
			criteria.add(Restrictions.like("toolsName", "%"+key+"%"));
		}
		return (List<Tools>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize, pageSize);
	}

	@Override
	public void updateT(Tools t) {
		// TODO Auto-generated method stub
		hibernateTemplate.update(t);
	}

	@Override
	public Tools findT(int tId) {
		// TODO Auto-generated method stub
		return hibernateTemplate.get(Tools.class,tId);
	}

	@Override
	public void delT(Tools t) {
		// TODO Auto-generated method stub
		hibernateTemplate.delete(t);
	}

	@Override
	public void addT(Tools t) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getToolsCount(String toolsType, String key) {
		String sql = "select count(*) from Tools where 1=1";
		if (toolsType != null && toolsType.length() > 0) {
			sql += " and toolsType = '" + toolsType + "'";
	    }
		if (key != null && key.length() > 0) {
		sql += " and toolsName LIKE '%" + key + "%'";
        }
		List<Long> list = (List<Long>) hibernateTemplate.find(sql);
		return list.get(0).intValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tools> findToolsPager(int currentPage, int pageSize, String toolsType, String key) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Tools.class);
		if (toolsType != null && toolsType.length() > 0) {
			criteria.add(Restrictions.eq("toolsType",toolsType));
		}
		if (key != null && key.length() > 0) {
			criteria.add(Restrictions.like("toolsName", "%"+key+"%"));
		}
		return (List<Tools>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize, pageSize);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> findToolsType() {
		// TODO Auto-generated method stub
		String sql = "select distinct toolsType from Tools";
		List<String> ls = new ArrayList<>();
		ls=(List<String>) hibernateTemplate.find(sql);
		return ls;
	}

}
