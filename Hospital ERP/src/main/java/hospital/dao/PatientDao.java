package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import hospital.utils.ConnectionHelper;
import hospital.vo.PatientVO;
import hospital.vo.WaitVO;

public class PatientDao {
	
	public ArrayList<String> getWaitingInfo(int num) {
		
		ArrayList<String> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT P.NUM, P.NAME, P.ADDRESS, P.PHONE, P.BIRTH, P.SEX, W.W_SYMPTOM FROM PATIENT P JOIN WAIT W ON P.NUM = W.W_P_NUM WHERE P.NUM = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(Integer.toString( rs.getInt("num")));
				list.add(rs.getString("name"));
				list.add(rs.getString("address"));
				list.add(rs.getString("phone"));
				list.add(rs.getString("birth"));
				list.add(rs.getString("sex"));
				list.add(rs.getString("w_symptom"));
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

	
	public ArrayList<WaitVO> getWaitingList() {
		
		ArrayList<WaitVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT P.NUM, P.NAME, P.BIRTH, P.SEX, W.W_SYMPTOM, W.W_NUM FROM PATIENT P JOIN WAIT W ON P.NUM = W.W_P_NUM ORDER BY W.W_NUM";
			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				WaitVO vo = new WaitVO();
				
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setSex(rs.getString("sex"));
				vo.setW_symptom(rs.getString("w_symptom"));
				vo.setW_num(rs.getInt("w_num"));
				
				list.add(vo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return list;
	}
	
public PatientVO getPatientInfo(String name, String birth) {
		
		PatientVO vo = new PatientVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT * FROM PATIENT WHERE NAME = ? AND BIRTH = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, birth);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setSex(rs.getString("sex"));
				vo.setAddress(rs.getString("address"));
				vo.setPhone(rs.getString("phone"));
				vo.setHeight(rs.getInt("height"));
				vo.setWeight(rs.getInt("weight"));
				vo.setNote(rs.getString("note"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return vo;
	}
	


public int InsertPatient(PatientVO vo) {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int num = 0;
	try {
		conn = ConnectionHelper.getConnection();
		String sql = "INSERT INTO PATIENT VALUES(NUM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getName());
		pstmt.setString(2, vo.getBirth());
		pstmt.setString(3, vo.getPhone());
		pstmt.setString(4, vo.getAddress());
		pstmt.setString(5, vo.getSex());
		pstmt.setInt(6, vo.getHeight());
		pstmt.setInt(7, vo.getWeight());
		pstmt.setString(8, vo.getNote());
		
		pstmt.executeUpdate();
		ConnectionHelper.close(pstmt);
		
		
		sql = "SELECT NUM FROM PATIENT WHERE NAME=? AND BIRTH=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getName());
		pstmt.setString(2, vo.getBirth());
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		num = rs.getInt("num");
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		ConnectionHelper.close(pstmt);
		ConnectionHelper.close(conn);
	}
	return num;
}



public PatientVO InsertWait(String symptom, int pnum) {

	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		conn = ConnectionHelper.getConnection();
		String sql = "INSERT INTO WAIT VALUES(W_NUM_SEQ.NEXTVAL, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, symptom);
		pstmt.setInt(2, pnum);
		
		pstmt.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		ConnectionHelper.close(pstmt);
		ConnectionHelper.close(conn);
	}
	return null;
	}



public PatientVO UpdatePatient(PatientVO vo) {

	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		conn = ConnectionHelper.getConnection();
		String sql = "UPDATE PATIENT SET NAME=?, BIRTH=?, PHONE=?, ADDRESS=?, SEX=?, HEIGHT=?, WEIGHT=?, NOTE=? WHERE NUM=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getName());
		pstmt.setString(2, vo.getBirth());
		pstmt.setString(3, vo.getPhone());
		pstmt.setString(4, vo.getAddress());
		pstmt.setString(5, vo.getSex());
		pstmt.setInt(6, vo.getHeight());
		pstmt.setInt(7, vo.getWeight());
		pstmt.setString(8, vo.getNote());
		pstmt.setInt(9, vo.getNum());
		
		pstmt.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		ConnectionHelper.close(pstmt);
		ConnectionHelper.close(conn);
	}
	return null;
	}


	
	
}
