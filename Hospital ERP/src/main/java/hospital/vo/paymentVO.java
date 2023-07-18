package hospital.vo;

import java.sql.Date;

public class paymentVO {
	private int pay_num, pay_amount, pay_basic, pay_cash, pay_card, pay_r_num;
	
	public paymentVO() {}

	public int getPay_num() {
		return pay_num;
	}

	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}

	public int getPay_amount() {
		return pay_amount;
	}

	public void setPay_amount(int pay_amount) {
		this.pay_amount = pay_amount;
	}

	public int getPay_basic() {
		return pay_basic;
	}

	public void setPay_basic(int pay_basic) {
		this.pay_basic = pay_basic;
	}

	public int getPay_cash() {
		return pay_cash;
	}

	public void setPay_cash(int pay_cash) {
		this.pay_cash = pay_cash;
	}

	public int getPay_card() {
		return pay_card;
	}

	public void setPay_card(int pay_card) {
		this.pay_card = pay_card;
	}

	public int getPay_r_num() {
		return pay_r_num;
	}

	public void setPay_r_num(int pay_r_num) {
		this.pay_r_num = pay_r_num;
	}

	@Override
	public String toString() {
		return "paymentVO [pay_num=" + pay_num + ", pay_amount=" + pay_amount + ", pay_basic=" + pay_basic
				+ ", pay_cash=" + pay_cash + ", pay_card=" + pay_card + ", pay_r_num=" + pay_r_num + "]";
	}
	
	
}
