package skin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import skin.entity.BeautyInformation;
import skin.entity.Tools;
import skin.service.BeautyInformationService;
import skin.service.ToolsService;
import skin.util.Pager;
import skin.util.Struts2Utils;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("beautyInformationAction")
@Scope("prototype")
public class BeautyInformationAction extends ActionSupport implements ModelDriven<BeautyInformation>, ServletRequestAware, ServletResponseAware {
	@Autowired
	private BeautyInformationService beautyInformationService;
	private static final long serialVersionUID = 1L;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	private int currentPage = 1; // 当前页
	private int pageSize = 6;// 默认每页显示条数
	private String key = "";
	private Pager<BeautyInformation> pb;
	private Gson gson = new Gson();
	public BeautyInformation bInfo;
	@Action(value = "/skin-admin/informationM", results = { @Result(name = "success", location = "/skin-admin/informationM.jsp") })
	public String informationM() {// 查询用户 进入用户管理
		pb = beautyInformationService.informationM(currentPage, pageSize, key);
		this.setPb(pb);
		return "success";
	}
	@Action(value = "/skin-admin/addBI",results = { @Result(name = "success", location = "/skin-admin/informationM", type = "redirect") })
	public String addBI() {// 账户已存在未做
		beautyInformationService.addBI(bInfo);
		return SUCCESS;
	}
	@Action(value = "/skin-admin/updateBI")
	public void updateBI() {
		bInfo= gson.fromJson(request.getParameter("formdata"),BeautyInformation.class);
		beautyInformationService.updateBI(bInfo);
	}
	@Action(value = "/skin-admin/editBI")
	public void editBI() {
		int BIId = Integer.parseInt(request.getParameter("formdata"));
		bInfo= beautyInformationService.findBI(BIId);
		Struts2Utils.renderJson(bInfo);
	}
	@Action(value = "findBeautyinformation", results = {
			@Result(name = "success", location = "/Beautyinformation.jsp") })
	public String findBeautyinformation() {
		List<BeautyInformation> list1 = null;
		List<BeautyInformation> list2 = null;
		List<BeautyInformation> list3 = null;
		List<BeautyInformation> list4 = null;
		List<BeautyInformation> list5 = null;
		List<BeautyInformation> list6 = null;
		List<BeautyInformation> list7 = null;
		try {
			list1 = beautyInformationService.findBeautyinformation(currentPage,pageSize);
			System.out.println(list1.get(0).toString());
			currentPage++;
			list2 = beautyInformationService.findBeautyinformation(currentPage,pageSize);
			currentPage++;
			list3 = beautyInformationService.findBeautyinformation(currentPage,pageSize);
			currentPage++;
			list4 = beautyInformationService.findBeautyinformation(currentPage,pageSize);
			currentPage++;
			list5 = beautyInformationService.findBeautyinformation(currentPage,pageSize);
			currentPage++;
			list6 = beautyInformationService.findBeautyinformation(currentPage,pageSize);
			currentPage++;
			list7 = beautyInformationService.findBeautyinformation(currentPage,pageSize);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		request.setAttribute("list5", list5);
		request.setAttribute("list6", list6);
		request.setAttribute("list7", list7);
		return "success";
	}
	@Action(value = "findLeftImg")
	public void findLeftImg() {
		List<BeautyInformation> list1 = null;
		pageSize=7;
		list1 = beautyInformationService.findBeautyinformation(currentPage,pageSize);
		String json=gson.toJson(list1);
		Struts2Utils.renderJson(json);
	}
	@Action(value = "findRightImg")
	public void findRightImg() {
		List<BeautyInformation> list1 = null;
		currentPage=2;
		pageSize=8;
		list1 = beautyInformationService.findBeautyinformation(currentPage,pageSize);
		String json=gson.toJson(list1);
		Struts2Utils.renderJson(json);
	}
	@Action(value = "findTwoImg")
	public void findTwoImg() {
		List<BeautyInformation> list1 = null;
		currentPage=1;
		pageSize=2;
		list1 = beautyInformationService.findBeautyinformation(currentPage,pageSize);
		String json=gson.toJson(list1);
		Struts2Utils.renderJson(json);
	}
	@Action(value = "findInfoById", results = {
			@Result(name = "success", location = "/informationdetail.jsp") })
	public String findInfoById() {
		int BIId=Integer.parseInt(request.getParameter("Id"));
		bInfo= beautyInformationService.findBI(BIId);
		this.setbInfo(bInfo);
		return "success";
	}
	@Action(value = "/skin-admin/delBI")
	public void delBI() {
		int BIId = Integer.parseInt(request.getParameter("formdata"));
		bInfo= beautyInformationService.findBI(BIId);
		beautyInformationService.delBI(bInfo);
	}
	@Action(value = "/skin-admin/informationMPage", results = {
			@Result(name = "success", location = "/skin-admin/informationM.jsp") })
	public String informationMPage() {// 切换页码跳转内容
		key = request.getParameter("key");
		String msg=request.getParameter("currentPage");
		if(msg!=null){
		currentPage = Integer.parseInt(msg);
		}
		pb = beautyInformationService.informationM(currentPage, pageSize, key);
		this.setPb(pb);
		return "success";
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response=response;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public Pager<BeautyInformation> getPb() {
		return pb;
	}
	public void setPb(Pager<BeautyInformation> pb) {
		this.pb = pb;
	}
	public BeautyInformation getbInfo() {
		return bInfo;
	}
	public void setbInfo(BeautyInformation bInfo) {
		this.bInfo = bInfo;
	}
	@Override
	public BeautyInformation getModel() {
		// TODO Auto-generated method stub
		return bInfo;
	}

}
