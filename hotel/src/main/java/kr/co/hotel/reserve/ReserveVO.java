package kr.co.hotel.reserve;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReserveVO {
	private int reserv_no; 
	private String coupon_no; 
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
	private int point_deposit_status;

	
	
	//예약 내역에 필요한 필드 추가
	private String hotel_name;
	private int number;
	private int review_status;
	
	private int check_in_out_status;
	private Timestamp checkin_date;
	private Timestamp checkout_date;
	
	
	
	
	
	
	
	//페이지 및 검색
	private int page;
	private String stype;
	private String sword;
	
	private int startIdx;
	private int pageRow;
	
	public ReserveVO() {
		this(1, 10);
	}
	
	public ReserveVO(int page, int pageRow) {
		this.page = page;
		this.pageRow = pageRow;
	}
	
}
