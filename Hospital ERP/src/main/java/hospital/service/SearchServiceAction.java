package hospital.service;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

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
		String pattern = "^[0-9]*$";
		String search_str = request.getParameter("name");
		String date = request.getParameter("date");
		boolean check = false;
		if(search_str != null) {
			check = Pattern.matches(pattern, search_str);
		}
		HospitalDao dao = new HospitalDao();
		List<patientRecordVO> list = null;
		if(date == null) {
			list = dao.searchOK(search_str, check, "검색");
		}else {
			list = dao.searchOK(date, check, "날짜");
		}
		
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
			jobj.put("r_ban", list.get(i).getR_ban());
			jobj.put("r_d_code", list.get(i).getR_d_code());
			jobj.put("symptom", list.get(i).getSymptom());
			jobj.put("p_amount", list.get(i).getP_amount());
			jobj.put("p_pay", list.get(i).getP_pay());
			jobj.put("p_r_num", list.get(i).getP_r_num());
			
			sendArray.add(jobj);
		}
		
		sendObject.put("list", sendArray);
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
