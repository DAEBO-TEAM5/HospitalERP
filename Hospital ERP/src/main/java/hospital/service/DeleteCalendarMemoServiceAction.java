package hospital.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.MemoDao;

public class DeleteCalendarMemoServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		String date = request.getParameter("date");
		
		MemoDao dao = new MemoDao();
		dao.deleteMemo(date);
		
		return null;
	}

}
