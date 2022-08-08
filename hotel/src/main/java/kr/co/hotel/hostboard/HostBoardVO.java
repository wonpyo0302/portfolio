package kr.co.hotel.hostboard;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class HostBoardVO {
	int hboard_no;
	int host_no;
	int hboard_type;
	String hboard_title;
	String hboard_content;
	int hboard_viewcount;
	String hboard_writer;
	Timestamp hboard_regdate;
	int hboard_status;
}
