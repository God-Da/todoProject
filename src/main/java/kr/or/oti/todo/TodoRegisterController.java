package kr.or.oti.todo;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.oti.todo.dto.MemberDTO;
import kr.or.oti.todo.dto.TodoDTO;
import kr.or.oti.todo.service.TodoService;

/**
 * Servlet implementation class TodoRegisterController
 */
@WebServlet("/todo/register")
public class TodoRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/todo/register.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//할일 등록 한다
		//세션에 저장해둔 memberDTO 객체를 가져온다
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo");
		
		String mid = memberDTO.getMid();
		
		
		String title = request.getParameter("title");
		String dueDate = request.getParameter("dueDate");

		System.out.println("title = " + title);
		System.out.println("dueDate = " + dueDate);
		System.out.println("mid = " + mid);
		TodoDTO todoDTO = TodoDTO.builder()
				.title(title)
				.dueDate(LocalDate.parse(dueDate))
				.mid(mid) //memberDTO에서 가져온 아이디 세팅 
				.build();
		
		try {
			TodoService.INSTANCE.register(todoDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//할일 등록 목록으로 이동한다 
		response.sendRedirect("/todo/list");
	}
}
