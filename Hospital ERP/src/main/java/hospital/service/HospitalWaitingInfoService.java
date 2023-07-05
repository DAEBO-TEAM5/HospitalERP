package hospital.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.PatientDao;

public class HospitalWaitingInfoService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		try {
			System.out.println("hospitalWaitingInfoService-----------");
			PatientDao dao = new PatientDao();
			String num = request.getParameter("num");
			
			System.out.println(num);
			
			ArrayList<String> list = new ArrayList<>();
			list = dao.getWaitingInfo(Integer.parseInt(num));   
			
			JSONObject sendObject = new JSONObject();
			
			sendObject.put("num", list.get(0));
			sendObject.put("name", list.get(1));
			sendObject.put("birth", list.get(2));
			sendObject.put("sex", list.get(3));
			sendObject.put("symptom", list.get(4));
			//System.out.println("birth: "+list.get(2));
			
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
			
			System.out.println("Waitinginfo : "+list); ////////////////////////////////////
			
//			forward = new ActionForward();
//			forward.setRedirect(false); // forward
//			forward.setPath("/WEB-INF/views/main/mainIndex.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return null;
	}


}
