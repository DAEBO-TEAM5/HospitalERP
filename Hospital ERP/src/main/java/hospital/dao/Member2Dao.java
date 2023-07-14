package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import hospital.utils.ConnectionHelper;
import hospital.vo.LoginVO;


public class Member2Dao {

	public static Member2Dao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	private Member2Dao() {
		
	}
	
	public static Member2Dao getInstance() {
		if(instance == null) {
			instance = new Member2Dao();
		}
		return instance;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	/** 아이디, 이메일로 회원을 가져오는 메서드 */
	public LoginVO selectMember(String h_id, String h_email) {
    
		String sql = "select h_id, h_email from hospital_id where h_id=? and h_email=?";
		LoginVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_id);
			pstmt.setString(2, h_email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new LoginVO();
				vo.setH_id(h_id);
				vo.setH_email(h_email);
			}
		} catch (Exception e) {
			System.out.println(" LoginVO : selectMember(h_id, h_email) ERROR : "+e);
		} finally {
				ConnectionHelper.close(rs);
	            ConnectionHelper.close(pstmt);
	            ConnectionHelper.close(conn);
		}
		return vo;
	}
	public int updatePw(String h_id, String newPw) {

	    int updateCount = 0;
	    String sql = "update hospital_id "
	               + "set h_pw=? "
	               + "where h_id=?";

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, newPw);
	        pstmt.setString(2, h_id);
	        updateCount = pstmt.executeUpdate();
	    } catch (Exception e) {
	        System.out.println(" updatePw(h_id, oldPw, newPw) ERROR : "+e);
	    } finally {
	        ConnectionHelper.close(pstmt);
	    }

	    return updateCount;
	}
}
