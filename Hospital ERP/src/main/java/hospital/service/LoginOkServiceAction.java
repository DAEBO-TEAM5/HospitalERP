package hospital.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.LoginDao;

public class LoginOkServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionForward ret = new ActionForward();

	      String h_id = request.getParameter("username");
	      String h_pwd = request.getParameter("password");

	      LoginDao dao = new LoginDao();
	      String h_e_code = dao.ecode(h_id);
	      boolean isLogin = dao.loginCheck(h_id, h_pwd) > 0;
	      
	      if (isLogin) {
	         HttpSession session = request.getSession();
	         session.setAttribute("h_id", h_id);
	         session.setAttribute("h_e_code", h_e_code);
	         
	         ret.setPath("main2.do");
	      }
	      else {
	    	  response.setContentType("text/html; charset=UTF-8");
	    	  request.setAttribute("script", "<script>alert('ID 비밀번호 확인해주세요')</script>");
	        ret.setPath("login.do");
	      }
	      ret.setRedirect(false);
	      return ret;
	   }

	}