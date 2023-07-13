package hospital.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.FindIdDao;
import hospital.dao.LoginDao;
import hospital.dao.MemberDao;

public class FindIDAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		   ActionForward forward = new ActionForward();
		   
		   String h_name = request.getParameter("h_name");
		   String h_email = request.getParameter("h_email");
		   System.out.println(h_name);
		   System.out.println(h_email);
	        
	        FindIdDao dao = new FindIdDao();
	    	String h_id = dao.findId(h_name, h_email);
	        
	        response.setContentType("text/html;charset=UTF-8");
	        System.out.println("왔습니다.");
	        PrintWriter out;
	    	try {
				out = response.getWriter();
				
				if (h_id != null) {
					// 아이디를 찾은 경우
					out.println("<script>");
					out.println("alert('아이디는 " + h_id + "입니다.');");
					out.println("location.href='login.do';"); // 아이디를 찾은 후 리다이렉트할 페이지
					out.println("</script>");
				} else {
					// 아이디를 찾지 못한 경우
					out.println("<script>");
					out.println("alert('일치하는 정보로 등록된 아이디가 없습니다.');");
					out.println("history.back();"); // 이전 페이지로 돌아가기
					out.println("</script>");
				}
				
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

			return forward;
		}
	}