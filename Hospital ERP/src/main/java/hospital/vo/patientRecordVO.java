package hospital.vo;

//환자 정보 테이블
public class patientRecordVO {
	private int num, p_amount, p_pay, p_r_num;
	private String name, birth, phone, address, sex, note, r_date, r_ban, r_d_code, symptom;
	
	public patientRecordVO(){ }
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getP_amount() {
		return p_amount;
	}
	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}
	public int getP_pay() {
		return p_pay;
	}
	public void setP_pay(int p_pay) {
		this.p_pay = p_pay;
	}
	public int getP_r_num() {
		return p_r_num;
	}
	public void setP_r_num(int p_r_num) {
		this.p_r_num = p_r_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getR_ban() {
		return r_ban;
	}
	public void setR_ban(String r_ban) {
		this.r_ban = r_ban;
	}
	public String getR_d_code() {
		return r_d_code;
	}
	public void setR_d_code(String r_d_code) {
		this.r_d_code = r_d_code;
	}
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
	@Override
	public String toString() {
		return "PatientVO [num=" + num + ", p_amount=" + p_amount + ", p_pay=" + p_pay + ", p_r_num=" + p_r_num
				+ ", name=" + name + ", birth=" + birth + ", phone=" + phone + ", address=" + address + ", sex=" + sex
				+ ", note=" + note + ", r_date=" + r_date + ", r_ban=" + r_ban + ", r_d_code=" + r_d_code + ", symptom="
				+ symptom + "]";
	}
	
	
}
