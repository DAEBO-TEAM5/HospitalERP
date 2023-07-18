package hospital.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.Member2Dao;

/** 임시코드를 발급받은 후, 새 비밀번호로 변경하는 페이지 요청을 처리하는 클래스 */
public class MemberChangePwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
			ActionForward forward = null;
		
		HttpSession session = req.getSession(false);
		if ((String) session.getAttribute("isLogin") != null) {
			// 로그인된 상태
			session.invalidate();

			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out;
			try {
				out = resp.getWriter();
				out.println("<script>");
				out.println("alert('접근 권한이 없습니다.');");
				out.println("closePopup4();");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			// 비로그인 상태
			String authCode = req.getParameter("authenCode");
			String pwd = req.getParameter("newPw");
		
			if (((String) session.getAttribute("authCode")).equals(authCode)) {
				
				// 인증코드가 저장된 속성이 있는 경우
				String id = (String) session.getAttribute("id");
				Member2Dao dao = new Member2Dao();
				dao.updatePw(id, pwd);
				forward = new ActionForward();
				forward.setPath("/login.do");
				forward.setRedirect(false);
			} else {
				
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
			}
		}
		return forward;
	}
}