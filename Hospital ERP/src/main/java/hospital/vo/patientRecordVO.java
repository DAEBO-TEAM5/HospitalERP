package hospital.vo;

//환자 정보 테이블
public class patientRecordVO {
	private int patient_num;
	private String record_date, sysmptom, disease, medicine, prohibition, doctor;
	
	public patientRecordVO() {}
	
	public int getPatient_num() {
		return patient_num;
	}
	public void setPatient_num(int patient_num) {
		this.patient_num = patient_num;
	}
	public String getRecord_date() {
		return record_date;
	}
	public void setRecord_date(String record_date) {
		this.record_date = record_date;
	}
	public String getSysmptom() {
		return sysmptom;
	}
	public void setSysmptom(String sysmptom) {
		this.sysmptom = sysmptom;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public String getMedicine() {
		return medicine;
	}
	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}
	public String getProhibition() {
		return prohibition;
	}
	public void setProhibition(String prohibition) {
		this.prohibition = prohibition;
	}
	public String getDoctor() {
		return doctor;
	}
	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}


	@Override
	public String toString() {
		return "patientRecordVO [patient_num=" + patient_num + ", record_date=" + record_date + ", sysmptom=" + sysmptom
				+ ", disease=" + disease + ", medicine=" + medicine + ", prohibition=" + prohibition + ", doctor="
				+ doctor + "]";
	}
	
	
}
