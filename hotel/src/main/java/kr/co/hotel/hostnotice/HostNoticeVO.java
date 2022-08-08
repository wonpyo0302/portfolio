package kr.co.hotel.hostnotice;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class HostNoticeVO {
	int hnotice_no;
	int admin_no;
	String hnotice_title;
	String hnotice_content;
	Timestamp hnotice_regdate;
	int hnotice_viewcount;
	
}
