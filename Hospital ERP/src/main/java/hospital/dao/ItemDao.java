package hospital.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ItemDao {
	DataSource ds = null;
	public ItemDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource)context.lookup("java:comp/env/jdbc/HospitalDB");
	}
	public ArrayList<String> itemTable(){
		
		ArrayList<String> list = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql ="select i_num, i_name, i_code, i_category, i_unit, i_stock, i_expire, i_price, i_remark from item ";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return null;
		
	}
}
