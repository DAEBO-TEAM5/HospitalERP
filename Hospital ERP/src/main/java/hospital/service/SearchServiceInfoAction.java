package hospital.service;

import java.io.IOException;
import java.util.ArrayList;
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

public class SearchServiceInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String pattern = "^[0-9]*$";
		String search_str = request.getParameter("name");

		boolean check = false;
		if(search_str != null) {
			check = Pattern.matches(pattern, search_str);
		}
		HospitalDao dao = new HospitalDao();
		List<patientRecordVO> list = null;
		list = dao.searchInfo(search_str, check);
		
		JSONObject sendObject = new JSONObject();
		JSONArray sendArray = new JSONArray();
		JSONObject jobj = null;
		

		for(int i =0; i < list.size(); i++) {
			int pay_check = 1;
			jobj = new JSONObject();
			ArrayList<Integer> arr = dao.checkPay(list.get(i).getNum());
			if(arr.contains(0)) {
				pay_check = 0;
			}
			jobj.put("num", list.get(i).getNum());
			jobj.put("name", list.get(i).getName());
			jobj.put("birth", list.get(i).getBirth());
			jobj.put("phone", list.get(i).getPhone());
			jobj.put("address", list.get(i).getAddress());
			jobj.put("sex", list.get(i).getSex());
			jobj.put("note", list.get(i).getNote());
			jobj.put("pay_check", pay_check);
			
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
