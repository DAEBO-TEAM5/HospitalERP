package hospital.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.ItemDao;
import hospital.vo.ItemVO;

public class ItemMemoCallServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			ItemDao dao = new ItemDao();
			String code = request.getParameter("code");
			ArrayList<String> list = new ArrayList<>();
			list = dao.itemMemoCall(Integer.parseInt(code));   
			
			JSONObject sendObject = new JSONObject();
			
			sendObject.put("i_code", list.get(0));
			sendObject.put("i_name", list.get(1));
			sendObject.put("i_stock", list.get(2));
			sendObject.put("i_unit", list.get(3));
			sendObject.put("i_i_memo", list.get(4));
			
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
			
	
			
		} catch (Exception e) {
			e.printStackTrace();//
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
		} 
		return null;
	}

}