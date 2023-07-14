package hospital.service;

import java.sql.Connection;
import java.sql.SQLException;

import hospital.dao.Member2Dao;
import hospital.utils.ConnectionHelper;

/** 임시코드를 발급받은 후, 새 비밀번호로 변경하는 요청을 처리하는 비즈니스 클래스 */
public class MemberChangePwProService {

		/** 임시코드를 발급받은 후, 새 비밀번호로 변경하는 메서드 */
		public boolean updatePw(String h_id, String newPw) {

			int updateCount = 0;
			
			/* DB 작업 */
			Connection conn = ConnectionHelper.getConnection();
			Member2Dao dao = Member2Dao.getInstance();
			dao.setConnection(conn);
			updateCount = dao.updatePw(h_id, newPw);
			
			boolean updateResult = false;
			
			if (updateCount > 0) {
				commit(conn);
				updateResult = true;
			} else {
				rollback(conn);
			}
			close(conn);
			return updateResult;
		}

		private void commit(Connection conn) {
			try {
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		private void rollback(Connection conn) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		private void close(Connection conn) {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}