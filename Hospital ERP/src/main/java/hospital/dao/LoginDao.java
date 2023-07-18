package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hospital.utils.ConnectionHelper;

public class LoginDao {

	public int loginCheck(String h_id, String h_pwd) {
		int ret = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT COUNT(*) FROM HOSPITAL_ID WHERE H_ID = ? AND H_PWD = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_id);
			pstmt.setString(2, h_pwd);

			rs = pstmt.executeQuery();
			rs.next();

			ret = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return ret;
	}

	public String ecode(String h_id) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String code = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT H_E_CODE FROM HOSPITAL_ID WHERE H_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_id);

			rs = pstmt.executeQuery();
			rs.next();
			code = rs.getString(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return code;
	}
	public String name(String e_code) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String name = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT E_NAME FROM EMPLOYEE WHERE E_CODE = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, e_code);

			rs = pstmt.executeQuery();
			rs.next();
			name = rs.getString(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return name;
	}
public String hospital(String h_name) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT H_NAME FROM HOSPITAL_ID WHERE H_E_CODE = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_name);

			rs = pstmt.executeQuery();
			rs.next();
			id = rs.getString(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return id;
	}
}