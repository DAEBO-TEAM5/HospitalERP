package hospital.service;

import java.sql.Connection;

import hospital.dao.Member2Dao;
import hospital.utils.ConnectionHelper;
import hospital.vo.LoginVO;

public class MemberForgotPwProService {

	public LoginVO getMember(String h_id, String h_email) {
		
	
		/* DB 작업 */
		Connection conn = ConnectionHelper.getConnection();
		
		Member2Dao dao = Member2Dao.getInstance();
		dao.setConnection(conn);
		LoginVO vo = dao.selectMember(h_id, h_email);

		return vo;
	}
}