package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hospital.utils.ConnectionHelper;
import hospital.vo.LoginVO;

public class SignUpDao{

	public int signUp(LoginVO vo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultrow = 0;
		try {
			conn = ConnectionHelper.getConnection();
			System.out.println("connection success");
			
		
			String sql = "INSERT INTO hospital_id(h_id, h_name, h_address, h_phone, h_pwd, h_email, h_post,h_e_code ) VALUES(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getH_id());
			pstmt.setString(2, vo.getH_name());
			pstmt.setString(3, vo.getH_address());
			pstmt.setString(4, vo.getH_phone());
			pstmt.setString(5, vo.getH_pwd());
			pstmt.setString(6, vo.getH_email());
			pstmt.setString(7, vo.getH_post());
			pstmt.setInt(8, vo.getH_e_code());

			resultrow = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return resultrow;
	}
	
//	 public boolean duplicateIdCheck(String id)
//	    {
//	        Connection conn = null;
//	        PreparedStatement pstmt = null;
//	        ResultSet rs = null;
//	        boolean x= false;
//	        
//	        try {
//	            // 쿼리
//	            StringBuffer query = new StringBuffer();
//	            query.append("SELECT H_ID FROM HOSPITAL_ID WHERE H_ID=?");
//	                        
//	            conn = ConnectionHelper.getConnection();
//	            pstmt = conn.prepareStatement(query.toString());
//	            pstmt.setString(1, id);
//	            rs = pstmt.executeQuery();
//	            
//	            if(rs.next()) x= true; //해당 아이디 존재
//	            
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        } finally {
//	            try{
//	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
//	                if ( conn != null ){ conn.close(); conn=null;    }
//	            }catch(Exception e){
//	               e.printStackTrace();
//	            }
//	        }
//			return x;
//	    } // end duplicateIdCheck()


	
}

/*
  public boolean duplicateIdCheck(String id)
    {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        boolean x= false;
        
        try {
            // 쿼리
            StringBuffer query = new StringBuffer();
            query.append("SELECT ID FROM JSP_MEMBER WHERE ID=?");
                        
            conn = DBConnection.getConnection();
            pstm = conn.prepareStatement(query.toString());
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            
            if(rs.next()) x= true; //해당 아이디 존재
            
            return x;
            
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstm != null ){ pstm.close(); pstm=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end duplicateIdCheck()
    
 */

