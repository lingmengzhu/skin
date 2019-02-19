package skin.daoimpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import skin.dao.BeautyInformationDao;
import skin.entity.BeautyInformation;
import skin.entity.Tools;

@Repository(value="beautyInformationDao")
public class BeautyInformationDaoImpl implements BeautyInformationDao{
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	@Override
	public int getInformationCount(String key) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from BeautyInformation where 1=1";
		if (key != null && key.length() > 0) {
			sql += " and beautyInformationKeyword LIKE '%" + key + "%'";
		}
		List<Long> list = (List<Long>) hibernateTemplate.find(sql);
		System.out.println(list.get(0).intValue());
		return list.get(0).intValue();
	}

	@Override
	public List<BeautyInformation> informationM(int currentPage, int pageSize, String key) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(BeautyInformation.class);
		if (key != null && key.length() > 0) {
			criteria.add(Restrictions.like("beautyInformationKeyword", "%"+key+"%"));
		}
		return (List<BeautyInformation>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize, pageSize);
	}

	@Override
	public void addBI(BeautyInformation bInfo) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(bInfo);
	}

	@Override
	public void updateBI(BeautyInformation bInfo) {
		// TODO Auto-generated method stub
		hibernateTemplate.update(bInfo);
	}

	@Override
	public void delBI(BeautyInformation bInfo) {
		// TODO Auto-generated method stub
		hibernateTemplate.delete(bInfo);
	}

	@Override
	public BeautyInformation findBI(int bIId) {
		// TODO Auto-generated method stub
		return hibernateTemplate.get(BeautyInformation.class, bIId);
	}

	@Override
	public List<BeautyInformation> findBeautyinformation(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(BeautyInformation.class);
		return (List<BeautyInformation>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize, pageSize);
	}

}
