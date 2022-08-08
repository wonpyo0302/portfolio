package kr.co.hotel.board;

import java.sql.Timestamp;


import lombok.Data;

@Data
public class HotelVO {
	private int hotel_no;
	private int host_no;
	private String hotel_name;
	private String addr;
	private String sec_addr;
	private String tel;
	private int isConfirm;
	private String hotel_content;
	private String reject;
	private int state_code;
	private int state_name;
	private int district_code;
	private int district_name;
	private String lat;
	private String lot;
	private int lowPrice;
	
	
	private int page;
	private String searchField;
	private String searchWord;
	private int startIdx;
	private int pageRow;
	
	public HotelVO() {
//		this.page = 1;
//		this.pageRow = 10;
		this(1, 10);
	}
	public HotelVO(int page, int pageRow) {
		this.page = page;
		this.pageRow = pageRow;
	}
}
