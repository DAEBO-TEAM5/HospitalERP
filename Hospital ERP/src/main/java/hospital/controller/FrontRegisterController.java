package hospital.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.action.Action;
import hospital.action.ActionForward;

/*

Url 방식

@WebServlet("*.do")  // a.do , b.do
*.do >> login.do
*.do >> loginok.do

*/


@WebServlet("*.do")
public class FrontRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public FrontRegisterController() {
        // TODO Auto-generated constructor stub
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
       	request.setCharacterEncoding("UTF-8");
    	
       	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String urlcommand = requestURI.substring(contextPath.length());
    	

    	Action action=null;
    	ActionForward forward=null;
    	
    	
    	if(urlcommand.equals("/registe.do")) {
//    		//UI 제공 (서비스 객체가 필요없다)
//    		forward = new ActionForward();
//    		forward.setRedirect(false);
//    		forward.setPath("/WEB-INF/views/register/register.jsp");

    	}
    	
    	
    	
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
