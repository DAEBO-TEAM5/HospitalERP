package hospital.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.HospitalDao;
import hospital.dao.PatientDao;
import hospital.dao.RecordDao;
import hospital.vo.PatientVO;
import hospital.vo.RecordVO;
import hospital.vo.patientRecordVO;
import hospital.vo.paymentVO;

public class InfoServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		int p_num = Integer.parseInt(request.getParameter("p_num"));
		HospitalDao dao = new HospitalDao();

		// PatientDao dao = new PatientDao();
		PatientVO patientvo = dao.patientInfo(p_num); // 환자 정보 얻어옴

		JSONObject sendObject = new JSONObject();
		JSONArray sendArray = new JSONArray();
		JSONObject jobj = new JSONObject();
		JSONArray objArr = new JSONArray();
		JSONObject obj = new JSONObject();

		jobj.put("num", patientvo.getNum());
		jobj.put("name", patientvo.getName());
		jobj.put("birth", patientvo.getBirth());
		jobj.put("phone", patientvo.getPhone());
		jobj.put("address", patientvo.getAddress());
		jobj.put("sex", patientvo.getSex());
		jobj.put("note", patientvo.getNote());

		sendArray.add(jobj); // 환자정보

		ArrayList<RecordVO> recordVo = dao.GetRecordNum(p_num); // 레코드 번호 모음
		HashMap<String, Integer> medlist = new HashMap<>();
		HashMap<String, Integer> thlist = new HashMap<>();
		
		
		for (RecordVO v : recordVo) { // 진료번호대로(날짜순)
			jobj = new JSONObject();
			Date d = v.getR_date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String date = format.format(d);
			jobj.put("date", date); // 진료 날짜

			String d_name = dao.DiesaseName(v.getR_d_code()); // 질병명
			jobj.put("disease", d_name); // 질병명
			jobj.put("opinion", v.getR_opinion()); // 증상
			jobj.put("symptom", v.getR_symptom()); // 방문 목적

			System.out.println("진료번호-----------" + v.getR_num());
			medlist = dao.MedName(v.getR_num()); // 약품명, 사용량
			thlist = dao.ThName(v.getR_num()); // 물리치료명, 가격
			String e_name = dao.EmployeeName(v.getR_e_code()); // 직원명, (의사)
			jobj.put("e_name", e_name);
			objArr = new JSONArray();

			for (String key : medlist.keySet()) {
				obj = new JSONObject();
				obj.put("medName", key);
				obj.put("use", medlist.get(key));
				objArr.add(obj);
			}
			jobj.put("med", objArr);

			objArr = new JSONArray();
			for (String key : thlist.keySet()) {
				obj = new JSONObject();
				obj.put("thName", key);
				obj.put("price", thlist.get(key));
				objArr.add(obj);
			}
			jobj.put("therapy", objArr);
			
			paymentVO paymentVo = dao.GetPayment(v.getR_num());
			jobj.put("pay_amount", paymentVo.getPay_amount());
			jobj.put("pay_basic", paymentVo.getPay_basic());
			jobj.put("pay_cash", paymentVo.getPay_cash());
			jobj.put("pay_card", paymentVo.getPay_card());

			sendArray.add(jobj); // 진료 날짜 순
		}

		sendObject.put("info", sendArray);

		try {
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
		} catch (IOException e) {
			e.printStackTrace();
		}

		request.setAttribute("jobj", jobj);
		return null;
	}

}
