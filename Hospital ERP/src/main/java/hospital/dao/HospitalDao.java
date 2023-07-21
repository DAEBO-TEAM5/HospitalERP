package hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import hospital.utils.ConnectionHelper;
import hospital.vo.PatientVO;
import hospital.vo.RecordVO;
import hospital.vo.patientRecordVO;
import hospital.vo.paymentVO;

public class HospitalDao {

	public List<patientRecordVO> searchInfo(String search_str, boolean check) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println(search_str);
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "";
			if (check) {
				sql = "select p.address, p.note, p.num, p.name, p.birth, p.sex, p.phone from patient p where phone LIKE ? order by num";

			} else {
				sql = "select p.address, p.note, p.num, p.name, p.birth, p.sex, p.phone from patient p where name LIKE ? order by num";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search_str + "%");

			ResultSet rs = pstmt.executeQuery();

			patientRecordVO vo = null;
			List<patientRecordVO> list = new ArrayList<>();
			while (rs.next()) {
				vo = new patientRecordVO();
				vo.setNote(rs.getString("note"));
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setSex(rs.getString("sex"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));

				list.add(vo);
				System.out.println(vo);
			}

			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			return list;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;
	}

	public List<patientRecordVO> searchDate(String date) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println(date);
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "";
			sql = "select p.address, p.note, p.num, p.name, p.birth, p.sex, p.phone, r.r_num, r.r_date from patient p join record r on p.num = r.r_p_num where to_char(r_date,'YYYYMMDD') = ? order by r_num desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);

			ResultSet rs = pstmt.executeQuery();

			patientRecordVO vo = null;
			List<patientRecordVO> list = new ArrayList<>();
			while (rs.next()) {
				vo = new patientRecordVO();
				vo.setNote(rs.getString("note"));
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setSex(rs.getString("sex"));
				vo.setPhone(rs.getString("phone"));
				vo.setR_num(rs.getInt("r_num"));
				vo.setR_date(rs.getString("r_date"));
				vo.setAddress(rs.getString("address"));

				list.add(vo);
				System.out.println(vo);
			}

			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			return list;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;
	}

	public List<patientRecordVO> infoSearch(String p_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ConnectionHelper.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(
					"select p.name, p.num, p.birth, p.phone, p.address, p.sex, p.note, w_symptom, r.r_num, r.r_date, r.r_opinion, ");
			sql.append(
					"r.r_d_code, r.r_e_code, pr.p_num, pr.p_m_code, pr.p_use, pay.pay_num, pay.pay_amount, pay.pay_pay, tr.tr_num, tr.tr_t_code ");
			sql.append(
					"from patient p join wait w on p.num = w.w_p_num join record r on p.num = r.r_p_num join prescription pr on r.r_num = pr.p_r_num ");
			sql.append("join payment pay on r.r_num = pay.pay_r_num join tr_mapping tr on r.r_num = tr.tr_r_num");
			sql.append("where num = ?");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, p_num);

			ResultSet rs = pstmt.executeQuery();

			patientRecordVO vo = null;
			List<patientRecordVO> list = new ArrayList<>();
			while (rs.next()) {
				vo = new patientRecordVO();
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setSex(rs.getString("sex"));
				vo.setNote(rs.getString("note"));
				/*
				 * vo.setR_date(rs.getString("r_date")); vo.setR_ban(rs.getString("r_ban"));
				 * vo.setR_d_code(rs.getString("r_d_code"));
				 * vo.setSymptom(rs.getString("symptom"));
				 * vo.setP_amount(rs.getInt("p_amount")); vo.setP_pay(rs.getInt("p_pay"));
				 * vo.setP_r_num(rs.getInt("p_r_num"));
				 */
				list.add(vo);
				System.out.println(vo);

			}

			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			return list;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;
	}

	public PatientVO patientInfo(int p_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		PatientVO vo = new PatientVO();

		try {
			conn = ConnectionHelper.getConnection();
			String sql = "select * from patient where num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);

			rs = pstmt.executeQuery();

			// List<PatientVO> list = new ArrayList<>();
			while (rs.next()) {
				// vo = new patientRecordVO();
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setSex(rs.getString("sex"));
				vo.setNote(rs.getString("note"));

				// list.add(vo);
				System.out.println(vo);

			}

			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			// return list;

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return vo;
	}

	public ArrayList<RecordVO> GetRecordNum(int p_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		RecordVO vo = new RecordVO();
		ArrayList<RecordVO> list = new ArrayList<>();
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "select * from record where r_p_num = ? order by r_date desc";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);

			rs = pstmt.executeQuery();

			// List<PatientVO> list = new ArrayList<>();
			while (rs.next()) {
				// System.out.println("note:"+rs.getString("r_opinion"));
				vo = new RecordVO();
				vo.setR_num(rs.getInt("r_num"));
				vo.setR_date(rs.getDate("r_date"));
				vo.setR_d_code(rs.getInt("r_d_code"));
				vo.setR_opinion(rs.getString("r_opinion"));
				vo.setR_p_num(rs.getInt("r_p_num"));
				vo.setR_e_code(rs.getInt("r_e_code"));
				vo.setR_symptom(rs.getString("r_symptom"));
				list.add(vo);
			}

			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		for (RecordVO v : list) {
			System.out.println(v.getR_opinion());
		}

		return list;
	}

	public String EmployeeName(int e_code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String e_name = "";

		// RecordVO vo = new RecordVO();
		// ArrayList<RecordVO> list = new ArrayList<>();
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "select * from employee where e_code = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, e_code);

			rs = pstmt.executeQuery();

			// List<PatientVO> list = new ArrayList<>();
			while (rs.next()) {
				e_name = rs.getString("e_name");
			}

			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return e_name;
	}

	public String DiesaseName(int d_code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String d_name = "";

		// RecordVO vo = new RecordVO();
		// ArrayList<RecordVO> list = new ArrayList<>();
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "select * from disease where d_code = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, d_code);

			rs = pstmt.executeQuery();

			// List<PatientVO> list = new ArrayList<>();
			while (rs.next()) {
				d_name = rs.getString("d_name");
			}

			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return d_name;
	}

	public HashMap<String, Integer> MedName(int r_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		HashMap<String, Integer> map = new HashMap<>();
		// RecordVO vo = new RecordVO();
		// ArrayList<HashMap<String, Integer>> list = new ArrayList<>();
		try {
			conn = ConnectionHelper.getConnection();
			String str = "select * from prescription join medicine on m_code = p_m_code";
			str += " where p_r_num = " + r_num;
			String sql = str;

			pstmt = conn.prepareStatement(sql);
			// pstmt.setInt(1, r_code);

			rs = pstmt.executeQuery();

			// List<PatientVO> list = new ArrayList<>();
			while (rs.next()) {
				map.put(rs.getString("m_name"), rs.getInt("p_use"));

			}

			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return map;
	}

	public HashMap<String, Integer> ThName(int r_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		HashMap<String, Integer> map = new HashMap<>();
		try {
			conn = ConnectionHelper.getConnection();
			String str = "select * from tr_mapping join therapy on tr_t_code = t_code";
			str += " where tr_r_num = " + r_num;
			String sql = str;

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				System.out.println(rs.getInt("t_price"));
				map.put(rs.getString("t_name"), rs.getInt("t_price"));
			}

			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return map;
	}

	public paymentVO GetPayment(int r_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		paymentVO vo = new paymentVO();

		try {
			conn = ConnectionHelper.getConnection();
			String sql = "select * from payment where pay_r_num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo.setPay_num(rs.getInt("pay_num"));
				vo.setPay_amount(rs.getInt("pay_amount"));
				vo.setPay_basic(rs.getInt("pay_basic"));
				vo.setPay_cash(rs.getInt("pay_cash"));
				vo.setPay_card(rs.getInt("pay_card"));

				System.out.println(vo);
			}

			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return vo;
	}

	public void UpdatePayment(int r_num, int cash, int card) {
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_amount = 0; 

		try {
			conn = ConnectionHelper.getConnection();
			String sql = " UPDATE payment " + " SET PAY_CASH = '" + cash + "', PAY_CARD = '" + card
					+ "' WHERE PAY_R_NUM = " + r_num;
			String sql2 = "select pay_amount from payment where pay_r_num = ?";
			String sql3 = "update record set r_pay = 1 where r_num = " + r_num;
			
			stmt = conn.createStatement();
			int res = stmt.executeUpdate(sql);
			if (res > 0) {
				System.out.println("입력 성공");
			} else {
				System.out.println("입력 실패");
			}
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, r_num);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				total_amount = rs.getInt(1);
			}
			
			if( (cash + card) >= total_amount ) {
				stmt = conn.createStatement();
				int res2 = stmt.executeUpdate(sql3);
			
				if (res2 > 0) {
					System.out.println("입력 성공");
				} else {
					System.out.println("입력 실패");
				}
			}
			ConnectionHelper.close(rs);
			ConnectionHelper.close(stmt);
			ConnectionHelper.close(conn);

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public List<Integer> rnumSearch(String date) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Integer> list = new ArrayList<>();
		
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "select * from record where to_char(r_date,'YYYYMMDD') = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getInt("r_num"));
			}
			
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			return list;
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	

	}
	
	public int todaySales(int r_num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int amount = 0;
		
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "select * from payment where pay_r_num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				amount = rs.getInt("pay_amount");
			}
			
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			return amount;
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return amount;
	

	}
	
	public int avgSales() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		int avg = 0;
		
		try {
			conn = ConnectionHelper.getConnection();
			String sql1 = "SELECT SUM(PAY_AMOUNT) FROM PAYMENT";
			String sql2 = "SELECT COUNT(DISTINCT R_DATE) FROM RECORD";
			
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				total = rs.getInt(1);
			}
			
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				avg = rs.getInt(1);
			}
			
			int result = (total / avg);
			
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			return result;
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return 0;
	}

	public int avgVisit() {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int avgvisit = 0;
	
	try {
		conn = ConnectionHelper.getConnection();
		String sql = "SELECT ROUND(count(*)/count(distinct to_char(r_date, 'YYYYMMDD'))) FROM record";

		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();
		while (rs.next()) {
			avgvisit = rs.getInt(1);
		}
		
		ConnectionHelper.close(rs);
		ConnectionHelper.close(pstmt);
		ConnectionHelper.close(conn);
		return avgvisit;
	} catch (SQLException e) {

		e.printStackTrace();
	}

	return avgvisit;

	}
	
	public ArrayList<Integer> checkPay(int p_num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> arr = new ArrayList<>();
		
		try {
			conn = ConnectionHelper.getConnection();
			String sql = "SELECT r_pay from record where r_p_num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				arr.add(rs.getInt(1));
			}
			
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			return arr;
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return arr;

		}
	
}
