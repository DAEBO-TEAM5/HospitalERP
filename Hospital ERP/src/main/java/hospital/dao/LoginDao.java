package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import hospital.utils.ConnectionHelper;
import hospital.vo.LoginVO;

public class LoginDao {

	public static LoginDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public LoginDao() {
		
	}

	public int loginCheck(String h_id, String h_pwd) {

		int ret = -1;
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

		String code = null;

		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT H_E_CODE FROM HOSPITAL_ID WHERE H_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_id);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				code = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return code;
	}

	public String name(String e_code) {

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
	public String findId(String h_name, String h_email) { // 병원명,이메일로 찾기

		String id = null; // 찾을아이디

		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT H_ID FROM HOSPITAL_ID WHERE H_NAME=? AND H_EMAIL=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_name);
			pstmt.setString(2, h_email);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				id = rs.getString("h_id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return id;
	}
	public boolean EmailCheck(String h_email) {
        
        boolean isDuplicate = false;

        try {
            String sql = "SELECT H_EMAIL FROM HOSPITAL_ID WHERE H_EMAIL=?";
            
            conn = ConnectionHelper.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, h_email);
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
	public int signUp(LoginVO vo) throws SQLException {

		int resultrow = 0;

		try {
			conn = ConnectionHelper.getConnection();

			String sql = "INSERT INTO hospital_id(h_id, h_name, h_address, h_phone, h_pwd, h_email, h_post, h_e_code ) VALUES(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getH_id());
			pstmt.setString(2, vo.getH_name());
			pstmt.setString(3, vo.getH_address());
			pstmt.setString(4, vo.getH_phone());
			pstmt.setString(5, vo.getH_pwd());
			pstmt.setString(6, vo.getH_email());
			pstmt.setString(7, vo.getH_post());
			pstmt.setInt(8, vo.getH_e_code());

			resultrow = pstmt.executeUpdate();

		} catch (SQLException e) {
			throw e;
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return resultrow;
	}
}