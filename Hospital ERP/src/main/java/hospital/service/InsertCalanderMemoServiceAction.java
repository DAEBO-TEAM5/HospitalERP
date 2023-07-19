package hospital.service;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.MemoDao;

public class InsertCalanderMemoServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String memo = request.getParameter("memo");
		String date = request.getParameter("date");
		
		HttpSession session = request.getSession();
		String e_code = (String) session.getAttribute("h_e_code");
		int ecode = Integer.parseInt(e_code);
		
		MemoDao dao = new MemoDao();
		dao.insertMemo(memo, date, ecode);
		
		return null;
	}

}
