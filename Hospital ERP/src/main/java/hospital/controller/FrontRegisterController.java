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
import hospital.service.EmailCheckAction;
import hospital.service.FindIDAction;
import hospital.service.GetEcodeServiceAction;
import hospital.service.HospitalWaitingInfoService;
import hospital.service.HospitalWaitingListService;
import hospital.service.InfoServiceAction;
import hospital.service.InsertCalanderMemoServiceAction;
import hospital.service.InsertPatientServiceAction;
import hospital.service.InsertRecordServiceAction;
import hospital.service.ItemCategoryServiceAction;
import hospital.service.ItemDelServiceAction;
import hospital.service.ItemDis_InsServiceAction;
import hospital.service.ItemInsertServiceAction;
import hospital.service.ItemMemoCallServiceAction;
import hospital.service.ItemMemoUpdateServiceAction;
import hospital.service.ItemRelServiceAction;
import hospital.service.ItemRel_InsServiceAction;
import hospital.service.ItemServiceAction;
import hospital.service.ItemUpdateServiceAction;
import hospital.service.LoadCalendarMemoServiceAction;
import hospital.service.LoadPatientInfoServiceAction;
import hospital.service.LoginOkServiceAction;
import hospital.service.MemberChangePwAction;
import hospital.service.MemberForgotPwProAction;
import hospital.service.MemberIdCheckAction;
import hospital.service.PaymentServiceAction;
import hospital.service.SearchServiceDateAction;
import hospital.service.SearchServiceInfoAction;
import hospital.service.SelectListServiceAction;
import hospital.service.SignUpServiceAction;
import hospital.service.UpdateCalendarMemoServiceAction;
import hospital.service.UpdatePatientInfoServiceAction;
import hospital.service.DailySalesServiceAction;
import hospital.service.DeleteCalendarMemoServiceAction;
import hospital.service.EcodeServiceAction;



@WebServlet("*.do")
public class FrontRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    
    
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

		} else if (urlcommand.equals("/login.do")) {
			String h_id = (String) request.getSession().getAttribute("h_id");
			forward = new ActionForward();
			if (h_id != null) {
				forward.setRedirect(true);
				forward.setPath("main2.do");
			} else {
				forward.setRedirect(false);
				forward.setPath("/WEB-INF/views/login/login.jsp");
			}
    		
    	}else if(urlcommand.equals("/logout.do")) { 
    			request.getSession().invalidate();
        		forward = new ActionForward();
        		forward.setRedirect(true);
        		forward.setPath("./login.do");
    		
    	}else if(urlcommand.equals("/loginok.do")) { 
    		action = new LoginOkServiceAction();
    		forward = action.execute(request, response);
    		
    	}else if(urlcommand.equals("/signup.do")) {
    		action = new SignUpServiceAction();
    		forward = action.execute(request, response);
    		
    	}else if(urlcommand.equals("/checkid.do")){
        		action = new MemberIdCheckAction();
        		action.execute(request, response);
        		
    	}else if(urlcommand.equals("/emailcheck.do")){
        		action = new EmailCheckAction();
        		action.execute(request, response);
        		
    	}else if(urlcommand.equals("/findid.do")){
        		action = new FindIDAction();
        		action.execute(request, response);
        		
    	}else if(urlcommand.equals("/memberForgotPwPro.do")){
    		action = new MemberForgotPwProAction();
    		forward = action.execute(request, response);
    		return;
    		
    	}else if(urlcommand.equals("/memberChangePw.do")){
    		action = new MemberChangePwAction();
    		forward = action.execute(request, response);
    		
    	}else if(urlcommand.equals("/ecodefind.do")){
    		action = new EcodeServiceAction();
    		forward = action.execute(request, response);
    		
    	}else if(urlcommand.equals("/history.do")) {
			 String h_id = (String) request.getSession().getAttribute("h_id");
			forward = new ActionForward();
			if (h_id != null) {
				forward.setRedirect(false);
				forward.setPath("/WEB-INF/views/main/history.jsp");
			} else {
				forward.setRedirect(true);
				forward.setPath("login.do");
			}
		
    	}else if(urlcommand.equals("/patientsearchinfo.do")) {
    		action = new SearchServiceInfoAction();
    		action.execute(request, response);
    	}else if(urlcommand.equals("/patientsearchdate.do")) {
    		action = new SearchServiceDateAction();
    		action.execute(request, response);
    	}else if(urlcommand.equals("/patientinfo.do")) {
    		action = new InfoServiceAction();
    		action.execute(request, response);
    	}else if(urlcommand.equals("/payment.do")) {
    		action = new PaymentServiceAction();
    		action.execute(request, response);
    	}else if(urlcommand.equals("/dailysales.do")) {
    		action = new DailySalesServiceAction();
    		action.execute(request, response);
    	}else if(urlcommand.equals("/item.do")) {
			String h_id = (String) request.getSession().getAttribute("h_id");
			forward = new ActionForward();
			if (h_id != null) {
				forward.setRedirect(false);
				forward.setPath("/WEB-INF/views/main/item.jsp");
			} else {
				forward.setRedirect(true);
				forward.setPath("login.do");
			}
		
    	}else if(urlcommand.equals("/itemMainTable.do")){
    		action = new ItemServiceAction();
    		action.execute(request, response);
		
    	}else if(urlcommand.equals("/itemRelTable.do")){
    		action = new ItemRelServiceAction();
    		action.execute(request, response);
    		
    	}else if(urlcommand.equals("/itemInsert.do")){
    		action = new ItemInsertServiceAction();
    		action.execute(request, response);
    								
    	}else if(urlcommand.equals("/itemDelete.do")){
    		action = new ItemDelServiceAction();
    		action.execute(request, response);
    		
    	}else if(urlcommand.equals("/itemUpdate.do")){
    		action = new ItemUpdateServiceAction();
    		action.execute(request, response);	
    	
    	}else if(urlcommand.equals("/itemRelInsert.do")){
    		action = new ItemRel_InsServiceAction();
    		action.execute(request, response);	
    
    	}else if(urlcommand.equals("/itemDisInsert.do")){
    		action = new ItemDis_InsServiceAction();
    		action.execute(request, response);	
    		
    	}else if(urlcommand.equals("/itemCategorySearch.do")){
    		action = new ItemCategoryServiceAction();
    		action.execute(request, response);	
    		
    	}else if(urlcommand.equals("/itemMemoCall.do")){
    		action = new ItemMemoCallServiceAction();
    		action.execute(request, response);		
    	
    	}else if(urlcommand.equals("/itemMemoUpdate.do")){
    		action = new ItemMemoUpdateServiceAction();
    		action.execute(request, response);		
    	
    	}else if(urlcommand.equals("/main2.do")) {
			 String h_id = (String) request.getSession().getAttribute("h_id");
			forward = new ActionForward();
			if (h_id != null) {
				forward.setRedirect(false);
				forward.setPath("/WEB-INF/views/main/mainIndex.jsp");
			} else {
				forward.setRedirect(true);
				forward.setPath("login.do");
			}
		
    	}else if(urlcommand.equals("/mainWaitList.do")) {
    		action = new HospitalWaitingListService();
    		action.execute(request, response);
    		
    	}else if(urlcommand.equals("/mainSelectList.do")) {
    		action = new SelectListServiceAction();
    		action.execute(request, response);
    		
    	}else if(urlcommand.equals("/waitinginfo.do")) {
    		action = new HospitalWaitingInfoService();
    		forward = action.execute(request, response);
    		
    	}else if(urlcommand.equals("/insertRecord.do")) {
    		action = new InsertRecordServiceAction();
    		action.execute(request, response);
    		
    	}else if(urlcommand.equals("/insertPatient.do")) {
    		action = new InsertPatientServiceAction();
    		action.execute(request, response);
    		
    	}else if(urlcommand.equals("/loadPatientInfo.do")) {
    		action = new LoadPatientInfoServiceAction();
    		action.execute(request, response);
    		
    	}else if(urlcommand.equals("/updatePatientInfo.do")) {
    		action = new UpdatePatientInfoServiceAction();
    		action.execute(request, response);
    		
    	}else if(urlcommand.equals("/loadCalendarMemo.do")) {
    		action = new LoadCalendarMemoServiceAction();
    		action.execute(request, response);
    		
    	}else if(urlcommand.equals("/insertCalendarMemo.do")) {
    		action = new InsertCalanderMemoServiceAction();
    		action.execute(request, response);
    		
    	}else if(urlcommand.equals("/updateCalendarMemo.do")) {
    		action = new UpdateCalendarMemoServiceAction();
    		action.execute(request, response);
    		
    	}else if(urlcommand.equals("/deleteCalendarMemo.do")) {
    		action = new DeleteCalendarMemoServiceAction();
    		action.execute(request, response);
    	}else if(urlcommand.equals("/getEcode.do")) {
    		action = new GetEcodeServiceAction();
    		action.execute(request, response);
    	}
    	
    		
    	if(forward != null) {
    		if(forward.isRedirect()) { //true 페이지 재 요청 (location.href="페이지"
    			response.sendRedirect(forward.getPath());
    			return;
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
