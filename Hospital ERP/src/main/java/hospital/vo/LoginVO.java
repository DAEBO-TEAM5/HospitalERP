package hospital.vo;

import java.sql.Connection;

//로그인 정보
public class LoginVO {

	private String h_id, h_name, h_address, h_phone, h_pwd, h_email, h_post;
	private int h_e_code;
	
	public LoginVO() {	}

	public String getH_id() {
		return h_id;
	}

	public void setH_id(String h_id) {
		this.h_id = h_id;
	}

	public String getH_name() {
		return h_name;
	}

	public String getH_email() {
		return h_email;
	}

	public void setH_email(String h_email) {
		this.h_email = h_email;
	}

	public void setH_name(String h_name) {
		this.h_name = h_name;
	}

	public String getH_pwd() {
		return h_pwd;
	}

	public void setH_pwd(String h_pwd) {
		this.h_pwd = h_pwd;
	}

	public String getH_phone() {
		return h_phone;
	}

	public void setH_phone(String h_phone) {
		this.h_phone = h_phone;
	}

	public String getH_post() {
		return h_post;
	}

	public void setH_post(String h_post) {
		this.h_post = h_post;
	}

	public String getH_address() {
		return h_address;
	}

	public void setH_address(String h_address) {
		this.h_address = h_address;
	}

	public int getH_e_code() {
		return h_e_code;
	}

	public void setH_e_code(int h_e_code) {
		this.h_e_code = h_e_code;
	}


	
}