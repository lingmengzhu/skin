package skin.action;

import java.util.ArrayList;
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

import skin.entity.Tools;
import skin.service.ToolsService;
import skin.util.Pager;
import skin.util.Struts2Utils;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("toolsAction")
@Scope("prototype")
public class ToolsAction extends ActionSupport
		implements ModelDriven<Tools>, ServletRequestAware, ServletResponseAware {
	@Autowired
	private ToolsService toolsService;
	private static final long serialVersionUID = 1L;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	private int currentPage = 1; // 当前页
	private int pageSize = 6;// 默认每页显示条数
	private String key = "";
	private String toolsType="";
	private Pager<Tools> pb;
	private Gson gson = new Gson();
	public Tools t;

	@Action(value = "/skin-admin/toolsM", results = { @Result(name = "success", location = "/skin-admin/toolsM.jsp") })
	public String toolsM() {// 查询用户 进入用户管理
		pb = toolsService.toolsM(currentPage, pageSize, key);
		this.setPb(pb);
		return "success";
	}

	@Action(value = "/skin-admin/addT", results = {
			@Result(name = "success", location = "/skin-admin/toolsM", type = "redirect") })
	public String addT() {// 账户已存在未做
		toolsService.addT(t);
		return SUCCESS;
	}

	@Action(value = "/skin-admin/updateT")
	public void updateT() {
		t = gson.fromJson(request.getParameter("formdata"), Tools.class);
		toolsService.updateT(t);
	}

	@Action(value = "/skin-admin/editT")
	public void editT() {
		int tId = Integer.parseInt(request.getParameter("formdata"));
		t = toolsService.findT(tId);
		Struts2Utils.renderJson(t);
	}

	@Action(value = "/skin-admin/delT")
	public void delT() {
		int tId = Integer.parseInt(request.getParameter("formdata"));
		t = toolsService.findT(tId);
		toolsService.delT(t);
	}
	@Action(value = "findToolsType")
	public void findToolsType() {
		List<String> ls = new ArrayList<>();
		ls=toolsService.findToolsType();
		String json=gson.toJson(ls);
		Struts2Utils.renderJson(json);
	}
	@Action(value = "toolsShow")
	public void toolsShow() {
		try {toolsType=request.getParameter("toolsType");} catch (Exception e) {e.printStackTrace();}
		try {currentPage=Integer.parseInt(request.getParameter("currentPage"));} catch (Exception e) {e.printStackTrace();}
		try {key=request.getParameter("key");} catch (Exception e) {e.printStackTrace();}
		pageSize=12;
		System.out.println("toolsType"+toolsType);
		System.out.println("currentPage"+currentPage);
		System.out.println("key"+key);
		pb=toolsService.findToolsPager(currentPage,pageSize,toolsType,key);
		Struts2Utils.renderJson(pb);
	}
	@Action(value = "/skin-admin/toolsMPage", results = {
			@Result(name = "success", location = "/skin-admin/toolsM.jsp") })
	public String toolsMPage() {// 切换页码跳转内容
		key = request.getParameter("key");
		String msg = request.getParameter("currentPage");
		if (msg != null) {
			currentPage = Integer.parseInt(msg);
		}
		pb = toolsService.toolsM(currentPage, pageSize, key);
		System.out.println(pb.toString());
		this.setPb(pb);
		return "success";
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
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

	public Pager<Tools> getPb() {
		return pb;
	}

	public void setPb(Pager<Tools> pb) {
		this.pb = pb;
	}

	public Tools getT() {
		return t;
	}

	public void setT(Tools t) {
		this.t = t;
	}

	@Override
	public Tools getModel() {
		// TODO Auto-generated method stub
		return t;
	}

}
