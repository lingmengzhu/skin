package skin.daoimpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import skin.dao.ProblemDao;
import skin.entity.Problem;

@Repository(value="problemDao")
public class ProblemDaoImpl implements ProblemDao{
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	@Override
	public Problem problemM(String condition, String problemName) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Problem.class);
		if (condition != null && condition.length() > 0) {
			criteria.add(Restrictions.eq("problemCondition", condition));
		}
		if (problemName != null && problemName.length() > 0) {
			criteria.add(Restrictions.eq("problemName", problemName));
		}
		return (Problem) hibernateTemplate.findByCriteria(criteria).get(0);
	}

	@Override
	public void updatePBlem(Problem pBlem) {
		// TODO Auto-generated method stub
		hibernateTemplate.update(pBlem);
	}

	@Override
	public Problem findPBlem(int problemId) {
		// TODO Auto-generated method stub
		return hibernateTemplate.get(Problem.class, problemId);
	}

	@Override
	public List<Problem> findAllCondition() {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Problem.class);
		return (List<Problem>) hibernateTemplate.findByCriteria(criteria);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Problem> findProblemNameByCondition(String condition) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Problem.class);
		if (condition != null && condition.length() > 0) {
			criteria.add(Restrictions.eq("problemCondition", condition));
		}
		return (List<Problem>) hibernateTemplate.findByCriteria(criteria);
	}



}
