package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hospital.utils.ConnectionHelper;

public class EmailDao {

	 public boolean EmailCheck(String h_email) {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        boolean isDuplicate = false;

	        try {
	            // 쿼리
	            String query = "SELECT H_EMAIL FROM HOSPITAL_ID WHERE H_EMAIL=?";
	            
	            conn = ConnectionHelper.getConnection();
	            pstmt = conn.prepareStatement(query);
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
	}
	        