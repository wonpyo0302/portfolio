package kr.co.hotel.host;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HostVO {
	private int host_no;
	private String host_id;
	private String host_pwd;
	private String host_email;
	private String host_name;
	private String host_hp;
	private Timestamp host_joindate;
	private String host_accountno;
	private String host_bank;
	
}
