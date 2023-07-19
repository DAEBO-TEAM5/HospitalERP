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

public class DailySalesServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		String date = request.getParameter("date1");
		List<Integer> list = null;
		HospitalDao dao = new HospitalDao();
		
		list = dao.rnumSearch(date);
		int today_sales = 0;
		for(int i = 0; i < list.size(); i++) {
			today_sales += dao.todaySales(list.get(i));
		}
		
		
		int avg_sales = dao.avgSales();
		int avg_visit = dao.avgVisit();
		
		JSONObject sendObject = new JSONObject();
		JSONArray sendArray = new JSONArray();
		JSONObject jobj = null;
		
		jobj = new JSONObject();
		jobj.put("today_sales", today_sales);
		jobj.put("avg_sales", avg_sales);
		jobj.put("avg_visit", avg_visit);
		jobj.put("today_visit1", list.size());
		sendArray.add(jobj);
		sendObject.put("sale_total", sendArray);
		
		try {
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("jobj", jobj);
		
		
		return null;
	}

}
