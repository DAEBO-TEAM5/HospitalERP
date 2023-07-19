package hospital.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.PatientDao;
import hospital.vo.PatientVO;

public class InsertPatientServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		PatientVO vo = new PatientVO();
		PatientDao dao = new PatientDao();
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		
		vo.setName(name);
		vo.setPhone(phone);
		vo.setBirth(birth);
		String symptom = request.getParameter("symptom");
		int pnum=0;
		
		if(phone.isEmpty()) {
			vo = dao.getPatientInfo(name, birth);
			pnum = vo.getNum();
			if(vo.getNum()!=0) dao.InsertWait(symptom, pnum);
		}
		else {
			vo.setAddress(request.getParameter("address"));
			vo.setSex(request.getParameter("gender"));
			vo.setHeight(Integer.parseInt(request.getParameter("height")));
			vo.setWeight(Integer.parseInt(request.getParameter("weight")));
			vo.setNote(request.getParameter("note"));

			pnum = dao.InsertPatient(vo);
			dao.InsertWait(symptom, pnum);
		}
		
		return null;
	}

}
