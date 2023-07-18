package hospital.vo;

public class ItemRelVO {
	private String rel_date, rel_time, i_name, i_category, rel_user, rel_remark, dis_date, dis_time, dis_user, dis_remark;
	private int rel_i_code, rel_amount, i_stock, rel_after, dis_i_code, dis_amount, dis_after;

	public ItemRelVO ( ) { }

	public String getRel_date() {
		return rel_date;
	}

	public void setRel_date(String rel_date) {
		this.rel_date = rel_date;
	}

	public String getRel_time() {
		return rel_time;
	}

	public void setRel_time(String rel_time) {
		this.rel_time = rel_time;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public String getI_category() {
		return i_category;
	}

	public void setI_category(String i_category) {
		this.i_category = i_category;
	}

	public String getRel_user() {
		return rel_user;
	}

	public void setRel_user(String rel_user) {
		this.rel_user = rel_user;
	}

	public String getRel_remark() {
		return rel_remark;
	}

	public void setRel_remark(String rel_remark) {
		this.rel_remark = rel_remark;
	}

	public int getRel_i_code() {
		return rel_i_code;
	}

	public void setRel_i_code(int rel_i_code) {
		this.rel_i_code = rel_i_code;
	}

	public int getRel_amount() {
		return rel_amount;
	}

	public void setRel_amount(int rel_amount) {
		this.rel_amount = rel_amount;
	}

	public int getI_stock() {
		return i_stock;
	}

	public void setI_stock(int i_stock) {
		this.i_stock = i_stock;
	}

	public int getRel_after() {
		return rel_after;
	}

	public void setRel_after(int rel_after) {
		this.rel_after = rel_after;
	}

	
	
	public String getDis_date() {
		return dis_date;
	}

	public void setDis_date(String dis_date) {
		this.dis_date = dis_date;
	}

	public String getDis_time() {
		return dis_time;
	}

	public void setDis_time(String dis_time) {
		this.dis_time = dis_time;
	}

	public String getDis_user() {
		return dis_user;
	}

	public void setDis_user(String dis_user) {
		this.dis_user = dis_user;
	}

	public String getDis_remark() {
		return dis_remark;
	}

	public void setDis_remark(String dis_remark) {
		this.dis_remark = dis_remark;
	}

	public int getDis_i_code() {
		return dis_i_code;
	}

	public void setDis_i_code(int dis_i_code) {
		this.dis_i_code = dis_i_code;
	}

	public int getDis_amount() {
		return dis_amount;
	}

	public void setDis_amount(int dis_amount) {
		this.dis_amount = dis_amount;
	}

	public int getDis_after() {
		return dis_after;
	}

	public void setDis_after(int dis_after) {
		this.dis_after = dis_after;
	}

	@Override
	public String toString() {
		return "ItemRelVO [rel_date=" + rel_date + ", rel_time=" + rel_time + ", i_name=" + i_name + ", i_category="
				+ i_category + ", rel_user=" + rel_user + ", rel_remark=" + rel_remark + ", dis_date=" + dis_date
				+ ", dis_time=" + dis_time + ", dis_user=" + dis_user + ", dis_remark=" + dis_remark + ", rel_i_code="
				+ rel_i_code + ", rel_amount=" + rel_amount + ", i_stock=" + i_stock + ", rel_after=" + rel_after
				+ ", dis_i_code=" + dis_i_code + ", dis_amount=" + dis_amount + ", dis_after=" + dis_after + "]";
	}

	
}