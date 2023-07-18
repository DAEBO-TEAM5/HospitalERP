package hospital.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.LoginDao;

public class EcodeServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String code = (String) session.getAttribute("h_e_code");

		LoginDao dao = new LoginDao();
		String name = dao.name(code);
		String h_name = dao.hospital(code);

		request.setAttribute("name", name);
		request.setAttribute("h_name", h_name);

		JSONObject sendObject = new JSONObject();
		sendObject.put("name", name);
		sendObject.put("h_name", h_name);

		try {
			response.setContentType("application/text; charset=utf-8");
			response.getWriter().print(sendObject);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
}
