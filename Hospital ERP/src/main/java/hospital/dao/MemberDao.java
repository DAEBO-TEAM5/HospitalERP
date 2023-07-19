package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hospital.utils.ConnectionHelper;
import hospital.vo.LoginVO;

public class MemberDao {

	public static MemberDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public MemberDao() {
		
	}

	public LoginVO selectMember(String h_id, String h_email) {

		String sql = "SELECT H_ID, H_EMAIL FROM HOSPITAL_ID WHERE H_ID=? AND H_EMAIL=?";
		LoginVO vo = null;

		try {
			conn = ConnectionHelper.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_id);
			pstmt.setString(2, h_email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new LoginVO();
				vo.setH_id(h_id);
				vo.setH_email(h_email);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return vo;
	}

	public int updatePw(String h_id, String newPw) {

		int updateCount = 0;
		String sql = "UPDATE HOSPITAL_ID " + "SET H_PWD=? " + "WHERE H_ID=?";

		try {
			conn = ConnectionHelper.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPw);
			pstmt.setString(2, h_id);
			updateCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			ConnectionHelper.close(conn);
			ConnectionHelper.close(pstmt);
		}

		return updateCount;
	}

	public LoginVO getMember(String h_id, String h_email) {

		conn = ConnectionHelper.getConnection();
		MemberDao dao = new MemberDao();
		LoginVO vo = dao.selectMember(h_id, h_email);

		ConnectionHelper.close(conn);
		return vo;
	}
	
	public boolean duplicateIdCheck(String h_id) {

		
		boolean isDuplicate = false;

		try {
			String query = "SELECT H_ID FROM HOSPITAL_ID WHERE H_ID=?";

			conn = ConnectionHelper.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, h_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				isDuplicate = true; // 해당 아이디가 이미 존재함
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}

		return isDuplicate;
	}
}