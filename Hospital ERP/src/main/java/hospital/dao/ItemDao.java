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
import hospital.vo.ItemVO;
import hospital.vo.LoginVO;

public class ItemDao {
	
	//품목 테이블 조회
	public ArrayList<ItemVO> itemTable(){
		
		ArrayList<ItemVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql ="SELECT I_NAME, I_CODE, I_CATEGORY, I_UNIT, I_STOCK, I_EXPIRE, I_PRICE, I_REMARK FROM ITEM ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				ItemVO dao = new ItemVO();
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
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return list;
	} //itemTable() 

	
	//품목 테이블 추가 
	public int itemInsert(ItemVO vo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultrow = 0;
		try {
			conn = ConnectionHelper.getConnection();
			System.out.println("여기는 itemDao-itemInsert");
		
			String sql = "INSERT INTO ITEM (I_CODE, I_NAME, I_CATEGORY, I_UNIT, I_STOCK, I_EXPIRE, I_PRICE, I_REMARK) VALUES(?,?,?,?,?,?,?,?) ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getI_code());
			pstmt.setString(2, vo.getI_name());
			pstmt.setString(3, vo.getI_category());
			pstmt.setString(4, vo.getI_unit());
			pstmt.setInt(5, vo.getI_stock());
			pstmt.setString(6, vo.getI_expire());
			pstmt.setInt(7, vo.getI_price());
			pstmt.setString(8, vo.getI_remark());

			resultrow = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return resultrow;
	}
	
	
}
