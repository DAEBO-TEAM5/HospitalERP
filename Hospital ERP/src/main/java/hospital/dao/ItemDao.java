package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import hospital.utils.ConnectionHelper;
import hospital.vo.ItemVO;

public class ItemDao {
	DataSource ds = null;
	public ItemDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource)context.lookup("java:comp/env/jdbc/HospitalDB");
	}
	public ArrayList<ItemVO> itemTable(){
		
		ArrayList<ItemVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql ="select i_num, i_name, i_code, i_category, i_unit, i_stock, i_expire, i_price, i_remark from item ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				ItemVO dao = new ItemVO();
				dao.setI_num(rs.getInt("i_num"));
				dao.setI_name(rs.getString("i_name"));
				dao.setI_code(rs.getInt("i_code"));
				dao.setI_category(rs.getString("i_category"));
				dao.setI_unit(rs.getString("i_unit"));
				dao.setI_stock(rs.getInt("i_stock"));
				dao.setI_expire(rs.getString("i_expire"));
				dao.setI_price(rs.getInt("i_price"));
				dao.setI_remark(rs.getString("i_remark"));
				
				list.add(dao);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return list;
		
	}
}
