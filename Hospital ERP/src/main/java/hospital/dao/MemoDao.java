package hospital.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hospital.utils.ConnectionHelper;

public class MemoDao {
	
	public void insertMemo(String memo, String date, int ecode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection();
			
			String sql = "insert into memo values(m_num_seq.nextval, ?, ?, ?)";  
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memo);
			pstmt.setString(2, date);  
			pstmt.setInt(3, ecode);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
	}
	
	public String fetchMemo(String date, int ecode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String memo = "";
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "select m_memo from memo where m_date=? and m_e_code=?";  //직원번호 변경해야함
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);  
			pstmt.setInt(2, ecode);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memo = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return memo;
	}
	
	
	public void updateMemo(String memo, String date, int ecode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection();
			
			String sql = "update memo set m_memo=? where m_date=? and m_e_code = ?";  
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memo);
			pstmt.setString(2, date);  
			pstmt.setInt(3, ecode);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
	}
	
	public void deleteMemo(String date, int ecode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection();
			
			String sql = "delete from memo where m_date = ? and m_e_code = ?";  
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, ecode);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
	}


}
