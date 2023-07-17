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
}