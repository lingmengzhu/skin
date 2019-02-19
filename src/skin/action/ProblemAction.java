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

import skin.entity.Problem;
import skin.entity.User;
import skin.service.ProblemService;
import skin.service.UserService;
import skin.util.Pager;
import skin.util.Struts2Utils;


@ParentPackage("struts-default")
@Namespace("/")
@Controller("problemAction")
@Scope("prototype")
public class ProblemAction extends ActionSupport
implements ModelDriven<Problem>, ServletRequestAware, ServletResponseAware {
	@Autowired
	private ProblemService problemService;
	private static final long serialVersionUID = 1L;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	private String condition="";
	private String problemName="";
	private List<Problem> list;
	private Gson gson = new Gson();
	public Problem pBlem;
	@Action(value = "/skin-admin/problemM")
	public void problemM() {
		condition=request.getParameter("problemCondition");
		problemName=request.getParameter("problemName");
		pBlem = problemService.problemM(condition,problemName);
		Struts2Utils.renderJson(pBlem);
	}
	@Action(value = "/skin-admin/updatePBlem")
	public void updatePBlem() {
		pBlem = gson.fromJson(request.getParameter("formdata"), Problem.class);
		System.out.println("duixiang"+pBlem.toString());
		problemService.updatePBlem(pBlem);
		Struts2Utils.renderJson(pBlem);
	}
	@Action(value = "/findByCondition",results = {
			@Result(name = "success", location = "/itemcontent.jsp") })
	public String findByCondition() {
		condition=request.getParameter("condition");
		list=problemService.findProblemNameByCondition(condition);
		System.out.println(list.size());
		request.setAttribute("list", list);
		return "success";
	}
	@Action(value = "/findByProblemName")
	public void findByProblemName() {
		problemName=request.getParameter("problemName");
		pBlem=problemService.problemM(condition,problemName);
		Struts2Utils.renderJson(pBlem);
	}
	@Action(value = "/skin-admin/findAllCondition")
	public void findAllCondition() {
		list=problemService.findAllCondition();
		List<String> ls = new ArrayList<>();
		for(int i = 0;i < list.size(); i ++){
			ls.add(list.get(i).getProblemCondition());
		}
	    String json=gson.toJson(ls);
		Struts2Utils.renderJson(json);
	}
	@Action(value = "/skin-admin/findProblemNameByCondition")
	public void findProblemNameByCondition() {
		condition=request.getParameter("formdata");
		list=problemService.findProblemNameByCondition(condition);
		List<String> ls = new ArrayList<>();
		for(int i = 0;i < list.size(); i ++){
			ls.add(list.get(i).getProblemName());
		}
	    String json=gson.toJson(ls);
		Struts2Utils.renderJson(json);
	}
	@Action(value = "/skin-admin/findProblemId")
	public void findProblemId() {
		condition=request.getParameter("problemCondition");
		problemName=request.getParameter("problemName");
		pBlem = problemService.problemM(condition,problemName);
		String json=gson.toJson(pBlem.getProblemId());
		Struts2Utils.renderJson(json);
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public List<Problem> getList() {
		return list;
	}
	public void setList(List<Problem> list) {
		this.list = list;
	}
	public Problem getpBlem() {
		return pBlem;
	}

	public void setpBlem(Problem pBlem) {
		this.pBlem = pBlem;
	}

	@Override
	public Problem getModel() {
		// TODO Auto-generated method stub
		return pBlem;
	}
}
