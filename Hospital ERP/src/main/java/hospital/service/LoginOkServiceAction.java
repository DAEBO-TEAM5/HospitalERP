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
	      System.out.println("됨?"+ h_id+h_pwd);

	      LoginDao dao = new LoginDao();
	      boolean isLogin = dao.loginCheck(h_id, h_pwd) > 0;
	      
	      if (isLogin) {
	         HttpSession session = request.getSession();
	         session.setAttribute("h_id", h_id);
	         System.out.println(h_id);
	         ret.setPath("main2.do");
	      }
	      else {
	    	  
	      }
	      ret.setRedirect(false);
	      return ret;
	   }

	}