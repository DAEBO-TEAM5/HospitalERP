package hospital.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.JSONParser;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.RecordDao;
import hospital.vo.RecordVO;

public class InsertRecordServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			RecordDao dao = new RecordDao();
			
			String d_note = request.getParameter("note");
			//System.out.println("json 읽어온 노트 : "+d_note);
			
			String d = request.getParameter("dName");
			int dcode = dao.getCode("d_code", "disease", "d_name", d);   //질병코드
			
			String p_name = request.getParameter("p_name");    //
			System.out.println("환자이름----"+p_name);
			int p_code = dao.getCode("num", "patient", "name", p_name);    //환자코드
			
			//HttpSession session = request.getSession();
			//int h_id = (int) session.getAttribute("h_id");  //직원코드 -아직----
			
			int recordNum = dao.insertRecord(d_note, p_code,  dcode);    //직원코드까지 넣어야함
			
			System.out.println("***************recordNum****************"+recordNum);
			
			
			
			
			String medPres = request.getParameter("medPres");   //처방약 목록
			System.out.println("-----=----------==---------"+medPres);
			medPres = medPres.substring(1, medPres.length()-1);
			String[] medlist = medPres.split(",");
			for(int i=0; i<medlist.length; i+=2) {
				String medname = medlist[i];
				medname = medname.substring(11, medname.length()-1);
				//System.out.println(medname+"''''''''''''''''''");
				String use = medlist[i+1];
				use = use.substring(8, use.length()-2);
				//System.out.println(use+"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
				System.out.println("++++++++++++약이름: "+medname+" use: "+use+"++++++++++++");
				int m_code = dao.getCode("m_code", "medicine", "m_name", medname);
				dao.insertPrescription(m_code, Integer.parseInt(use), recordNum);
			}
			
			
			
			
			String tList = request.getParameter("tList");  //처방 물리치료 목록
			tList = tList.substring(1, tList.length()-1);
			String[] tlist = tList.split(",");
			for(String s: tlist) {
				s = s.substring(1, s.length()-1);
				//System.out.println(s);
				int tcode = dao.getCode("t_code", "therapy", "t_name", s);
				dao.insertTherapyMapping(tcode, recordNum);
			}
				
				
				
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}

}
