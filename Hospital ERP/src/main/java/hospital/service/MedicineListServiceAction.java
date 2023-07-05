package hospital.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.RecordDao;

public class MedicineListServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		try {
			System.out.println("MedicineList 출력-----------");
			RecordDao dao = new RecordDao();
			
			HashMap<String, Integer> list = new HashMap<>();
			list = dao.medicineList(); 
			request.setAttribute("mList", list);
			
			JSONObject medObj = new JSONObject();
			JSONArray sendArray = new JSONArray();
			JSONObject sendObject = new JSONObject();
			
//			for(int i=0; i<list.size(); i++) {
//				medObj = new JSONObject();
//				System.out.println(  );
//				medObj.put("m_name", list.get(0));
//				medObj.put("m_code", list.get(1));
//				sendArray.add(medObj);
//				System.out.println(sendArray);
//			}
			for(String str: list.keySet()) {
				medObj = new JSONObject();
				medObj.put("m_name", str);
				medObj.put("m_code", list.get(str));
				sendArray.add(medObj);
				//System.out.println(sendArray);
			}
			sendObject.put("list", sendArray);
			
			//System.out.println("birth: "+list.get(2));
			System.out.println(sendObject);
			
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
			
			System.out.println("MedicineInfo : "+list); ////////////////////////////////////
			
//			forward = new ActionForward();
//			forward.setRedirect(false); // forward
//			forward.setPath("/WEB-INF/views/main/mainIndex.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return null;
	}
}
