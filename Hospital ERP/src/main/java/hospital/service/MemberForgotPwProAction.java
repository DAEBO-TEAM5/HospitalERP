package hospital.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.MemberDao;
import hospital.utils.NaverMailSend;
import hospital.vo.LoginVO;


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
				out.println("<script>" + "alert('접근 권한이 없습니다.');" + "location.href='/login.do';" + "</script>");
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;

		} else {

			String h_email = req.getParameter("h_email");
			String h_id = req.getParameter("h_id");

			MemberDao dao = new MemberDao();
			LoginVO vo = (LoginVO) dao.getMember(h_id, h_email);
			
			if (vo == null || !vo.getH_id().equals(h_id) || !vo.getH_email().equals(h_email)) {
				try {
					resp.sendError(404);
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {

				NaverMailSend mailSend = new NaverMailSend();

				try {
					String authenticationCode = mailSend.sendEmail(h_email);
					session.setAttribute("authCode", authenticationCode);
					session.setAttribute("id", h_id);

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