package hospital.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.MemberDao;

public class MemberIdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null;

		String h_id = request.getParameter("h_id");

		MemberDao dao = new MemberDao();
		boolean result = dao.duplicateIdCheck(h_id);

		response.setContentType("text/html;charset=UTF-8");
		boolean result1 = h_id.matches("^[a-zA-Z0-9]{4,12}$");
		PrintWriter out;
		try {
			out = response.getWriter();
			if (result) {
				out.print("duplicate"); // 아이디 중복
			} else {
				if (!result1) {
					out.print("null");
				} else {
					out.print("available"); // 사용 가능한 아이디
				}
			}
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return forward;
	}
}