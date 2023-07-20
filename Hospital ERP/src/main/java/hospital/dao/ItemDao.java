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
			String sql = "SELECT IC.I_CODE, IC.I_NAME, IC.I_CATEGORY, I.I_UNIT, I.I_STOCK, I.I_EXPIRE, I.I_PRICE,"
					   + " NVL(I.I_REMARK, ' ') AS I_REMARK FROM ITEM I JOIN ITEM_CODE IC ON IC.I_CODE=I.I_I_CODE "
					   + " ORDER BY TO_DATE(I_EXPIRE, 'YYYY-MM-DD') ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				ItemVO dao = new ItemVO();
				//dao.setI_num(rs.getInt("i_num"));
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
	
	//품목 테이블 내용 제거
	public ArrayList<ItemVO> itemDelete(List<ItemVO> itemList) {
		
		ArrayList<ItemVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		//int resultrow = 0;
		try {
			conn = ConnectionHelper.getConnection();
		
			StringBuffer sql = new StringBuffer(" DELETE ITEM WHERE I_I_CODE = ? ");
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.clearBatch();
			
			for(ItemVO vo : itemList) {
				  	pstmt.setInt(1, vo.getI_code());
		            
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
	
	
	//품목 테이블 내용 수정
	public ItemVO itemUpdate(ItemVO vo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "UPDATE ITEM SET I_UNIT=?, I_STOCK=?, I_EXPIRE=?, I_PRICE=?, I_REMARK=? WHERE I_I_CODE = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getI_unit());
			pstmt.setInt(2, vo.getI_stock());
			pstmt.setString(3, vo.getI_expire());
			pstmt.setInt(4, vo.getI_price());
			pstmt.setString(5, vo.getI_remark());
			pstmt.setInt(6, vo.getI_code());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return null;
	}
	
	//카테고리 종류 불러오기
	public ArrayList<ItemVO> itemCategory(){
		
		ArrayList<ItemVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT DISTINCT I_CATEGORY FROM ITEM_CODE ORDER BY I_CATEGORY ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ItemVO dao = new ItemVO();
				dao.setI_category(rs.getString("i_category"));
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
	} //itemCategory
	
	//메모 왼쪽단에 띄우기
	public ArrayList<String> itemMemoCall (int code) {

		ArrayList<String> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT IC.I_CODE, IC.I_NAME, I.I_STOCK, I.I_UNIT, NVL(I.I_MEMO, ' ') AS I_I_MEMO "
					+ "FROM ITEM I  JOIN ITEM_CODE IC ON IC.I_CODE=I.I_I_CODE WHERE IC.I_CODE= ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
			list.add(Integer.toString( rs.getInt("i_code")));
			list.add(rs.getString("i_name"));
			list.add(Integer.toString(rs.getInt("i_stock")));
			list.add(rs.getString("i_unit"));
			list.add(rs.getString("i_i_memo"));
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
	
	//메모 수정
	public ItemVO itemMemoUpdate(ItemVO vo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "UPDATE ITEM SET I_MEMO= ? WHERE I_I_CODE = ? ";
			System.out.println("아이템다오");
			System.out.println(vo.getI_memo());
			System.out.println(vo.getI_code());
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getI_memo());
			pstmt.setInt(2, vo.getI_code());
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
