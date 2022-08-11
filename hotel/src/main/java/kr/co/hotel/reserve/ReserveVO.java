package kr.co.hotel.reserve;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReserveVO {
	private int reserv_no; 
	private int coupon_no; 
	private int room_no; 
	private int guest_no; 
	private int hotel_no; 
	private String startdate; 
	private String enddate; 
	private int used_point; 
	private String canceldate; 
	private int total_price; 
	private int use_status; 
	private int rev_status;
	private int pay_status; 
	private Timestamp rev_date; 
	private int pay_type;
	private String imp_uid;
	private String rev_name;
	private String rev_hp;
}
