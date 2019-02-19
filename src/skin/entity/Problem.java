package skin.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tab_problem")
public class Problem {
	@Id
	 private int problemId;
	 private String problemName;//螨虫痘痘
	 private String problemCondition;//痘痘
	 private String problemImage;
	 private String pathologyReason;
	 private String personReason;
	 private String feature;
	 private String solutions;
	 
	 
	public int getProblemId() {
		return problemId;
	}

	public void setProblemId(int problemId) {
		this.problemId = problemId;
	}

	public String getProblemName() {
		return problemName;
	}

	public void setProblemName(String problemName) {
		this.problemName = problemName;
	}

	public String getPathologyReason() {
		return pathologyReason;
	}

	public void setPathologyReason(String pathologyReason) {
		this.pathologyReason = pathologyReason;
	}

	public String getPersonReason() {
		return personReason;
	}

	public void setPersonReason(String personReason) {
		this.personReason = personReason;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public String getSolutions() {
		return solutions;
	}

	public void setSolutions(String solutions) {
		this.solutions = solutions;
	}

	public String getProblemImage() {
		return problemImage;
	}

	public void setProblemImage(String problemImage) {
		this.problemImage = problemImage;
	}

	public String getProblemCondition() {
		return problemCondition;
	}

	public void setProblemCondition(String problemCondition) {
		this.problemCondition = problemCondition;
	}

	@Override
	public String toString() {
		return "Problem [problemId=" + problemId + ", problemName=" + problemName + ", problemCondition="
				+ problemCondition + ", problemImage=" + problemImage + ", pathologyReason=" + pathologyReason
				+ ", personReason=" + personReason + ", feature=" + feature + ", solutions=" + solutions + "]";
	}

	 
	 
}
