package hospital.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.PatientDao;
import hospital.vo.PatientVO;

public class UpdatePatientInfoServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			PatientDao dao = new PatientDao();
			PatientVO vo = new PatientVO();
			
			String p_name = request.getParameter("name");
			String birth = request.getParameter("birth");
			
			int num = Integer.parseInt(request.getParameter("num"));
			vo.setNum(num);
			vo.setAddress(request.getParameter("address"));
			vo.setSex(request.getParameter("gender"));
			vo.setHeight(Integer.parseInt(request.getParameter("height")));
			vo.setWeight(Integer.parseInt(request.getParameter("weight")));
			vo.setNote(request.getParameter("note"));
			vo.setName(p_name);
			vo.setBirth(birth);
			vo.setPhone(request.getParameter("phone"));
			
			dao.UpdatePatient(vo);   
	
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}

}
