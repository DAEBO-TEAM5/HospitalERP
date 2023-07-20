package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import hospital.utils.ConnectionHelper;

public class RecordDao {
	
	
	public LinkedHashMap<String, Integer> medicineList() {
		LinkedHashMap<String, Integer> list = new LinkedHashMap<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT * FROM MEDICINE ORDER BY M_NAME";
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
	
	
	public ArrayList<String> SelectList(String table, String name) {   
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> list = new ArrayList<>();
		
		try {
			conn = ConnectionHelper.getConnection();
			
			String str = "SELECT * FROM "+ table + " ORDER BY " + name;
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
	
	
	public int getCode(String code, String table, String name, String s) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int codenum=0;
		try {
			conn = ConnectionHelper.getConnection();
			String str = "SELECT "+ code +" FROM "+table+" WHERE "+name+" = ?";
			String sql = str;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				codenum = rs.getInt(1); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return codenum;
	}
	
	
	
	
	public int insertRecord(String note, String symptom, int p_code, int dcode, int ecode ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int recordnum=0;
		
		try {
			conn = ConnectionHelper.getConnection();                      //의사소견, 증상, 환자번호, 질병코드, 직원코드
			String sql =  "INSERT INTO RECORD VALUES(R_NUM_SEQ.NEXTVAL, SYSDATE, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, note);
			pstmt.setString(2, symptom);
			pstmt.setInt(3, p_code);
			pstmt.setInt(4, dcode);
			pstmt.setInt(5, ecode);
			int num = pstmt.executeUpdate();
			ConnectionHelper.close(pstmt);  //////////////////////////////////////
			
			sql = "SELECT R_NUM FROM RECORD WHERE R_DATE = SYSDATE AND R_P_NUM = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_code);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				recordnum = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return recordnum;
	}
	
	

	public void insertPrescription(int m_code, int use, int recordnum ) {   //처방약 
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("---------"+m_code+" "+use+" "+recordnum);
		try {
			conn = ConnectionHelper.getConnection();                     //약품코드, 사용량, 진료기록번호
			String sql = "INSERT INTO PRESCRIPTION VALUES(P_NUM_SEQ.NEXTVAL, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_code);
			pstmt.setInt(2, use);
			pstmt.setInt(3, recordnum);
			int num = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
	}
	
	public void insertTherapyMapping(int tcode, int recordnum) {   //물리치료 목록
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "INSERT INTO TR_MAPPING VALUES(TR_NUM_SEQ.NEXTVAL, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tcode);
			pstmt.setInt(2, recordnum);
			int num = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
	}
	
	
	public void deleteWaitList(int p_code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "DELETE FROM WAIT WHERE W_P_NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_code);
			int num = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
	}
	
	public int getThPrice(int t_code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int price=0;
		
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT T_PRICE FROM THERAPY WHERE T_CODE = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, t_code);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				price = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return price;
	}
	
	public void insertPay(int r_num, int hap) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "INSERT INTO PAYMENT(PAY_NUM, PAY_R_NUM, PAY_AMOUNT) VALUES(PAY_NUM_SEQ.NEXTVAL, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setInt(2, hap);
			int num = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
	}
	
}
