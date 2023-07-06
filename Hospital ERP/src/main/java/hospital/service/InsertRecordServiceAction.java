package hospital.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		//JSONParser parser = new JSONParser();
		
		try {
			RecordDao dao = new RecordDao();
			//dao.insertRecord();
			
			String d_note = request.getParameter("note");
			//HashMap<Object, Object> = request.getParameter("med");
			//Object obj = request.getParameter("med");
			System.out.println("json 읽어온 노트 : "+d_note);
			//System.out.println("json obj::::::::"+obj);
			String medPres = request.getParameter("medPres");
			System.out.println("-----=----------==---------"+medPres);
			
			//medPres.split(medPres)
			
			
			//JSONObject jsonObject = (JSONObject) parser.parse(reader);
			
			//JSONArray array = (JSONArray) json
			
			String tList = request.getParameter("tList");
			tList = tList.substring(1, tList.length()-1);
			System.out.println(tList.length());
			System.out.println(tList);
			
			String[] tlist = tList.split(",");
			for(String s: tlist) {
				s = s.substring(1, s.length()-1);
				System.out.println(s);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}

}
