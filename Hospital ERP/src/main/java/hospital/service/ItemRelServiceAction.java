package hospital.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.ItemRelDao;
import hospital.vo.ItemRelVO;

public class ItemRelServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		 ItemRelDao dao = null;
	     try {
	         dao = new ItemRelDao();
	     } catch (NamingException e) {
	         e.printStackTrace();
	     }
	     ArrayList<ItemRelVO> list = new ArrayList<>();
	      list = dao.itemRelTable();   
	      JSONObject sendObject = new JSONObject();
	      JSONArray sendArray = new JSONArray();
	      JSONObject jobj = null;
	      for(int i =0; i < list.size(); i++) {
	         jobj = new JSONObject();
	         jobj.put("rel_date", list.get(i).getRel_date());
	         jobj.put("rel_time", list.get(i).getRel_time());
	         jobj.put("i_name", list.get(i).getI_name());
	         jobj.put("rel_i_code", list.get(i).getRel_i_code());
	         jobj.put("i_category", list.get(i).getI_category());
	         jobj.put("rel_amount", list.get(i).getRel_amount());
	         jobj.put("i_stock", list.get(i).getI_stock());
	         jobj.put("rel_user", list.get(i).getRel_user());
	         jobj.put("rel_remark", list.get(i).getRel_remark());
	         
	         sendArray.add(jobj);
	      }
	      sendObject.put("item", sendArray);
	      try {
	         response.setContentType("application/text; charset=utf-8");
	         response.getWriter().print(sendObject);
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
		
		return null;
	}

}
