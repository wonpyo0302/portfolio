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
	
	
	int fix; // 게시물 고정 1=고정
	

	private int page; // 현재 페이지
	private int pageRow; // 한 페이지당 행(게시물)의 개수
	
	private String sword; //검색어
	private String stype; //검색타입
	
	private int startIdx; // 페이지별 시작 인덱스
	
	public HostNoticeVO () {
		this.page = 1;
		this.pageRow = 10;
	}
	
	public HostNoticeVO (int page, int pageRow) {
		this.page = page; 
		this.pageRow = pageRow;
	}
	
}
