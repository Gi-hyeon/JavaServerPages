package kr.or.ddit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.service.IMemberService;
import kr.or.ddit.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

/**
 * Servlet implementation class SelectAllMembers
 */
@WebServlet("/loginCheck.do")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println("LoginCheck id : " + id + ", pw : " + pw );
		
		
		IMemberService service = MemberServiceImpl.getService();
		
		MemberVO vo = service.selectMemberByIdPw(id, pw);
		System.out.println("vo check : " + vo);
		
		int cnt = 0;
		
		if (vo != null) {
			cnt = 1;
			HttpSession session = request.getSession();
			session.setAttribute("member", vo);
		} else {
			cnt = 0;
		}
		
		//System.out.println(request.getContextPath() + "/login.jsp");
		request.setAttribute("cnt", cnt);
		request.getRequestDispatcher("/WEB-INF/views/board/cntResult.jsp").forward(request, response);
	}

}
