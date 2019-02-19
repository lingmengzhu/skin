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

import net.sf.json.JSONArray;
import skin.entity.ProductsType;
import skin.service.ProductsTypeService;
import skin.util.Pager;
import skin.util.Struts2Utils;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("productsTypeAction")
@Scope("prototype")
public class ProductsTypeAction extends ActionSupport
		implements ModelDriven<ProductsType>, ServletRequestAware, ServletResponseAware {
	@Autowired
	private ProductsTypeService productsTypeService;
	private static final long serialVersionUID = 1L;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	private int currentPage = 1; // 当前页
	private int pageSize = 8;// 默认每页显示条数
	private String key = "";
	private List<ProductsType> list;
	private Pager<ProductsType> pb;
	private Gson gson = new Gson();
	public ProductsType pt;
	
	@Action(value = "/skin-admin/productstypeM", results = { @Result(name = "success", location = "/skin-admin/productstypeM.jsp") })
	public String productstypeM() {// 查询产品分类 进入产品分类管理
		pb = productsTypeService.productstypeM(currentPage, pageSize, key);
		this.setPb(pb);
		return "success";
	}
	@Action(value = "/skin-admin/addPT",results = { @Result(name = "success", location = "/skin-admin/productstypeM", type = "redirect") })
	public String addPT() {// 产品已存在未做
		productsTypeService.addPT(pt);
		return SUCCESS;
	}
	@Action(value = "/skin-admin/findTypeOne")
	public void findTypeOne() {// 产品已存在未做
		list=productsTypeService.findTypeOne();
		String json=gson.toJson(list);
		Struts2Utils.renderJson(json);
	}
	@Action(value = "/findFunction")
	public void findFunction() {// 产品已存在未做
		List<String> ls = new ArrayList<>();
		ls=productsTypeService.findFunction();
		String json=gson.toJson(ls);
		Struts2Utils.renderJson(json);
	}
	@Action(value = "/findType")
	public void findType() {// 产品已存在未做
		String productsFunctionTitle=request.getParameter("formdata");
		list=productsTypeService.findTypeNameByFunction(productsFunctionTitle);
		List<String> ls = new ArrayList<>();
		for(int i = 0;i < list.size(); i ++){
			ls.add(list.get(i).getProductsTypeName());
		}
	    String json=gson.toJson(ls);
		Struts2Utils.renderJson(json);
		}
	@Action(value = "/skin-admin/findPt")
	public void findPt() {// 产品已存在未做
		int productsTypeId=Integer.parseInt(request.getParameter("formdata"));
		pt=productsTypeService.findPt(productsTypeId);
		Struts2Utils.renderJson(pt);
	}
	@Action(value = "/skin-admin/findProductsTypeId")
	public void findProductsTypeId() {// 产品已存在未做
		String productsFunctionTitle=request.getParameter("productsFunctionTitle");
		String productsTypeName=request.getParameter("productsTypeName");
		pt=productsTypeService.findProductsTypeId(productsFunctionTitle,productsTypeName);
		String json=gson.toJson(pt.getProductsTypeId());
		Struts2Utils.renderJson(json);
	}
	@Action(value = "/skin-admin/findTypeNameByFunction")
	public void findTypeNameByFunction() {// 产品已存在未做
		String productsFunctionTitle=request.getParameter("formdata");
		list=productsTypeService.findTypeNameByFunction(productsFunctionTitle);
		List<String> ls = new ArrayList<>();
		for(int i = 0;i < list.size(); i ++){
			ls.add(list.get(i).getProductsTypeName());
		}
	    String json=gson.toJson(ls);
		Struts2Utils.renderJson(json);
		}
	
	@Action(value = "/skin-admin/updatePT")
	public void updatePT() {
		pt = gson.fromJson(request.getParameter("formdata"), ProductsType.class);
		productsTypeService.updatePT(pt);
	}

	@Action(value = "/skin-admin/editPT")
	public void editPT() {
		int ptId = Integer.parseInt(request.getParameter("formdata"));
		pt = productsTypeService.findPT(ptId);
		Struts2Utils.renderJson(pt);
	}

	@Action(value = "/skin-admin/delPT")
	public void delPT() {
		int ptId = Integer.parseInt(request.getParameter("formdata"));
		pt = productsTypeService.findPT(ptId);
		productsTypeService.delPT(pt);
	}

	@Action(value = "/skin-admin/productstypeMPage", results = {
			@Result(name = "success", location = "/skin-admin/productstypeM.jsp") })
	public String productstypeMPage() {// 切换页码跳转内容
		key = request.getParameter("key");
		String msg=request.getParameter("currentPage");
		if(msg!=null){
		currentPage = Integer.parseInt(msg);
		}
		pb = productsTypeService.productstypeM(currentPage, pageSize, key);
		this.setPb(pb);
		request.setAttribute("pb", pb);
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

	public Pager<ProductsType> getPb() {
		return pb;
	}

	public void setPb(Pager<ProductsType> pb) {
		this.pb = pb;
	}
	
	public ProductsType getPt() {
		return pt;
	}
	public void setPt(ProductsType pt) {
		this.pt = pt;
	}
	public List<ProductsType> getList() {
		return list;
	}
	public void setList(List<ProductsType> list) {
		this.list = list;
	}
	@Override
	public ProductsType getModel() {
		// TODO Auto-generated method stub
		return pt;
	}
}
