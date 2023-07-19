package hospital.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.PatientDao;
import hospital.utils.ConnectionHelper;
import hospital.vo.PatientVO;
import hospital.vo.WaitVO;

public class HospitalWaitingListService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		try {
			PatientDao dao = new PatientDao();
			ArrayList<WaitVO> list = new ArrayList<>();
			list = dao.getWaitingList();   
			
			request.setAttribute("list", list);
			
			JSONObject waitinglist = new JSONObject();
			JSONArray listarray = new JSONArray();
			JSONObject sendObject = new JSONObject();
			
			for(int i=0; i<list.size(); i++) {
				waitinglist = new JSONObject();
				waitinglist.put("num", list.get(i).getNum());
				waitinglist.put("name", list.get(i).getName());
				waitinglist.put("birth", list.get(i).getBirth());
				waitinglist.put("sex", list.get(i).getSex());
				waitinglist.put("w_symptom", list.get(i).getW_symptom());
				waitinglist.put("w_num", list.get(i).getW_num());
				
				listarray.add(waitinglist);
				
			}
			sendObject.put("waitList", listarray);
			
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return forward;
	}

	
}
