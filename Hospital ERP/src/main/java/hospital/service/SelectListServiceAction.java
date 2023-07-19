package hospital.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.RecordDao;

public class SelectListServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		try {
			RecordDao dao = new RecordDao();
			
			LinkedHashMap<String, Integer> list = new LinkedHashMap<>();
			list = dao.medicineList(); 
			request.setAttribute("mList", list);
			
			JSONObject medObj = new JSONObject();
			JSONArray sendArray = new JSONArray();
			JSONObject sendObject = new JSONObject();
			JSONArray hapArrap = new JSONArray();
			JSONArray tArray = new JSONArray();
			JSONArray dArray = new JSONArray();
			
			for(String str: list.keySet()) {
				medObj = new JSONObject();
				medObj.put("m_name", str);
				medObj.put("m_code", list.get(str));
				sendArray.add(medObj);
			}
			
			ArrayList<String> tlist = new ArrayList<>();
			ArrayList<String> dlist = new ArrayList<>();
			tlist = dao.SelectList("therapy", "t_name");
			dlist = dao.SelectList("disease", "d_name");
			
			for(String s: tlist) {
				tArray.add(s);
			}
			
			for(String s: dlist) {
				dArray.add(s);
			}
			
			hapArrap.add(sendArray);
			hapArrap.add(tArray);
			hapArrap.add(dArray);
			
			sendObject.put("final", hapArrap);
			
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return null;
	}
}
