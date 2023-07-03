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

import hospital.vo.PatientVO;

public class PatientDao {
	
	DataSource ds = null;
	public PatientDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
	}
	
	public ArrayList<String> getWaitingInfo(int num) {
		
		ArrayList<String> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ds.getConnection();
			//String sql = "select p.num, p.name, p.birth, p.sex, w.symptom from patient join wait w on p.num = ?";
			String sql = "select p.num, p.name, p.birth, p.sex, w.symptom from patient join wait w on p.num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			System.out.println("rs info ::::"+ rs.getString("name"));
			list.add(Integer.toString( rs.getInt("num")));
			list.add(rs.getString("name"));
			list.add("birth");
			list.add("sex");
			list.add("symptom");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	public ArrayList<PatientVO> getWaitingList() {
		
		ArrayList<PatientVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ds.getConnection();
			//String sql = "select p.num, p.name, p.birth, p.sex, w.symptom from patient join wait w on p.num = ?";
			String sql = "select p.num, p.name, p.birth, p.sex from patient p join wait w on p.num = w.num";
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
			//list.add(dao);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
