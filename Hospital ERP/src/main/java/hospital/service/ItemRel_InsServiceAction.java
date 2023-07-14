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
			System.out.println("여기는 rel_ins서비스액션");
			System.out.println(request.getParameter("code"));
			System.out.println(request.getParameter("date"));
			System.out.println(request.getParameter("time"));
			System.out.println(Integer.parseInt(request.getParameter("amount")));
			System.out.println(request.getParameter("user"));
			System.out.println(request.getParameter("remark"));
			
			vo.setRel_i_code(Integer.parseInt(request.getParameter("code")));
			vo.setRel_date(request.getParameter("date"));
			vo.setRel_time(request.getParameter("time"));
			vo.setRel_amount(Integer.parseInt(request.getParameter("amount")));
			vo.setRel_user(request.getParameter("user"));
			vo.setRel_remark(request.getParameter("remark"));
	
			dao.itemRel_Insert(vo);   
			
	        response.setContentType("text/plain");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write("Success");
	        
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}

}
