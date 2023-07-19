package hospital.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.MemoDao;

public class LoadCalendarMemoServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String date = request.getParameter("date");
		System.out.println(date);
		
		MemoDao dao = new MemoDao();
		
		HttpSession session = request.getSession();
		int ecode = (int) session.getAttribute("h_e_id");
		
		try {
			String memo = dao.fetchMemo(date, ecode);
			
			
			JSONObject sendObject = new JSONObject();
			sendObject.put("memo", memo);
			
			
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		return null;
	}

}
