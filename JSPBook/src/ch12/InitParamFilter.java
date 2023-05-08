package ch12;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class InitParamFilter implements Filter {
	
	private FilterConfig filterConfing = null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Filter02 초기화!!!");
		System.out.println("web.xml에 설정한 param을 담고 있는 filterConfig를 전역 변수 먼저 세팅 해준다.");
		System.out.println(filterConfig.getInitParameter("param1"));
		System.out.println(filterConfig.getInitParameter("param2"));
		this.filterConfing = filterConfig;
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("Filter02 수행...!");
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String param1 = filterConfing.getInitParameter("param1");
		String param2 = filterConfing.getInitParameter("param2");
		
		String msg = "";
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (id.equals(param1) && pw.equals(param2)) {
			msg = "로그인 성공했습니다!";
			request.setAttribute("msg", msg);
		} else {
			msg = "로그인 실패했습니다...";
			msg += "<a href='filter02.jsp'>Filter02 이동</a>";
			writer.println(msg);
			return;
		}
		
		chain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("Filter02 해제...");
	}

}














