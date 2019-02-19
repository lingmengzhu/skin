package skin.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tab_beautyinformation")
public class BeautyInformation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private int beautyInformationId;
	private String beautyInformationTitle;
	private String beautyInformationKeyword;
	private String beautyInformationImage;
	private String beautyInformationContent;
	private String beautyInformationResourse;
	private String beautyInformationTime;
	private String beautyInformationAuthor;
	private String beautyInformationSynopsis;
	public int getBeautyInformationId() {
		return beautyInformationId;
	}
	public void setBeautyInformationId(int beautyInformationId) {
		this.beautyInformationId = beautyInformationId;
	}
	public String getBeautyInformationTitle() {
		return beautyInformationTitle;
	}
	public void setBeautyInformationTitle(String beautyInformationTitle) {
		this.beautyInformationTitle = beautyInformationTitle;
	}
	public String getBeautyInformationImage() {
		return beautyInformationImage;
	}
	public void setBeautyInformationImage(String beautyInformationImage) {
		this.beautyInformationImage = beautyInformationImage;
	}
	public String getBeautyInformationContent() {
		return beautyInformationContent;
	}
	public void setBeautyInformationContent(String beautyInformationContent) {
		this.beautyInformationContent = beautyInformationContent;
	}
	public String getBeautyInformationResourse() {
		return beautyInformationResourse;
	}
	public void setBeautyInformationResourse(String beautyInformationResourse) {
		this.beautyInformationResourse = beautyInformationResourse;
	}
	public String getBeautyInformationTime() {
		return beautyInformationTime;
	}
	public void setBeautyInformationTime(String beautyInformationTime) {
		this.beautyInformationTime = beautyInformationTime;
	}
	public String getBeautyInformationAuthor() {
		return beautyInformationAuthor;
	}
	public void setBeautyInformationAuthor(String beautyInformationAuthor) {
		this.beautyInformationAuthor = beautyInformationAuthor;
	}
	public String getBeautyInformationSynopsis() {
		return beautyInformationSynopsis;
	}
	public void setBeautyInformationSynopsis(String beautyInformationSynopsis) {
		this.beautyInformationSynopsis = beautyInformationSynopsis;
	}
	public String getBeautyInformationKeyword() {
		return beautyInformationKeyword;
	}
	public void setBeautyInformationKeyword(String beautyInformationKeyword) {
		this.beautyInformationKeyword = beautyInformationKeyword;
	}
	@Override
	public String toString() {
		return "BeautyInformation [beautyInformationId=" + beautyInformationId + ", beautyInformationTitle="
				+ beautyInformationTitle + ", beautyInformationKeyword=" + beautyInformationKeyword
				+ ", beautyInformationImage=" + beautyInformationImage + ", beautyInformationContent="
				+ beautyInformationContent + ", beautyInformationResourse=" + beautyInformationResourse
				+ ", beautyInformationTime=" + beautyInformationTime + ", beautyInformationAuthor="
				+ beautyInformationAuthor + ", beautyInformationSynopsis=" + beautyInformationSynopsis + "]";
	}
	
}
