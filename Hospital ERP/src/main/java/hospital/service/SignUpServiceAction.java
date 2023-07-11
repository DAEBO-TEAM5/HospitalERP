package hospital.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.SignUpDao;
import hospital.vo.LoginVO;

public class SignUpServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String h_id = request.getParameter("h_id");
		String h_name = request.getParameter("h_name");
		String h_address = request.getParameter("h_address");
		String h_phone = request.getParameter("h_phone");
		String h_pwd = request.getParameter("h_pwd");
		String h_email = request.getParameter("h_email");
		String h_post = request.getParameter("h_post");
		int h_e_code = Integer.parseInt(request.getParameter("h_e_code"));
		
		SignUpDao dao = new SignUpDao();
		System.out.println(h_phone);
		
		LoginVO vo = new LoginVO();
		vo.setH_id(h_id);
		vo.setH_name(h_name);
		vo.setH_address(h_address);
		vo.setH_phone(h_phone);
		vo.setH_pwd(h_pwd);
		vo.setH_email(h_email);
		vo.setH_post(h_post);
		vo.setH_e_code(h_e_code);
		int result = 0;
		System.out.println(h_id);
		System.out.println(vo.getH_id());
		
		try {
			result = dao.signUp(vo);
		}
		catch (SQLException e) {
			e.printStackTrace();
			ActionForward forward = new ActionForward();
			forward.setRedirect(false); 
			forward.setPath("/WEB-INF/views/main/signup.jsp");
			request.setAttribute("script", "<script>alert('중복 ID 및 이메일이 있습니다. 다시 회원가입 해주세요'); window.location.href='login.do';</script>");
			return forward;
		}
		 
			String resultdata = "";
			if (result > 0) {
				resultdata = "가입 축하드립니다. " + vo.getH_id() + "님";
				String script = "<script>alert('" + resultdata + "'); window.location.href='login.do';</script>";
				request.setAttribute("script", script);
			} else {
				resultdata = "회원가입 다시해주세요";
			}
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false); 
			forward.setPath("/WEB-INF/views/main/signup.jsp");
			
			return forward;
			
	}
}