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

import skin.entity.Products;
import skin.entity.ProductsType;
import skin.entity.User;
import skin.service.ProductsService;
import skin.service.ProductsTypeService;
import skin.util.Pager;
import skin.util.Struts2Utils;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("productsAction")
@Scope("prototype")
public class ProductsAction extends ActionSupport
		implements ModelDriven<Products>, ServletRequestAware, ServletResponseAware {
	@Autowired
	private ProductsService productsService;
	@Autowired
	private ProductsTypeService productsTypeService;
	private static final long serialVersionUID = 1L;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	private int currentPage = 1; // 当前页
	private int pageSize = 6;// 默认每页显示条数
	private String key = "";
	private List<Products> list;
	private Pager<Products> pb;
	public Products p;
	private Gson gson = new Gson();

	@Action(value = "/skin-admin/productsM", results = {
			@Result(name = "success", location = "/skin-admin/productsM.jsp") })
	public String productsM() {// 查询用户 进入用户管理
		pb = productsService.productsM(currentPage, pageSize, key);
		System.out.println(pb.toString());
		this.setPb(pb);
		return "success";
	}

	@Action(value = "/skin-admin/addP", results = {
			@Result(name = "success", location = "/skin-admin/productsM", type = "redirect") })
	public String addP() {// 产品已存在未做
		System.out.println("sss"+p.toString());
		productsService.addP(p);
		return SUCCESS;
	}

	@Action(value = "/skin-admin/updateP",results = {
			@Result(name = "success", location = "/skin-admin/productsM", type = "redirect") })
	public void updateP() {
		p = gson.fromJson(request.getParameter("formdata"),Products.class);
		System.out.println("sss"+p.toString());
		productsService.updateP(p);
	}

	@Action(value = "findPByTypeId")
	public void findPByTypeId() {
		int TId = Integer.parseInt(request.getParameter("TypeId"));
		list = productsService.findPByTypeId(TId);
		String json=gson.toJson(list);
		Struts2Utils.renderJson(json);
	}
	@Action(value = "findPByFunction")
	public void findPByFunction() {
		int TId = Integer.parseInt(request.getParameter("TypeId"));
		list = productsService.findPByFunction(TId);
		String json=gson.toJson(list);
		Struts2Utils.renderJson(json);
	}
	
	@Action(value = "/skin-admin/delP")
	public void delP() {
		int pId = Integer.parseInt(request.getParameter("formdata"));
		p = productsService.findP(pId);
		productsService.delP(p);
	}
	
	@Action(value = "findPDetial", results = {
			@Result(name = "success", location = "/productsInfo.jsp") })
	public String findPDetial() {
		int pId = Integer.parseInt(request.getParameter("productsId"));
		p = productsService.findP(pId);
		this.setP(p);
		return "success";
	}
	@Action(value = "/skin-admin/editP")
	public void editP() {
		int pId = Integer.parseInt(request.getParameter("formdata"));
		p = productsService.findP(pId);
		Struts2Utils.renderJson(p);
	}
	@Action(value = "/skin-admin/productsMPage", results = {
			@Result(name = "success", location = "/skin-admin/productsM.jsp") })
	public String productsMPage() {// 切换页码跳转内容
		key = request.getParameter("key");
		String msg=request.getParameter("currentPage");
		if(msg!=null){
		currentPage = Integer.parseInt(msg);
		}
		pb = productsService.productsM(currentPage, pageSize, key);
		this.setPb(pb);
		request.setAttribute("pb", pb);
		return "success";
	}
	@Action(value = "productsShow")
	public void productsShow() {
		int productsTypeId=0;
		try {
			String Type=request.getParameter("type");
			System.out.println("Type:"+Type);
			productsTypeId = productsTypeService.findTypeIdByTypeName(Type);
			System.out.println("productsTypeId:"+productsTypeId);
		} catch (Exception e) {e.printStackTrace();}
		try {currentPage=Integer.parseInt(request.getParameter("currentPage"));} catch (Exception e) {e.printStackTrace();}
		try {key=request.getParameter("key");} catch (Exception e) {e.printStackTrace();}
		pageSize=12;
		pb=productsService.findProductsPager(currentPage,pageSize,productsTypeId,key);
		Struts2Utils.renderJson(pb);
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public List<Products> getList() {
		return list;
	}

	public void setList(List<Products> list) {
		this.list = list;
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

	public Pager<Products> getPb() {
		return pb;
	}

	public void setPb(Pager<Products> pb) {
		this.pb = pb;
	}

	public Products getP() {
		return p;
	}

	public void setP(Products p) {
		this.p = p;
	}

	public Gson getGson() {
		return gson;
	}

	public void setGson(Gson gson) {
		this.gson = gson;
	}

	@Override
	public Products getModel() {
		// TODO Auto-generated method stub
		return p;
	}
}
