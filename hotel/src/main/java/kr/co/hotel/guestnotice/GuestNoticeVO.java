package kr.co.hotel.guestnotice;

import java.sql.Timestamp;

import kr.co.hotel.domain.Criteria;
import lombok.Data;
import lombok.ToString;


@Data
@ToString
public class GuestNoticeVO extends Criteria {
	int gnotice_no; // 공지사항 번호
	int admin_no; // 관리자 번호
	String gnotice_title; //제목
	String gnotice_content; //내용
	Timestamp gnotice_regdate; //작성일
	int gnotice_viewcount; //조회수
	
	int fix; // 게시물 고정 1=고정
	

	private int page; // 현재 페이지
	private int pageRow; // 한 페이지당 행(게시물)의 개수
	
	private String sword; //검색어
	private String stype; //검색타입
	
	private int startIdx; // 페이지별 시작 인덱스
	
	public GuestNoticeVO () {
		this.page = 1;
		this.pageRow = 10;
	}
	
	public GuestNoticeVO (int page, int pageRow) {
		this.page = page; 
		this.pageRow = pageRow;
	}
	
	
	
	
}
