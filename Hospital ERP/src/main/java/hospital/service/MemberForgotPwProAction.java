package hospital.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.utils.NaverMailSend;
import hospital.vo.LoginVO;


/** 회원 비밀번호 찾기 요청을 처리하는 Action 클래스 */
public class MemberForgotPwProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
	    ActionForward forward = null;

	    HttpSession session = req.getSession(true);
	    if (session.getAttribute("isLogin") != null) {
	        // 로그인된 상태
			session.invalidate();
			
	        resp.setContentType("text/html;charset=utf-8");
	        PrintWriter out;
	        try {
	            out = resp.getWriter();
	            out.println("<script>" +
	            "alert('접근 권한이 없습니다.1');"+
	            "location.href='/login.do';"+
	            "</script>");
	            out.flush();
	            out.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        return null;
	    } else {
	        /* DB 처리 */
	        String h_email = req.getParameter("h_email");
	        String h_id = req.getParameter("h_id");

	        MemberForgotPwProService service = new MemberForgotPwProService();
	        LoginVO vo = (LoginVO) service.getMember(h_id, h_email);
			if (vo == null || !vo.getH_id().equals(h_id) || !vo.getH_email().equals(h_email)) {
				try {
					resp.sendError(404);
				} catch (IOException e) {
					e.printStackTrace();
				}
	        } else  {
	            /* 메일 전송 */
	            NaverMailSend mailSend = new NaverMailSend();
	            
	            try {
	            	String authenticationCode = mailSend.sendEmail(h_email);
	                session.setAttribute("authCode", authenticationCode);
	                session.setAttribute("id", h_id);
	                /* 포워딩 처리 */

	                forward = new ActionForward();
	                forward.setPath("./memberChangePw.do");
	                forward.setRedirect(true);
	                
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return forward;
	}
}