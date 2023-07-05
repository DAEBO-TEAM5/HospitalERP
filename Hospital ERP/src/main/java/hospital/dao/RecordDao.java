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
	
	
	
}
