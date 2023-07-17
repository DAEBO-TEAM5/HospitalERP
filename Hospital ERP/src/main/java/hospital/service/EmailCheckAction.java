package hospital.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.EmailDao;
import hospital.dao.MemberDao;

public class EmailCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
        
        String h_email = request.getParameter("h_email");
        
        EmailDao dao = new EmailDao();
        boolean result = dao.EmailCheck(h_email);
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out;
        try {
            out = response.getWriter();
            if (result) {
                out.print("duplicate"); // 이메일 중복
            } else {
                out.print("available"); // 사용 가능한 이메일
            }
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return forward;
    }
}
