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

public class SearchServiceDateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		String date = request.getParameter("date");
		HospitalDao dao = new HospitalDao();
		List<patientRecordVO> list = null;
		list = dao.searchDate(date);
		
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
			jobj.put("r_num", list.get(i).getR_num());

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
