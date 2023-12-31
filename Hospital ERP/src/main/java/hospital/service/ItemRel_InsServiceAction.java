package hospital.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.ItemRelDao;
import hospital.vo.ItemRelVO;

public class ItemRel_InsServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			ItemRelDao dao = new ItemRelDao();
			ItemRelVO vo = new ItemRelVO();
			
			vo.setRel_i_code(Integer.parseInt(request.getParameter("rel_codenum")));
			vo.setRel_date(request.getParameter("rel_date"));
			vo.setRel_time(request.getParameter("rel_time"));
			vo.setRel_amount(Integer.parseInt(request.getParameter("rel_amount")));
			vo.setRel_user(request.getParameter("rel_user"));
			vo.setRel_remark(request.getParameter("rel_remark"));
	
			int result = dao.itemRel_Insert(vo);   
			
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
