package skin.filter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter extends HttpServlet implements Filter {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void destroy() {
    }

    public void doFilter(ServletRequest Request, ServletResponse Response,      
            FilterChain filterChain) throws IOException, ServletException{
        HttpServletRequest httprequest = (HttpServletRequest) Request;      
        HttpServletResponse httpresponse = (HttpServletResponse) Response;      
        HttpSession session = httprequest.getSession();      
        String url=httprequest.getServletPath();  
        String contextPath=httprequest.getContextPath();  
        if((url.startsWith("/skin-admin"))){//若访问后台资源 过滤到login  
             String manager=(String)session.getAttribute("managerName");
             if(manager==null){//转入管理员登陆页面  
            	 httpresponse.sendRedirect(contextPath+"/admin_login.jsp"); 
             }  
        }  
          filterChain.doFilter(Request,Response);    
    }  

    public void init(FilterConfig arg0) throws ServletException {
    }
}