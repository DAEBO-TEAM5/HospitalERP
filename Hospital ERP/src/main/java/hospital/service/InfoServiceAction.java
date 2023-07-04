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

public class InfoServiceAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String name = request.getParameter("name"); //환자 번호로 바꿔야함
		System.out.println("여기는 환자 상세정보 page " + name);
		HospitalDao dao = new HospitalDao();
		List<patientRecordVO> list = dao.searchOK(name);
		
		
		JSONObject sendObject = new JSONObject();
		JSONArray sendArray = new JSONArray();
		JSONObject jobj = null;
		for(int i =0; i < list.size(); i++) {
			jobj = new JSONObject();
			jobj.put("disease", list.get(i).getDisease());
			jobj.put("doctor", list.get(i).getDoctor());
			sendArray.add(jobj);
		}
		
		sendObject.put("list", sendArray);
		System.out.println(sendObject);
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
