package hospital.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.ItemDao;
import hospital.vo.ItemVO;

public class ItemUpdateServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			ItemDao dao = new ItemDao();
			ItemVO vo = new ItemVO();
			
			vo.setI_unit(request.getParameter("unit"));
			vo.setI_stock(Integer.parseInt(request.getParameter("stock")));
			vo.setI_expire(request.getParameter("expire"));
			vo.setI_price(Integer.parseInt(request.getParameter("price")));
			vo.setI_remark(request.getParameter("remark"));
			vo.setI_num(Integer.parseInt(request.getParameter("inum")));
			dao.itemUpdate(vo);   
	
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}

}
