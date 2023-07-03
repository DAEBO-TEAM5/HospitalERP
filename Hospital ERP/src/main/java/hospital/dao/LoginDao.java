package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import hospital.utils.ConnectionHelper;
import hospital.vo.LoginVO;

public class LoginDao {

	public int login(LoginVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultrow = 0;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "INSERT INTO login(id,pwd,h_name,email,phone,post,address) VALUES(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getH_name());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getPost());
			pstmt.setString(7, vo.getAddress());

			resultrow = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return resultrow;
	}
}