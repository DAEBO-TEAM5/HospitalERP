package hospital.service;

import java.util.ArrayList;
import java.util.HashMap;

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
			//System.out.println("MedicineList 출력-----------");
			RecordDao dao = new RecordDao();
			
			HashMap<String, Integer> list = new HashMap<>();
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
			//System.out.println("MedicineInfo : "+list); ////////////////////////////////////
			
			ArrayList<String> tlist = new ArrayList<>();
			ArrayList<String> dlist = new ArrayList<>();
			tlist = dao.SelectList("therapy");
			dlist = dao.SelectList("disease");
			
			for(String s: tlist) {
				//medObj = new JSONObject();
				//medObj.put("t_name", s);
				tArray.add(s);
				//tArray.put("t_name", s);
			}
			
			for(String s: dlist) {
				//dArray.put("d_name", s);
				dArray.add(s);
			}
			
			hapArrap.add(sendArray);
			hapArrap.add(tArray);
			hapArrap.add(dArray);
			
			sendObject.put("final", hapArrap);
			
			//System.out.println(sendObject);
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return null;
	}
}
