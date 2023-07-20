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
		String height = request.getParameter("height");
		String weight = request.getParameter("weight");
		
		String result = "";
		
		vo.setName(name);
		vo.setPhone(phone);
		vo.setBirth(birth);
		String symptom = request.getParameter("symptom");
		int pnum=0;
		
		if(phone.isEmpty()) {
			vo = dao.getPatientInfo(name, birth);
			pnum = vo.getNum();
			if(vo.getNum()!=0) {
				dao.InsertWait(symptom, pnum);
				result = "success";
			}
			else result = "first"; //해당하는 환자 없음
		}
		else {
			vo.setAddress(request.getParameter("address"));
			vo.setSex(request.getParameter("gender"));
			if(height != "") vo.setHeight(Integer.parseInt(height));
			if(weight != "") vo.setWeight(Integer.parseInt(weight));
			vo.setNote(request.getParameter("note"));

			pnum = dao.InsertPatient(vo);
			
			if(pnum != 0) {
				dao.InsertWait(symptom, pnum);
				result = "success--";
			}
			else result = "insert"; //입력실패
		}
		
		
		try {
			
			JSONObject sendObject = new JSONObject();
			sendObject.put("res", result);
			
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
