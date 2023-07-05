package hospital.vo;

// CREATE TABLE hospital_id ( --병원아이디
//		h_id	varchar2(20)		NOT NULL, --병원ID
//		h_name	varchar2(50)		NULL, --병원명
//		h_pwd	varchar2(30)		NOT NULL, --병원 비밀번호
//		h_phone	varchar2(20)		NULL, --병원 전화번호
//      h_email varchar2(40)        NOT NULL, --병원 이메일
//		h_post	varchar2(10)		NULL --병원 우편번호
//		h_address	varchar2(200)		NULL, --병원주소
//	);


//로그인 정보
public class LoginVO {

	private String h_id, h_name, h_address, h_phone, h_pwd, h_email, h_post;

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

	
}