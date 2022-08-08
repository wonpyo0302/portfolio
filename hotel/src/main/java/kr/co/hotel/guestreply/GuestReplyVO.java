package kr.co.hotel.guestreply;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GuestReplyVO {
	int grboard_no;
	int admin_no;
	int gboard_no;
	String grboard_content;
	Timestamp grboard_regdate;
}
