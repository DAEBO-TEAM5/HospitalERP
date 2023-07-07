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
	
	
	public int getCode(String code, String table, String name, String s) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int codenum=0;
		try {
			conn = ConnectionHelper.getConnection();
			String str = "select "+ code +" from "+table+" where "+name+" = ?";
			String sql = str;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s);
			rs = pstmt.executeQuery();
			rs.next();
			codenum = rs.getInt(code); 
			System.out.println(codenum);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return codenum;
	}
	
	
	
	
	public int insertRecord(String note, int p_code, int dcode ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int recordnum=0;
		
		try {
			conn = ConnectionHelper.getConnection();                      //의사소견 , 환자번호, 질병코드, 직원코드
			String sql =  "insert into record values(r_num_seq.nextval, sysdate, ?,  ?, ?, 1010)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, note);
			pstmt.setInt(2, p_code);
			pstmt.setInt(3, dcode);
			int num = pstmt.executeUpdate();
			//if(num>0) System.out.println(num+"개 행 업데이트 완료");
			ConnectionHelper.close(pstmt);  //////////////////////////////////////
			
			sql = "select r_num from record where r_date = sysdate and r_p_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_code);
			rs = pstmt.executeQuery();
			rs.next();
			recordnum = rs.getInt(1);
			
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
		
		try {
			conn = ConnectionHelper.getConnection();                     //약품코드, 사용량, 진료기록번호
			String sql = "insert into prescription values(p_code_seq.nextval, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_code);
			pstmt.setInt(2, use);
			pstmt.setInt(3, recordnum);
			int num = pstmt.executeUpdate();
			//if(num>0) System.out.println(num+"개 행 업데이트 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void insertTherapyMapping(int tcode, int recordnum) {   //물리치료 목록
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "insert into tr_mapping values(tr_num_seq.nextval, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tcode);
			pstmt.setInt(2, recordnum);
			int num = pstmt.executeUpdate();
			//if(num>0) System.out.println(num+"개 행 업데이트 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
}
