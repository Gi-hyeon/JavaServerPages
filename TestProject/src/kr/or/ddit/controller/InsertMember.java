package kr.or.ddit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.IMemberService;
import kr.or.ddit.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

/**
 * Servlet implementation class InsertMember
 */
@WebServlet("/insertMember.do")
public class InsertMember extends HttpServlet {
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
		String name = request.getParameter("name");
		
		System.out.println("id : " + id + ", pw : " + pw + ", name : " + name);
		
		MemberVO vo = new MemberVO();
		vo.setMem_id(id);
		vo.setMem_pw(pw);
		vo.setMem_name(name);
		
		IMemberService service = MemberServiceImpl.getService();
		
		int cnt = service.insertMember(vo);
		
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("/WEB-INF/views/board/cntResult.jsp").forward(request, response);
		
	}

}
