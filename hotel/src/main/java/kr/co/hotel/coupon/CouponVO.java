package kr.co.hotel.coupon;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CouponVO {
	private String coupon_no; 
	private int guest_no; 
	private int coupon_price; 
	private Timestamp coupon_date; 
	private Timestamp expdate; 
	private Timestamp usedate; 
	private int use_status;
	private int delete_status;
	
}
