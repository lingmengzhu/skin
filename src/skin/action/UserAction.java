package skin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import skin.entity.User;
import skin.service.UserService;
import skin.util.Pager;
import skin.util.Struts2Utils;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User>, ServletRequestAware, ServletResponseAware {
	@Autowired
	private UserService userService;
	private static final long serialVersionUID = 1L;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	private int currentPage = 1; // 当前页
	private int pageSize = 8;// 默认每页显示条数
	private String key = "";
	private Pager<User> pb;
	public User u;
	private Gson gson = new Gson();

	@Action(value = "addU")
	public void addU() {// 账户已存在未做
		u = gson.fromJson(request.getParameter("formdata"), User.class);
		userService.addU(u);
		u.setUserName("1");
		Struts2Utils.renderJson(u);
	}

	@Action(value = "loginU")
	public void loginU() {
		Gson gson = new Gson();
		u= gson.fromJson(request.getParameter("formdata"), User.class);
		User existUser = userService.findU(u.getUserName());
		if (existUser != null && existUser.getPassword().equals(u.getPassword())) {
			u.setUserName("1");
		} else {
			u.setUserName("0");
		}
		Struts2Utils.renderJson(u);
	}

	@Action(value = "/skin-admin/userM", results = { @Result(name = "success", location = "/skin-admin/userM.jsp") })
	public String userM() {// 查询用户 进入用户管理
		pb = userService.userM(currentPage, pageSize, key);
		this.setPb(pb);
		return "success";
	}

	@Action(value = "/skin-admin/updateU")
	public void updateU() {
		u= gson.fromJson(request.getParameter("formdata"), User.class);
		userService.updateU(u);
	}

	@Action(value = "/skin-admin/editU")
	public void editU() {
		String uName = request.getParameter("formdata");
		u= userService.findU(uName);
		Struts2Utils.renderJson(u);
	}

	@Action(value = "/skin-admin/delU")
	public void delU() {
		String uName = request.getParameter("formdata");
		u= userService.findU(uName);
		userService.delU(u);
	}

	@Action(value = "/skin-admin/userMPage", results = {
			@Result(name = "success", location = "/skin-admin/userM.jsp") })
	public String userMPage() {// 切换页码跳转内容
		key = request.getParameter("key");
		String msg=request.getParameter("currentPage");
		if(msg!=null){
		currentPage = Integer.parseInt(msg);
		}
		pb = userService.userM(currentPage, pageSize, key);
		System.out.println(pb.toString());
		this.setPb(pb);
		return "success";
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

	public Pager<User> getPb() {
		return pb;
	}

	public void setPb(Pager<User> pb) {
		this.pb = pb;
	}


	public User getU() {
		return u;
	}

	public void setU(User u) {
		this.u = u;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public User getModel() {
		return u;
	}
}
