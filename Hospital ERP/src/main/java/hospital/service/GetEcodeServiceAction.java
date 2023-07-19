package hospital.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;

public class GetEcodeServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String ecode = (String) session.getAttribute("h_e_code");
		
		JSONObject sendObject = new JSONObject();
		sendObject.put("ecode", ecode);

		try {
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
