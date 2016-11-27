package com.login.filter;
import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.*;

import com.emp.model.EmpVO;

@WebFilter(
		urlPatterns = { "/*" },
		initParams = { 
				@WebInitParam(name = "mustLogin1", value = "/discount/*") ,
				@WebInitParam(name = "mustLogin2", value = "/emp/*") ,
				@WebInitParam(name = "mustLogin3", value = "/chart/*") ,
				@WebInitParam(name = "mustLogin4", value = "/space/*") ,
				@WebInitParam(name = "mustLogin7", value = "/Package/*") ,
				@WebInitParam(name = "mustLogin8", value = "/product/*") ,
				@WebInitParam(name = "mustLogin8", value = "/schedule/schedule.jsp")
		}
		)
public class TitleFilter implements Filter {
	Collection<String> url = new ArrayList<String>();
	String servletPath;
	String contextPath;
	String requestURI;
	public void init(FilterConfig fConfig) throws ServletException {
		Enumeration<String> e = fConfig.getInitParameterNames();
		while (e.hasMoreElements()) {
			String path = e.nextElement();
			url.add(fConfig.getInitParameter(path));
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		boolean isRequestedSessionIdValid = false;
		if (request instanceof HttpServletRequest
				&& response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			servletPath = req.getServletPath();  
			contextPath = req.getContextPath();
			requestURI  = req.getRequestURI();
			isRequestedSessionIdValid = req.isRequestedSessionIdValid();
			
			if (mustLogin()) {
				if (checkLogin(req)) {   //  需要登入，已經登入
					chain.doFilter(request, response);
				} else {				//  需要登入，尚未登入
					HttpSession session = req.getSession();
					session.setAttribute("requestURI", requestURI);
					if ( ! isRequestedSessionIdValid ) {
						session.setAttribute("timeOut", "使用逾時，請重新登入");
					}
					resp.sendRedirect(contextPath + "/login/purview.jsp");
					return;
				}
			} else {   //不需要登入
				chain.doFilter(request, response);
			}
		} else {
			throw new ServletException("Request / Response 型態錯誤");
		}
	}
	private boolean checkLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		EmpVO loginToken = (EmpVO) session.getAttribute("TitleOK");
		if (loginToken== null) {
			return false;
		} else {
			return true;
		}
	}

	private boolean mustLogin() {
		boolean login = false;
		for (String sURL : url) {
			if (sURL.endsWith("*")) {
				sURL = sURL.substring(0, sURL.length() - 1);
				if (servletPath.startsWith(sURL)) {
					login = true;
					break;
				}
			} else {
				if (servletPath.equals(sURL)) {
					login = true;
					break;
				}
			}
		}
		return login;
	}
	@Override
	public void destroy() {
	}
}