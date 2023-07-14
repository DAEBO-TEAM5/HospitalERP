package hospital.service;

import java.io.IOException;
import java.io.PrintWriter;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.utils.NaverMailSend;
import hospital.vo.LoginVO;

public class MemberForgotPwProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = null;

		HttpSession session = req.getSession(true);
		if ((String) session.getAttribute("isLogin") != null) {
			// 로그인된 상태
			session.invalidate();

			resp.setContentType("text/html;charset=utf-8");
			
			PrintWriter out ;
			try {
				out=resp.getWriter();
				out.println("<script>");
				out.println("alert('접근 권한이 없습니다.');");
				out.println("location.href='/login.jsp';");
				out.println("</script>");
				out.flush();
				System.out.println("여기는요????");
			} catch (IOException e) {
				e.printStackTrace();
			} 
		}

		/* DB 처리 */
		String h_email = req.getParameter("h_email");
		String h_id = req.getParameter("h_id");
		System.out.println(h_email+","+h_id);

		MemberForgotPwProService service = new MemberForgotPwProService();
		LoginVO vo = (LoginVO) service.getMember(h_id, h_email);
		//System.out.println(vo.getH_email());
		if (vo == null || !vo.getH_email().equals(h_email)) {
			// 회원 정보가 일치하지 않은 경우
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out;
			try {
				 out= resp.getWriter();
				out.println("<script>");
				out.println("alert('회원 정보가 존재하지 않습니다.');");
				out.println("history.back();");
				out.println("</script>");
				 out.flush();
				System.out.println("디비처리는되나요?");
			} catch (IOException e) {
				e.printStackTrace();
			} 
			
		} else {
			/* 메일 전송 */
			NaverMailSend mailSend = new NaverMailSend();
			String authenticationCode;
			try {
				authenticationCode = mailSend.sendEmail(h_email);
				/* 포워딩 처리 */
				session.setAttribute("authenticationCode", authenticationCode);
				session.setAttribute("h_id", h_id);
				System.out.println("아이디왔나요?");
				
				//forward = new ActionForward();
				//forward.setPath("/memberChangePw.do");
				System.out.println("체인지포스풔드");
				//forward.setRedirect(true);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return forward;
	}
}