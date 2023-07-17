package hospital.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.ItemRelDao;
import hospital.vo.ItemRelVO;

public class ItemDis_InsServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			ItemRelDao dao = new ItemRelDao();
			ItemRelVO vo = new ItemRelVO();
			
			vo.setDis_i_code(Integer.parseInt(request.getParameter("dis_codenum")));
			vo.setDis_date(request.getParameter("dis_date"));
			vo.setDis_time(request.getParameter("dis_time"));
			vo.setDis_amount(Integer.parseInt(request.getParameter("dis_amount")));
			vo.setDis_user(request.getParameter("dis_user"));
			vo.setDis_remark(request.getParameter("dis_remark"));
	
			int result = dao.itemDis_Insert(vo);   
			
			if (result < 2) {
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);// 500 Internal Server Error
				return null;//
			}
	        
		} catch (Exception e) {
			e.printStackTrace();//
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
		} 
		return null;
	}
}
