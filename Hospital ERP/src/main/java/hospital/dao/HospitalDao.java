package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hospital.utils.ConnectionHelper;
import hospital.vo.patientRecordVO;

public class HospitalDao {
	
	public List<patientRecordVO> searchOK(String search_str, boolean check, String find) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ConnectionHelper.getConnection();
			String sql = "";
			if(check && find.equals("검색")) {
				sql = "select * from p_test where phone LIKE ?";	
			}else if(!check && find.equals("검색")) {
				sql = "select * from p_test where name LIKE ?";	
			}else {
				sql = "select * from p_test where r_date LIKE ?";	
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+search_str+"%");

			ResultSet rs = pstmt.executeQuery();
			
			patientRecordVO vo = null;
			List<patientRecordVO> list = new ArrayList<>();
			while(rs.next()) {
				vo = new patientRecordVO();
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setSex(rs.getString("sex"));
				vo.setNote(rs.getString("note"));
				vo.setR_date(rs.getString("r_date"));
				vo.setR_ban(rs.getString("r_ban"));
				vo.setR_d_code(rs.getString("r_d_code"));
				vo.setSymptom(rs.getString("symptom"));
				vo.setP_amount(rs.getInt("p_amount"));
				vo.setP_pay(rs.getInt("p_pay"));
				vo.setP_r_num(rs.getInt("p_r_num"));
				list.add(vo);
				System.out.println(vo);
			}
			
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			return list;
				
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return null;
	}
	
	public List<patientRecordVO> infoSearch(String name, String phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ConnectionHelper.getConnection();
			String sql = "";
			sql = "select * from p_test where name = ? and phone = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);

			ResultSet rs = pstmt.executeQuery();
			
			patientRecordVO vo = null;
			List<patientRecordVO> list = new ArrayList<>();
			while(rs.next()) {
				vo = new patientRecordVO();
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setSex(rs.getString("sex"));
				vo.setNote(rs.getString("note"));
				vo.setR_date(rs.getString("r_date"));
				vo.setR_ban(rs.getString("r_ban"));
				vo.setR_d_code(rs.getString("r_d_code"));
				vo.setSymptom(rs.getString("symptom"));
				vo.setP_amount(rs.getInt("p_amount"));
				vo.setP_pay(rs.getInt("p_pay"));
				vo.setP_r_num(rs.getInt("p_r_num"));
				list.add(vo);
				System.out.println(vo);
			}
			
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			return list;
				
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	public void insertHistory() {
		
		
		
	}
	
	
	
	
	
	
}
