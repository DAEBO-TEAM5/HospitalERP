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

public class PatientDao {
	
	public ArrayList<String> getWaitingInfo(int num) {
		
		ArrayList<String> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "select p.num, p.name, p.birth, p.sex, w.w_symptom from patient p join wait w on p.num = w.w_p_num where p.num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			rs.next();
			//System.out.println("rs info ::::"+ rs.getString("name"));
			list.add(Integer.toString( rs.getInt("num")));
			list.add(rs.getString("name"));
			list.add(rs.getString("birth"));
			list.add(rs.getString("sex"));
			list.add(rs.getString("w_symptom"));
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return list;
	}

	
	public ArrayList<PatientVO> getWaitingList() {
		
		ArrayList<PatientVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "select p.num, p.name, p.birth, p.sex from patient p join wait w on p.num = w.w_p_num";
			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PatientVO vo = new PatientVO();
				//System.out.println("Rsrsrs: "+rs.getString(1));
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setSex(rs.getString("sex"));
				
				list.add(vo);
				//System.out.println("VO List: "+vo.getName());
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
		
		//ArrayList<PatientVO> list = new ArrayList<>();
		PatientVO vo = new PatientVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "select * from patient where name = ? and birth = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, birth);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//PatientVO dao = new PatientVO();
				//System.out.println("Rsrsrs: "+rs.getString(1));
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setSex(rs.getString("sex"));
				vo.setAddress(rs.getString("address"));
				vo.setPhone(rs.getString("phone"));
				vo.setHeight(rs.getInt("height"));
				vo.setWeight(rs.getInt("weight"));
				vo.setNote(rs.getString("note"));
				
				System.out.println("vo List: "+vo.getName());
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
	
	//ArrayList<PatientVO> list = new ArrayList<>();
	//PatientVO vo = new PatientVO();
	Connection conn = null;
	PreparedStatement pstmt = null;
	int num = 0;
	try {
		conn = ConnectionHelper.getConnection();
		String sql = "insert into patient values(num_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
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
		
		
		sql = "select num from patient where name=? and birth=?";
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
		String sql = "insert into wait values(w_num_seq.nextval, ?, ?)";
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
		String sql = "update patient set (name, birth, phone, address, sex, height, weight, note) = (?,?,?,?,?,?,?,?) where num=?";
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
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		ConnectionHelper.close(pstmt);
		ConnectionHelper.close(conn);
	}
	return null;
	}


	
	
}
