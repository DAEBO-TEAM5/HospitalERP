package hospital.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.ItemDao;
import hospital.vo.ItemVO;

public class ItemMemoUpdateServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			ItemDao dao = new ItemDao();
			ItemVO vo = new ItemVO();
			
			vo.setI_memo(request.getParameter("memo"));
			vo.setI_code(Integer.parseInt(request.getParameter("code")));
			dao.itemMemoUpdate(vo);   
	
			
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
		} 
		return null;
	}

}
