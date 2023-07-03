package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hospital.utils.ConnectionHelper;
import hospital.vo.patientRecordVO;

public class HospitalDao {
	
	public patientRecordVO searchOK(String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("VO까지 왔다????");
		try {
			conn = ConnectionHelper.getConnection();
			String sql="select disease, medicine, prohibition, doctor from patient_record where doctor =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);

			ResultSet rs = pstmt.executeQuery();
			
			patientRecordVO vo = null;
			while(rs.next()) {
				vo = new patientRecordVO();
				vo.setDisease(rs.getString("disease"));
				vo.setMedicine(rs.getString("medicine"));
				vo.setProhibition(rs.getString("prohibition"));
				vo.setDoctor(rs.getString("doctor"));
			}
			
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			return vo;
				
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return null;
	}
}
