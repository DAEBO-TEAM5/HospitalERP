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
			PatientDao dao = new PatientDao();
			String num = request.getParameter("num");

			ArrayList<String> list = new ArrayList<>();
			list = dao.getWaitingInfo(Integer.parseInt(num));   
			
			JSONObject sendObject = new JSONObject();
			
			sendObject.put("num", list.get(0));
			sendObject.put("name", list.get(1));
			sendObject.put("address", list.get(2));
			sendObject.put("phone", list.get(3));
			sendObject.put("birth", list.get(4));
			sendObject.put("sex", list.get(5));
			sendObject.put("w_symptom", list.get(6));
			
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return null;
	}


}
