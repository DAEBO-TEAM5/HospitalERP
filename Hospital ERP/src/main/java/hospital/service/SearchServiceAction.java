package hospital.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.HospitalDao;
import hospital.vo.patientRecordVO;

public class SearchServiceAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String name = request.getParameter("name");
		System.out.println(name);
		HospitalDao dao = new HospitalDao();
		patientRecordVO vo = dao.searchOK(name);
		
		
		JSONObject sendObject = new JSONObject();
		JSONObject jobj = new JSONObject();
		JSONArray sendArray = new JSONArray();
		
		jobj.put("disease", vo.getDisease());
		jobj.put("doctor", vo.getDoctor());
		sendArray.add(jobj);
		sendObject.put("list", sendArray);
		
		if(vo == null) {
			sendObject = new JSONObject();
			sendObject.put("empty", "empty");
		}
		
		try {
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("jobj", jobj);
		return null;
	}

}
