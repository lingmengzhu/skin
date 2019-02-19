package skin.daoimpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import skin.dao.UserDao;
import skin.entity.User;

@Repository(value="userDao")
public class UserDaoImpl implements UserDao{
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public void addU(User u) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(u);
	}
	@Override
	public int getUserCount(String key) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from User where 1=1";
		if (key != null && key.length() > 0) {
				sql += " and userName LIKE '%" + key + "%'";
		}
		List<Long> list = (List<Long>) hibernateTemplate.find(sql);
		System.out.println(list.get(0).intValue());
		return list.get(0).intValue();
	}
	@Override
	public List<User> userM(int currentPage, int pageSize, String key) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		if (key != null && key.length() > 0) {
			criteria.add(Restrictions.like("userName", "%"+key+"%"));
		}
		return (List<User>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize, pageSize);
	}
	@Override
	public void delU(User u) {
		// TODO Auto-generated method stub
		hibernateTemplate.delete(u);
	}
	@Override
	public void updateU(User u) {
		// TODO Auto-generated method stub
		hibernateTemplate.update(u);
	}
	@Override
	public User findU(String userName) {
		// TODO Auto-generated method stub
		return hibernateTemplate.get(User.class,userName);
	}
}
