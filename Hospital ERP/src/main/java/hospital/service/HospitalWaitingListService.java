package hospital.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			
			System.out.println("WaitingList : "+list); ////////////////////////////////////
			
			request.setAttribute("list", list);
			
			forward = new ActionForward();
			forward.setRedirect(false); // forward
			forward.setPath("/WEB-INF/views/main/mainIndex.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return forward;
	}

	
}
