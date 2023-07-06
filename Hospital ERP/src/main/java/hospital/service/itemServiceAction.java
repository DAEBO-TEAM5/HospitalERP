package hospital.service;

import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.ItemDao;
import hospital.vo.ItemVO;

public class itemServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		try {
			ItemDao dao = new ItemDao();
			ArrayList<ItemVO> list = new ArrayList<>();
			list = dao.itemTable();   
			
			JSONObject itemObject = new JSONObject();
			
			itemObject.put("i_num", list.get(0));
			itemObject.put("i_name", list.get(1));
			itemObject.put("i_code", list.get(2));
			itemObject.put("i_category", list.get(3));
			itemObject.put("i_unit", list.get(4));
			itemObject.put("i_stock", list.get(5));
			itemObject.put("i_expire", list.get(6));
			itemObject.put("i_price", list.get(7));
			itemObject.put("i_remark", list.get(8));
			
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(itemObject);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
