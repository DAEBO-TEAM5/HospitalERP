package hospital.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.LoginDao;

public class FindIDAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = new ActionForward();

		String h_name = request.getParameter("h_name");
		String h_email = request.getParameter("h_email");

		LoginDao dao = new LoginDao();
		String id = dao.findId(h_name, h_email);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();

			if (id != null) {
				// 아이디를 찾은 경우
				out.println("<script>");
				out.println("alert('회원님의 아이디는 " + id + "입니다.');");
				out.println("location.href='login.do';"); // 아이디를 찾은 후 리다이렉트할 페이지
				out.println("</script>");
			} else {
				// 아이디를 찾지 못한 경우
				out.println("<script>");
				out.println("alert('등록된 정보가 없습니다.');");
				out.println("history.back();"); // 이전 페이지로 돌아가기
				out.println("</script>");
			}

			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return forward;
	}
}