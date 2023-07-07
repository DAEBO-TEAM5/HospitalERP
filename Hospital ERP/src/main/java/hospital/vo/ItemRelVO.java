package hospital.vo;

public class ItemRelVO {
	private String rel_date, rel_time, i_name, i_category, rel_user, rel_remark;
	private int rel_i_code, rel_amount, i_stock;

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

	@Override
	public String toString() {
		return "ItemRelVO [rel_date=" + rel_date + ", rel_time=" + rel_time + ", i_name=" + i_name + ", i_category="
				+ i_category + ", rel_user=" + rel_user + ", rel_remark=" + rel_remark + ", rel_i_code=" + rel_i_code
				+ ", rel_amount=" + rel_amount + ", i_stock=" + i_stock + "]";
	}
	
	
}


/*
SELECT r.rel_date, r.rel_time, i.i_name, r.rel_i_code, i.i_category, r.rel_amount, i.i_stock, r.rel_user, r.rel_remark
FROM release r
JOIN item i ON r.rel_i_code = i.i_code
UNION ALL
SELECT d.dis_date, d.dis_time, i.i_name, d.dis_i_code, i.i_category, d.dis_amount, i.i_stock, d.dis_user, d.dis_remark
FROM discard d
JOIN item i ON d.dis_i_code = i.i_code;
*/