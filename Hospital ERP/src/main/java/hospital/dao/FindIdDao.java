package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hospital.utils.ConnectionHelper;

public class FindIdDao {

	public String findId(String h_name, String h_email) { // 병원명,이메일로 찾기

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String h_id = null; // 찾을아이디

		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT H_ID FROM HOSPITAL_ID WHERE H_NAME=? AND H_EMAIL=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_name);
			pstmt.setString(2, h_email);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				h_id = rs.getString("h_id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return h_id;
	}
}