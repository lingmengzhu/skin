package skin.dao;

import java.util.List;

import skin.entity.Problem;

public interface ProblemDao {

	Problem problemM(String condition, String problemName);

	void updatePBlem(Problem pBlem);

	Problem findPBlem(int problemId);

	List<Problem> findAllCondition();

	List<Problem> findProblemNameByCondition(String condition);

}
