package skin.daoimpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import skin.dao.ManagerDao;
import skin.entity.Manager;
import skin.entity.User;

@Repository(value="managerDao")
public class ManagerDaoImpl implements ManagerDao{
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	@Override
	public Manager MLogin(Manager M) {
		// TODO Auto-generated method stub
		
		return hibernateTemplate.get(Manager.class, M.getManagerName());
	}

	@Override
	public int getManagerCount(String key) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from Manager where 1=1";
		if (key != null && key.length() > 0) {
				sql += " and managerName LIKE '%" + key + "%'";
		}
		List<Long> list = (List<Long>) hibernateTemplate.find(sql);
		System.out.println(list.get(0).intValue());
		return list.get(0).intValue();
	}
	

	@Override
	public List<Manager> managerM(int currentPage, int pageSize, String key) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Manager.class);
		if (key != null && key.length() > 0) {
			criteria.add(Restrictions.like("managerName", "%"+key+"%"));
		}
		return (List<Manager>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize, pageSize);
	}

	@Override
	public void updateM(Manager m) {
		// TODO Auto-generated method stub
		hibernateTemplate.update(m);
	}

	@Override
	public Manager findM(String mName) {
		// TODO Auto-generated method stub
		return hibernateTemplate.get(Manager.class, mName);
	}

	@Override
	public void delM(Manager m) {
		// TODO Auto-generated method stub
		hibernateTemplate.delete(m);
	}
}

