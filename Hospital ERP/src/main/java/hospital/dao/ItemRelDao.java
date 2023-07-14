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
import hospital.vo.ItemRelVO;
import hospital.vo.ItemVO;

public class ItemRelDao {

	
	public ArrayList<ItemRelVO> itemRelTable(){
		
		ArrayList<ItemRelVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = " SELECT TO_CHAR(rel_date, 'YYYY-MM-DD') AS rel_date, rel_time, i_name, rel_i_code, i_category, rel_amount, i_stock, rel_user, rel_remark "
		            + " FROM ( "
		            + "    SELECT r.rel_date, r.rel_time, ic.i_name, r.rel_i_code, ic.i_category, r.rel_amount, r.rel_user, r.rel_remark "
		            + "    FROM release r "
		            + "    JOIN item_code ic ON r.rel_i_code = ic.i_code "
		            + "    UNION ALL "
		            + "    SELECT d.dis_date, d.dis_time, ic.i_name, d.dis_i_code, ic.i_category, d.dis_amount, d.dis_user, d.dis_remark "
		            + "    FROM discard d "
		            + "    JOIN item_code ic ON d.dis_i_code = ic.i_code "
		            + " ) rd "
		            + " JOIN item i ON rd.rel_i_code = i.i_i_code "
		            + " ORDER BY TO_DATE(rel_date, 'YYYY-MM-DD') ASC, TO_DATE(rel_time, 'HH24:MI') ASC ";

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
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return list;
		
	}
	
	public ItemRelVO itemRel_Insert(ItemRelVO vo) {

	Connection conn = null;
	PreparedStatement pstmt = null;
	System.out.println("여기는 item reldao- relisnert");
	try {
		conn = ConnectionHelper.getConnection();
		String sql = "INSERT INTO RELEASE VALUES(REL_NUM_SEQ.NEXTVAL, ?,?,?,?,?,?) ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getRel_date());
		pstmt.setString(2, vo.getRel_time());
		pstmt.setString(3, vo.getRel_user());
		pstmt.setInt(4, vo.getRel_amount());
		pstmt.setString(5, vo.getRel_remark());
		pstmt.setInt(6, vo.getRel_i_code());
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
