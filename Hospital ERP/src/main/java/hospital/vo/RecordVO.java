package hospital.vo;

import java.sql.Date;

public class RecordVO {
	private int r_num, r_p_num, r_d_code, r_e_code;
	private String r_opinion;
	private Date r_date;
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getR_p_num() {
		return r_p_num;
	}
	public void setR_p_num(int r_p_num) {
		this.r_p_num = r_p_num;
	}
	public int getR_d_code() {
		return r_d_code;
	}
	public void setR_d_code(int r_d_code) {
		this.r_d_code = r_d_code;
	}
	public int getR_e_code() {
		return r_e_code;
	}
	public void setR_e_code(int r_e_code) {
		this.r_e_code = r_e_code;
	}
	public String getR_opinion() {
		return r_opinion;
	}
	public void setR_opinion(String r_opinion) {
		this.r_opinion = r_opinion;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	
	
	
	

}
