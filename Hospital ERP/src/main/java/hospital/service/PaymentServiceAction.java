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

public class PaymentServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		int r_num = Integer.parseInt(request.getParameter("r_num"));
		int cash = Integer.parseInt(request.getParameter("cash"));
		int card = Integer.parseInt(request.getParameter("card"));
		
		System.out.println("r_num: " + r_num);
		System.out.println("cash: " + cash);
		System.out.println("card: " + card);
		
		
		HospitalDao dao = new HospitalDao();
		dao.UpdatePayment(r_num, cash, card);
		
		return null;
	}

}
