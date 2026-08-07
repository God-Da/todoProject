package kr.or.oti.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.oti.todo.service.MemberService;

/**
 * Servlet implementation class deleteMember
 */
@WebServlet("/deleteMember")
public class DeleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = MemberService.INSTANCE;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		// 사용자가 입력한 파라미터 값 받기
		String loginId = request.getParameter("loginId");
		
		
		try {            
            memberService.deleteMember(loginId);

            // 삭제 후 세션 무효화 및 로그인 페이지로 이동 
            request.getSession().invalidate();
            response.sendRedirect(request.getContextPath() + "/login?result=deleted");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/login?result=error");
        }
		
	}

}
