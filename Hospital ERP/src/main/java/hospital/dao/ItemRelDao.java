package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import hospital.vo.ItemRelVO;
import hospital.vo.ItemVO;

public class ItemRelDao {
	DataSource ds = null;
	public ItemRelDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource)context.lookup("java:comp/env/jdbc/HospitalDB");
	}
public ArrayList<ItemRelVO> itemRelTable(){
		
		ArrayList<ItemRelVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql =" SELECT r.rel_date, r.rel_time, i.i_name, r.rel_i_code, i.i_category, r.rel_amount, i.i_stock, r.rel_user, r.rel_remark "
					+ " FROM release r "
					+ " JOIN item i ON r.rel_i_code = i.i_code "
					+ " UNION ALL "
					+ " SELECT d.dis_date, d.dis_time, i.i_name, d.dis_i_code, i.i_category, d.dis_amount, i.i_stock, d.dis_user, d.dis_remark "
					+ " FROM discard d "
					+ " JOIN item i ON d.dis_i_code = i.i_code ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				ItemRelVO dao = new ItemRelVO();
				dao.setRel_date(rs.getString("rel_date"));
				dao.setRel_time(rs.getString("rel_time"));
				dao.setI_name(rs.getString("i_name"));
				dao.setRel_i_code(rs.getInt("rel_i_code"));
				dao.setI_category(rs.getString("i_category"));
				dao.setRel_amount(rs.getInt("rel_amount"));
				dao.setI_stock(rs.getInt("i_stock")-rs.getInt("rel_amount"));
				dao.setRel_user(rs.getString("rel_user"));
				dao.setRel_remark(rs.getString("rel_remark"));
				
				list.add(dao);
				
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	
}
