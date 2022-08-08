package kr.co.hotel.hostreply;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class HostReplyVO {
	int hrboard_no;
	int hboard_no;
	int admin_no;
	String hrboard_content;
	Timestamp hrboard_regdate;
}
