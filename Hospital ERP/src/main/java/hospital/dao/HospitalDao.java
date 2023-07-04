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
	
	public List<patientRecordVO> searchOK(String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ConnectionHelper.getConnection();
			String sql = "select disease, medicine, prohibition, doctor from patient_record where doctor LIKE ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+name+"%");

			ResultSet rs = pstmt.executeQuery();
			
			patientRecordVO vo = null;
			List<patientRecordVO> list = new ArrayList<>();
			while(rs.next()) {
				vo = new patientRecordVO();
				vo.setDisease(rs.getString("disease"));
				vo.setMedicine(rs.getString("medicine"));
				vo.setProhibition(rs.getString("prohibition"));
				vo.setDoctor(rs.getString("doctor"));
				list.add(vo);
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
