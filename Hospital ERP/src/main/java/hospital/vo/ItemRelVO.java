package hospital.vo;

public class ItemRelVO {
	String 
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