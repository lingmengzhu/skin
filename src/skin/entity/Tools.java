package skin.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tab_Tools")
public class Tools {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private int toolsId;
	private String toolsName;
	private String toolsImg;
	private String useMethod;
	private String toolsType;
	public String getToolsName() {
		return toolsName;
	}
	public void setToolsName(String toolsName) {
		this.toolsName = toolsName;
	}
	public int getToolsId() {
		return toolsId;
	}
	public void setToolsId(int toolsId) {
		this.toolsId = toolsId;
	}
	public String getToolsImg() {
		return toolsImg;
	}
	public void setToolsImg(String toolsImg) {
		this.toolsImg = toolsImg;
	}
	public String getUseMethod() {
		return useMethod;
	}
	public void setUseMethod(String useMethod) {
		this.useMethod = useMethod;
	}
	public String getToolsType() {
		return toolsType;
	}
	public void setToolsType(String toolsType) {
		this.toolsType = toolsType;
	}
	@Override
	public String toString() {
		return "Tools [toolsId=" + toolsId + ", toolsImg=" + toolsImg + ", useMethod=" + useMethod + ", toolsType="
				+ toolsType + "]";
	}
	
}
