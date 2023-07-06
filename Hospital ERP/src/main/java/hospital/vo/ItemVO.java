package hospital.vo;

public class ItemVO {
	private int i_code, i_num, i_stock, i_price;
	private String i_name, i_category, i_unit, i_expire, i_remark, i_memo; 
	
	public ItemVO ( ) { }

	public int getI_code() {
		return i_code;
	}

	public void setI_code(int i_code) {
		this.i_code = i_code;
	}

	public int getI_num() {
		return i_num;
	}

	public void setI_num(int i_num) {
		this.i_num = i_num;
	}

	public int getI_stock() {
		return i_stock;
	}

	public void setI_stock(int i_stock) {
		this.i_stock = i_stock;
	}

	public int getI_price() {
		return i_price;
	}

	public void setI_price(int i_price) {
		this.i_price = i_price;
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

	public String getI_unit() {
		return i_unit;
	}

	public void setI_unit(String i_unit) {
		this.i_unit = i_unit;
	}

	public String getI_expire() {
		return i_expire;
	}

	public void setI_expire(String i_expire) {
		this.i_expire = i_expire;
	}

	public String getI_remark() {
		return i_remark;
	}

	public void setI_remark(String i_remark) {
		this.i_remark = i_remark;
	}

	public String getI_memo() {
		return i_memo;
	}

	public void setI_memo(String i_memo) {
		this.i_memo = i_memo;
	}

	@Override
	public String toString() {
		return "ItemVO [i_code=" + i_code + ", i_num=" + i_num + ", i_stock=" + i_stock + ", i_price=" + i_price
				+ ", i_name=" + i_name + ", i_category=" + i_category + ", i_unit=" + i_unit + ", i_expire=" + i_expire
				+ ", i_remark=" + i_remark + ", i_memo=" + i_memo + "]";
	} ;
	
	
}
