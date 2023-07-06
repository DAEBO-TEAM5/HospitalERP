package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import hospital.utils.ConnectionHelper;
import hospital.vo.patientRecordVO;

public class RecordDao {
	
	
	public HashMap<String, Integer> medicineList() {
		//ArrayList<String> list = new ArrayList<>();
		HashMap<String, Integer> list = new HashMap<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "select * from medicine";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.put(rs.getString("m_name"), rs.getInt("m_code"));
			}

			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return list;
	}
	
	
	public ArrayList<String> SelectList(String table) {   
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> list = new ArrayList<>();
		
		try {
			conn = ConnectionHelper.getConnection();
			
			String str = "select * from "+ table;
			String sql = str;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(2));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return list;
	}
	
	
	
	
	
	
	public void insertRecord() {
		
		
	}
	
	public void insertPrescription() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "insert into prescription values(p_code_seq.nextval, )";
			pstmt = conn.prepareStatement(sql);
			int num = pstmt.executeUpdate();
			if(num>0) System.out.println(num+"개 행 업데이트 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
