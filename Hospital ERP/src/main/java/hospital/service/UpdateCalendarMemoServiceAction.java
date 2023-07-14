package hospital.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.MemoDao;

public class UpdateCalendarMemoServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String memo = request.getParameter("memo");
		String date = request.getParameter("date");
		
		MemoDao dao = new MemoDao();
		dao.updateMemo(memo, date);
		
		return null;
	}

}
