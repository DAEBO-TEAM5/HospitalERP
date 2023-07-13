package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hospital.utils.ConnectionHelper;
import hospital.vo.ItemVO;

public class ItemDao {
	
	//품목 테이블 조회
	public ArrayList<ItemVO> itemTable(){
		
		ArrayList<ItemVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection();
			//String sql ="SELECT I_NAME, I_CODE, I_CATEGORY, I_UNIT, I_STOCK, I_EXPIRE, I_PRICE, I_REMARK FROM ITEM ";
			String sql = "SELECT IC.I_CODE, I.I_NUM, IC.I_NAME, IC.I_CATEGORY, I.I_UNIT, I.I_STOCK, I.I_EXPIRE, I.I_PRICE,"
					   + "  I.I_REMARK FROM ITEM I JOIN ITEM_CODE IC ON IC.I_CODE=I.I_I_CODE "
					   + " ORDER BY TO_DATE(I_EXPIRE, 'YYYY-MM-DD') ";
			
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
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return list;
	} //itemTable() 

	
	//품목 테이블에 추가 
	public ArrayList<ItemVO> itemInsert(List<ItemVO> itemList) {
		
		ArrayList<ItemVO> list = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		//int resultrow = 0;
		try {
			conn = ConnectionHelper.getConnection();
			System.out.println("여기는 itemDao-itemInsert");
		
			StringBuffer sql = new StringBuffer(" INSERT INTO ITEM (I_NUM, I_I_CODE, I_UNIT, I_STOCK, I_EXPIRE, I_PRICE, I_REMARK) VALUES(I_NUM_SEQ.NEXTVAL,?,?,?,?,?,?) ");
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.clearBatch();
			
			for(ItemVO vo : itemList) {
				  	pstmt.setInt(1, vo.getI_i_code());
		            pstmt.setString(2, vo.getI_unit());
		            pstmt.setInt(3, vo.getI_stock());
		            pstmt.setString(4, vo.getI_expire());
		            pstmt.setInt(5, vo.getI_price());
		            pstmt.setString(6, vo.getI_remark());
		            
		            pstmt.addBatch();
			}
			pstmt.executeBatch();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return  list;
	}
	
	public ArrayList<ItemVO> itemDelete(List<ItemVO> itemList) {
		
		ArrayList<ItemVO> list = new ArrayList<>();
		System.out.println("여기는 itemdao!");
		Connection conn = null;
		PreparedStatement pstmt = null;
		//int resultrow = 0;
		try {
			conn = ConnectionHelper.getConnection();
			System.out.println("여기는 itemDao-itemInsert");
		
			StringBuffer sql = new StringBuffer(" DELETE ITEM WHERE I_NUM = ? ");
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.clearBatch();
			
			for(ItemVO vo : itemList) {
				  	pstmt.setInt(1, vo.getI_num());
		            
		            pstmt.addBatch();
			}
			pstmt.executeBatch();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return  list;
	}
	
}
