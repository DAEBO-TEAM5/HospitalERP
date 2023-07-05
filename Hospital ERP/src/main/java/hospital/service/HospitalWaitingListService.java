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

public class HospitalWaitingListService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		try {
			PatientDao dao = new PatientDao();
			ArrayList<PatientVO> list = new ArrayList<>();
			list = dao.getWaitingList();   
			
			//System.out.println("WaitingList : "+list); ////////////////////////////////////
			
			request.setAttribute("list", list);
			
			//forward = new ActionForward();
			//forward.setRedirect(false); // forward
			//forward.setPath("/WEB-INF/views/main/mainIndex.jsp");
			
			JSONObject waitinglist = new JSONObject();
			JSONArray listarray = new JSONArray();
			JSONObject sendObject = new JSONObject();
			
			for(int i=0; i<list.size(); i++) {
				waitinglist = new JSONObject();
				waitinglist.put("num", list.get(i).getNum());
				waitinglist.put("name", list.get(i).getName());
				waitinglist.put("birth", list.get(i).getBirth());
				waitinglist.put("sex", list.get(i).getSex());
				
				//System.out.println(waitinglist);  ////////////////////////////////////////
				//System.out.println("add전 listarray================="+listarray);
				listarray.add(waitinglist);
				//System.out.println("listarray::::::::"+listarray);
				
			}
			sendObject.put("waitList", listarray);
			
			//System.out.println(listarray);  ////////////////////////////////////
			//System.out.println(sendObject);  ////////////////////////////////////////
			
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return forward;
	}

	
}
