package kr.co.hotel.HRRegister;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GuestMemberVO {
	private int guest_no;
	private String guest_id;
	private String guest_pwd;
	private String guest_email;
	private String guest_name;
	private String guest_hp;
	private String guest_addr1;
	private String guest_addr2;
	private String guest_birth;
	private Timestamp g_joindate;
	private String g_accountno;
	private String g_bank;
	private int point;
	private int g_gender;
}
