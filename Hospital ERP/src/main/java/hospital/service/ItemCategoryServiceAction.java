package hospital.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.ItemDao;
import hospital.vo.ItemVO;

public class ItemCategoryServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
	      ItemDao dao = null;
	      try { 
	         dao = new ItemDao();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      ArrayList<ItemVO> list = new ArrayList<>();
	      list = dao.itemCategory();   
	      JSONObject sendObject = new JSONObject();
	      JSONArray sendArray = new JSONArray();
	      JSONObject jobj = null;
	      for(int i =0; i < list.size(); i++) {
	         jobj = new JSONObject();
	         jobj.put("i_category", list.get(i).getI_category());
	         
	         sendArray.add(jobj);
	      }
	      sendObject.put("item", sendArray);
	      try {
	         response.setContentType("application/text; charset=utf-8");
	         response.getWriter().print(sendObject);
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();//
	         response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
	      }

	        return forward;
	   }

	}