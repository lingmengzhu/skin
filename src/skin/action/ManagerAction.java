package skin.action;

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

import skin.entity.Manager;
import skin.entity.User;
import skin.service.ManagerService;
import skin.util.Pager;
import skin.util.Struts2Utils;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("managerAction")
@Scope("prototype")
public class ManagerAction extends ActionSupport
		implements ModelDriven<Manager>, ServletRequestAware, ServletResponseAware {
	@Autowired 
	private ManagerService managerService;
	private static final long serialVersionUID = 1L;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	private int currentPage = 1; // 当前页
	private int pageSize = 8;// 默认每页显示条数
	private String key = "";
	private Pager<Manager> pb;
	private Manager m = new Manager();
	private Gson gson = new Gson();
	@Action(value = "MLogin")
	public void MLogin() {
		m=gson.fromJson(request.getParameter("formdata"),Manager.class);
		Manager existManager=managerService.MLogin(m);
		if(existManager!=null&&existManager.getManagerPassword().equals(m.getManagerPassword())) {
			request.getSession().setAttribute("managerName", m.getManagerName());
			m.setManagerName("1");
		}else {
			m.setManagerName("0");
		}
		Struts2Utils.renderJson(m);
	}
	@Action(value = "/skin-admin/managerM", results = { @Result(name = "success", location = "/skin-admin/managerM.jsp") })
	public String managerM() {// 查询用户 进入用户管理
		pb = managerService.managerM(currentPage, pageSize, key);
		System.out.println(pb.getContent().get(0).toString());
		this.setPb(pb);
		return "success";
	}
	@Action(value = "/skin-admin/updateM")
	public void updateM() {
		m= gson.fromJson(request.getParameter("formdata"), Manager.class);
		managerService.updateM(m);
	}

	@Action(value = "/skin-admin/editM")
	public void editM() {
		String mName = request.getParameter("formdata");
		m= managerService.findM(mName);
		Struts2Utils.renderJson(m);
	}

	@Action(value = "/skin-admin/delM")
	public void delM() {
		String mName = request.getParameter("formdata");
		m= managerService.findM(mName);
		managerService.delM(m);
	}

	@Action(value = "/skin-admin/managerMPage", results = {
			@Result(name = "success", location = "/skin-admin/managerM.jsp") })
	public String managerMPage() {// 切换页码跳转内容
		key = request.getParameter("key");
		String msg=request.getParameter("currentPage");
		if(msg!=null){
		currentPage = Integer.parseInt(msg);
		}
		pb = managerService.managerM(currentPage, pageSize, key);
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
	public Pager<Manager> getPb() {
		return pb;
	}
	public void setPb(Pager<Manager> pb) {
		this.pb = pb;
	}
	public Manager getM() {
		return m;
	}
	public void setM(Manager m) {
		this.m = m;
	}
	@Override
	public Manager getModel() {
		// TODO Auto-generated method stub
		return m;
	}
}
