package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import hospital.utils.ConnectionHelper;
import hospital.vo.ItemRelVO;
import hospital.vo.ItemVO;

public class ItemRelDao {

//Rel Table출력	
	public ArrayList<ItemRelVO> itemRelTable(){
		
		ArrayList<ItemRelVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = " SELECT TO_CHAR(rel_date, 'YYYY-MM-DD') AS rel_date, rel_time, i_name, rel_i_code, i_category, rel_amount, rel_after, rel_user, NVL(rel_remark, ' ') AS rel_remark "
		            + " FROM ( "
		            + "    SELECT r.rel_date, r.rel_time, ic.i_name, r.rel_i_code, ic.i_category, r.rel_amount, r.rel_after, r.rel_user, r.rel_remark "
		            + "    FROM release r "
		            + "    JOIN item_code ic ON r.rel_i_code = ic.i_code "
		            + "    UNION ALL "
		            + "    SELECT d.dis_date, d.dis_time, ic.i_name, d.dis_i_code, ic.i_category, d.dis_amount, d.dis_after, d.dis_user, d.dis_remark "
		            + "    FROM discard d "
		            + "    JOIN item_code ic ON d.dis_i_code = ic.i_code "
		            + " ) rd "
		            //+ " JOIN item i ON rd.rel_i_code = i.i_i_code "
		            + " ORDER BY TO_DATE(rel_date, 'YYYY-MM-DD') DESC, TO_DATE(rel_time, 'HH24:MI') DESC ";

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
				dao.setRel_after(rs.getInt("rel_after"));
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
//사용 내역추가	 //총재고량 업데이트
	public int itemRel_Insert(ItemRelVO vo) {

	Connection conn = null;
	PreparedStatement pstmt = null;
	int result = 0;
	int sqlresult = 0;
	int sql2result = 0;
	try {
		conn = ConnectionHelper.getConnection();
		String sql = "INSERT INTO release (rel_num, rel_date, rel_time, rel_user, rel_amount, rel_after, rel_remark, rel_i_code) "
				+ " VALUES (rel_num_seq.nextval, ?, ?, ?, ?, (SELECT (I_STOCK - ?) FROM ITEM WHERE I_I_CODE = ?), ?, ?) ";
		String sql2 = "UPDATE ITEM SET I_STOCK= I_STOCK-? WHERE I_I_CODE=? ";
		
		conn.setAutoCommit(false); 
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getRel_date());
		pstmt.setString(2, vo.getRel_time());
		pstmt.setString(3, vo.getRel_user());
		pstmt.setInt(4, vo.getRel_amount());
		pstmt.setInt(5, vo.getRel_amount());
		pstmt.setInt(6, vo.getRel_i_code());
		pstmt.setString(7, vo.getRel_remark());
		pstmt.setInt(8, vo.getRel_i_code());
		
		sqlresult = pstmt.executeUpdate();
		
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, vo.getRel_amount());
		pstmt.setInt(2, vo.getRel_i_code());
		
		sql2result = pstmt.executeUpdate();
	    
		result = sqlresult + sql2result;
	    
		if(result == 2);{
			conn.commit(); // 변경 사항을 확정하고 커밋합니다.
		}
		
        conn.setAutoCommit(true); // auto-commit 기능을 다시 켭니다.	
		
	} catch (Exception e) {
		e.printStackTrace();
	            try {
	                conn.rollback(); // 오류 발생 시 롤백합니다.
	            } catch (SQLException e1) {
	                e1.printStackTrace();
	            }
	} finally {
		ConnectionHelper.close(pstmt);
		ConnectionHelper.close(conn);
	}
	return result;
	}
	
	//폐기 내역추가	
		public int itemDis_Insert(ItemRelVO vo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		int sqlresult = 0;
		int sql2result = 0;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "INSERT INTO discard (dis_num, dis_date, dis_time, dis_user, dis_amount, dis_after, dis_remark, dis_i_code) "
					+ " VALUES (dis_num_seq.nextval, ?, ?, ?, ?, (SELECT (I_STOCK - ?) FROM ITEM WHERE I_I_CODE = ?), ?, ?) ";
			String sql2 = "UPDATE ITEM SET I_STOCK= I_STOCK-? WHERE I_I_CODE=? ";
			
			conn.setAutoCommit(false); 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getDis_date());
			pstmt.setString(2, vo.getDis_time());
			pstmt.setString(3, vo.getDis_user());
			pstmt.setInt(4, vo.getDis_amount());
			pstmt.setInt(5, vo.getDis_amount());
			pstmt.setInt(6, vo.getDis_i_code());
			pstmt.setString(7, vo.getDis_remark());
			pstmt.setInt(8, vo.getDis_i_code());
			
			sqlresult = pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, vo.getDis_amount());
			pstmt.setInt(2, vo.getDis_i_code());
			
			sql2result = pstmt.executeUpdate();
		    
			result = sqlresult + sql2result;
		    
			if(result == 2);{
				conn.commit(); // 변경 사항을 확정하고 커밋합니다.
			}
			
	        conn.setAutoCommit(true); // auto-commit 기능을 다시 켭니다.	
			
		} catch (Exception e) {
			e.printStackTrace();
		            try {
		                conn.rollback(); // 오류 발생 시 롤백합니다.
		            } catch (SQLException e1) {
		                e1.printStackTrace();
		            }
		       
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return result;
		}
	
}
