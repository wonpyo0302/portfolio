package kr.co.hotel.hostnotice;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class HostNoticeVO {
	private int hnotice_no;
	private int admin_no;
	private int hnotice_type;
	private String hnotice_title;
	private String hnotice_content;
	private Timestamp hnotice_regdate;
	private int hnotice_viewcount;
	
	private int fix; // 게시물 고정 1=고정
	private int rownum;
	private int diff; // 최신글 new 날짜차이 (서브쿼리)
	
	private String filename_org;
	private String filename_real;

	private int page; // 현재 페이지
	private int pageRow; // 한 페이지당 행(게시물)의 개수
	private int startIdx; // 페이지별 시작 인덱스
	
	private String sword; //검색어
	private String stype; //검색타입
	
	
	
	
	public HostNoticeVO () {
		this.page = 1;
		this.pageRow = 10;
	}
	
	public HostNoticeVO (int page, int pageRow) {
		this.page = page; 
		this.pageRow = pageRow;
	}
	
}
