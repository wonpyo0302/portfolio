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
	private String host_birth;
	private int isConfirm;
	
	private int hotel_no;
	
	private int page; // 현재 페이지
	private int pageRow; // 한 페이지당 행(게시물)의 개수

	private String sword; // 검색어
	private String stype; // 검색유형

	private int startIdx; // 페이지별 시작 인덱스
	
	public HostVO() {
		this.page = 1;
		this.pageRow = 10;
	}

	public HostVO(int page, int pageRow) {
		this.page = page;
		this.pageRow = pageRow;
	}
}
