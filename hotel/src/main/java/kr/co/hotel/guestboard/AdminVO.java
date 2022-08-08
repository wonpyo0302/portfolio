package kr.co.hotel.guestboard;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminVO {
	int admin_no;
	String admin_id;
	String admin_pwd;
}
