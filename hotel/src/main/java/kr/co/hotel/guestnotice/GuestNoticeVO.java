package kr.co.hotel.guestnotice;

import java.sql.Timestamp;

import kr.co.hotel.domain.Criteria;
import lombok.Data;
import lombok.ToString;


@Data
@ToString
public class GuestNoticeVO extends Criteria {
	private int gnotice_no; // 공지사항 번호
	private int admin_no; // 관리자 번호
	private int gnotice_type; // 공지사항 유형
	private String gnotice_title; //제목
	private String gnotice_content; //내용
	private Timestamp gnotice_regdate; //작성일
	private int gnotice_viewcount; //조회수
	
	private int fix; // 게시물 고정 1=고정 (서브쿼리)
	private int rownum; 
	private int diff; // 최신글 new 날짜차이 (서브쿼리)
	
	private String filename_org;
	private String filename_real;

	private int page; // 현재 페이지
	private int pageRow; // 한 페이지당 행(게시물)의 개수
	private int startIdx; // 페이지별 시작 인덱스
	
	private String sword; //검색어
	private String stype; //검색타입
	

	
	
	private String admin_id; //관리자 로그인 확인용
	
	
	public GuestNoticeVO () {
		this.page = 1;
		this.pageRow = 10;
	}
	
	public GuestNoticeVO (int page, int pageRow) {
		this.page = page; 
		this.pageRow = pageRow;
	}
	
	
	
	
}
