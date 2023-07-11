package hospital.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//System.out.println(name+phone+birth);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setBirth(birth);
		String symptom = request.getParameter("symptom");
		
		if(phone.isEmpty()) {
			//System.out.println("정보 찾아오기");
			//System.out.println("name: "+name+" birth:"+birth);
			vo = dao.getPatientInfo(name, birth);
			//System.out.println("가져온이름"+vo.getName());
			//System.out.println(vo.getNum());
			if(vo.getNum()!=0) dao.InsertWait(symptom, vo.getNum());
		}
		else {
			//System.out.println("정보 넣기");
			
			vo.setAddress(request.getParameter("address"));
			vo.setSex(request.getParameter("gender"));
			vo.setHeight(Integer.parseInt(request.getParameter("height")));
			vo.setWeight(Integer.parseInt(request.getParameter("weight")));
			vo.setNote(request.getParameter("note"));

			int pnum = dao.InsertPatient(vo);
			dao.InsertWait(symptom, pnum);
			
		}
		
		return null;
	}

}
