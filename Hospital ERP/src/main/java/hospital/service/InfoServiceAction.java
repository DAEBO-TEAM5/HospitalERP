package hospital.service;

import java.io.IOException;
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
		
		String p_num = request.getParameter("p_num"); //환자 번호로 바꿔야함
		
		HospitalDao dao = new HospitalDao();
		List<patientRecordVO> list = null;
		list = dao.infoSearch(p_num);

		
		JSONObject sendObject = new JSONObject();
		JSONArray sendArray = new JSONArray();
		JSONObject jobj = null;
		for(int i =0; i < list.size(); i++) {
			jobj = new JSONObject();
			jobj.put("num", list.get(i).getNum());
			jobj.put("name", list.get(i).getName());
			jobj.put("birth", list.get(i).getBirth());
			jobj.put("phone", list.get(i).getPhone());
			jobj.put("address", list.get(i).getAddress());
			jobj.put("sex", list.get(i).getSex());
			jobj.put("note", list.get(i).getNote());
			jobj.put("r_date", list.get(i).getR_date());
			
			sendArray.add(jobj);
		}
		
		sendObject.put("info", sendArray);
		
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
