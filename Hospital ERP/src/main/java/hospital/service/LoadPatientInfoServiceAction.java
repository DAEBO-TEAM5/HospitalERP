package hospital.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.PatientDao;
import hospital.vo.PatientVO;

public class LoadPatientInfoServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			PatientDao dao = new PatientDao();
			PatientVO vo = new PatientVO();
			
			String p_name = request.getParameter("name");
			String birth = request.getParameter("birth");
			vo = dao.getPatientInfo(p_name, birth);   
			
			JSONObject sendObject = new JSONObject();
			
			sendObject.put("num", vo.getNum());
			sendObject.put("name", vo.getName());
			sendObject.put("birth", vo.getBirth());
			sendObject.put("sex", vo.getSex());
			sendObject.put("note", vo.getNote());
			sendObject.put("phone", vo.getPhone());
			sendObject.put("address", vo.getAddress());
			sendObject.put("height", vo.getHeight());
			sendObject.put("weight", vo.getWeight());
			
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return null;
	}

}
