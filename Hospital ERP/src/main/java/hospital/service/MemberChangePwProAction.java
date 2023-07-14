package hospital.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital.action.Action;
import hospital.action.ActionForward;

public class MemberChangePwProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = null;
		
		/* 브라우저에서 건너온 세션 확인 
		 * 로그인 상태에선 접근 못하게 설정 */
		HttpSession session = req.getSession(false);
		if(session != null) {
			// 세션이 생성되어 있는 경우
			if((String)session.getAttribute("isLogin") != null) {
				// 로그인된 상태
				session.invalidate();
				
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out;
				try {
					out = resp.getWriter();
					out.println("<script>");
					out.println("alert('접근 권한이 없습니다.');");
					out.println("location.href='/bookShopMain.ok';");
					out.println("</script>");
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else if((String) session.getAttribute("authenticationCode") != null){
				// 비로그인 상태 & 인증코드를 받은 경우
				
				String authenCode = req.getParameter("authenCode");
				if(((String) session.getAttribute("authenticationCode")).equals(authenCode)) {
					// 세션에 저장된 인증코드와 <input>값으로 넘어온 인증코드가 일치하는 경우
					
					String m_id = req.getParameter("m_id");
					String newPw = req.getParameter("newPw");
					boolean updateResult = false;
					
					/* DB 작업 */
					MemberChangePwProService service = new MemberChangePwProService();
					updateResult = service.updatePw(m_id, newPw);
					if(updateResult) {
						// 수정 성공
						resp.setContentType("text/html;charset=utf-8");
						PrintWriter out;
						try {
							out = resp.getWriter();
							out.println("<script>");
							out.println("alert('정상적으로 수정되었습니다. 로그인 페이지로 돌아갑니다.');");
							out.println("location.href='/login.do'");
							out.println("</script>");
						} catch (IOException e) {
							e.printStackTrace();
						}
					} else {
						resp.setContentType("text/html;charset=utf-8");
						PrintWriter out;
						try {
							out = resp.getWriter();
							out.println("<script>");
							out.println("alert('비밀번호 수정에 실패했습니다.');");
							out.println("history.back(-1);");
							out.println("</script>");
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				} 
			} else {
				// 인증코드가 없는 경우
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out;
				try {
					out = resp.getWriter();
					out.println("<script>");
					out.println("alert('접근 권한이 없습니다.');");
					out.println("location.href='/bookShopMain.ok';");
					out.println("</script>");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			// 세션 생성 X 
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out;
			try {
				out = resp.getWriter();
				out.println("<script>");
				out.println("alert('접근 권한이 없습니다.');");
				out.println("location.href='/bookShopMain.ok';");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return forward;
	}

}