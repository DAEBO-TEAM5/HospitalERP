package hospital.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.MemoDao;

public class UpdateCalendarMemoServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String memo = request.getParameter("memo");
		String date = request.getParameter("date");
		
		HttpSession session = request.getSession();
		int ecode = (int) session.getAttribute("h_e_id");
		
		MemoDao dao = new MemoDao();
		dao.updateMemo(memo, date, ecode);
		
		return null;
	}

}
