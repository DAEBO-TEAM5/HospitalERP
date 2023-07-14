package hospital.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital.action.Action;
import hospital.action.ActionForward;

public class MemberChangePwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req,
			HttpServletResponse resp) {
		System.out.println("여기까진오나욤?");
		ActionForward forward = null;
		
		/* 브라우저에서 건너온 세션 확인 
		 * 로그인 상태에선 접근 못하게 설정 */
		HttpSession session = req.getSession(false);
		if(session != null) {
			// 세션이 생성되어 있는 경우
			System.out.println((String)session.getAttribute("isLogin"));
			if((String)session.getAttribute("isLogin") != null) {
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
                		String authenticationCode =
                        			(String) session.getAttribute("authenticationCode");
				
                		if(authenticationCode != null) {				
                    			// 인증코드가 저장된 속성이 있는 경우
					forward = new ActionForward();
					forward.setPath("login.jsp");
					forward.setRedirect(false);
				} else {
					resp.setContentType("text/html;charset=utf-8");
					PrintWriter out;
					try {
						out = resp.getWriter();
						out.println("<script>");
						out.println("alert('잘못된 접근 권한입니다.');");
						out.println("location.href='/login.jsp';");
						out.println("</script>");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		} else {
			// 세션이 생성되지 않은 경우
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out;
			try {
				out = resp.getWriter();
				out.println("<script>");
				out.println("alert('잘못된 접근입니다.');");
				out.println("location.href='/login.jsp';");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return forward;
	}
}