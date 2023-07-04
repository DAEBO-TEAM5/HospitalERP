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
import hospital.service.HospitalWaitingInfoService;
import hospital.service.HospitalWaitingListService;
import hospital.service.InfoServiceAction;
import hospital.service.LoginOkServiceAction;
import hospital.service.SearchServiceAction;

@WebServlet("*.do")
public class FrontRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public FrontRegisterController() {}
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
       	request.setCharacterEncoding("UTF-8");
       	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String urlcommand = requestURI.substring(contextPath.length());
    	

    	Action action=null;
    	ActionForward forward=null;
    	
    	if(urlcommand.equals("/main.do")) {
    		//UI 제공 (서비스 객체가 필요없다)
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/main/main.jsp");

    	}else if(urlcommand.equals("/login.do")) { 
    		System.out.println("여기는옴");
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/login/login.jsp");
    		
    	}else if(urlcommand.equals("/loginok.do")) { 
    		System.out.println("여기는?");
    		action = new LoginOkServiceAction();
    		forward = action.execute(request, response); 
    	
    	}else if(urlcommand.equals("/history.do")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/main/history.jsp");

    	}else if(urlcommand.equals("/patientsearch.do")) {
    		action = new SearchServiceAction();
    		action.execute(request, response);
    		
    	}else if(urlcommand.equals("/patientinfo.do")) {
    		action = new InfoServiceAction();
    		action.execute(request, response);
    	}
    	
    	if(urlcommand.equals("/item.do")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/main/item.jsp");

    	}
    	else if(urlcommand.equals("/main2.do")) {
    		//UI 제공 (서비스 객체가 필요없다)
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/main/mainIndex.jsp");
    		action = new HospitalWaitingListService();
    		forward = action.execute(request, response);
    		//action = new HospitalWaitingInfoService();
    		//forward = action.execute(request, response);

    	}else if(urlcommand.equals("/waitinginfo.do")) {
    		//forward = new ActionForward();
    		System.out.println("waitinginfo-----------");
    		action = new HospitalWaitingInfoService();
    		forward = action.execute(request, response);

    	}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { //true 페이지 재 요청 (location.href="페이지"
    			response.sendRedirect(forward.getPath());
    		}else { //기본적으로 forward ....
    			    //1. UI 전달된 경우
    			    //2. UI + 로직
    			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
    	
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
