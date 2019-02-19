package skin.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import skin.dao.ProblemDao;
import skin.entity.Problem;
import skin.service.ProblemService;

@Service(value = "problemService")
@Transactional
public class ProblemServiceImpl implements ProblemService {
	@Autowired
	private ProblemDao problemDao;

	@Override
	public Problem problemM(String condition, String problemName) {
		// TODO Auto-generated method stub
		return problemDao.problemM(condition,problemName);
	}

	@Override
	public void updatePBlem(Problem pBlem) {
		// TODO Auto-generated method stub
		problemDao.updatePBlem(pBlem);
	}

	@Override
	public Problem findPBlem(int problemId) {
		// TODO Auto-generated method stub
		return problemDao.findPBlem(problemId);
	}

	@Override
	public List<Problem> findAllCondition() {
		// TODO Auto-generated method stub
		return problemDao.findAllCondition();
	}

	@Override
	public List<Problem> findProblemNameByCondition(String condition) {
		// TODO Auto-generated method stub
		return problemDao.findProblemNameByCondition(condition);
	}

}
