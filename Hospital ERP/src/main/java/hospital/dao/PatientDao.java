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
			System.out.println("rs info ::::"+ rs.getString("name"));
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
				PatientVO dao = new PatientVO();
				System.out.println("Rsrsrs: "+rs.getString(1));
				dao.setNum(rs.getInt("num"));
				dao.setName(rs.getString("name"));
				dao.setBirth(rs.getString("birth"));
				dao.setSex(rs.getString("sex"));
				
				list.add(dao);
				System.out.println("Dao List: "+dao.getName());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return list;
	}
	
	
}
