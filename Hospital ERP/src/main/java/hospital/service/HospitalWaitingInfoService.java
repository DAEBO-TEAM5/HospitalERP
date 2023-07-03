package hospital.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.PatientDao;

public class HospitalWaitingInfoService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		try {
			PatientDao dao = new PatientDao();
			String num = request.getParameter("num");
			ArrayList<String> list = new ArrayList<>();
			list = dao.getWaitingInfo(Integer.parseInt(num));   //return 값 받아서 request.setA~
			
			request.setAttribute("num", list.get(0));
			request.setAttribute("name", list.get(1));
			request.setAttribute("birth", list.get(2));
			request.setAttribute("sex", list.get(3));
			request.setAttribute("symptom", list.get(4));
			
			System.out.println("Waitinginfo : "+list); ////////////////////////////////////
			
			forward = new ActionForward();
			forward.setRedirect(false); // forward
			forward.setPath("/WEB-INF/views/main/mainIndex.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return forward;
	}


}
