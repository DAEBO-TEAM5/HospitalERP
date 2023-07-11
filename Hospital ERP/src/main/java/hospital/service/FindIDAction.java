package hospital.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.FindIdDao;
import hospital.dao.LoginDao;
import hospital.dao.MemberDao;

public class FindIDAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		   ActionForward forward = new ActionForward();
		   
		   String h_name = request.getParameter("h_name");
		   String h_email = request.getParameter("h_email");
	        
	        FindIdDao dao = new FindIdDao();
	        String result = dao.findId(h_name, h_email);
	        
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out;
//	        try {
//	            out = response.getWriter();
//	            if (h_id != null) {
//	                out.print(h_id); // 찾은 아이디 반환
//	            } else {
//	                out.print("not_found"); // 아이디를 찾을 수 없음
//	            }
//	            out.close();
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	        }

	        return forward;
	    }
	}