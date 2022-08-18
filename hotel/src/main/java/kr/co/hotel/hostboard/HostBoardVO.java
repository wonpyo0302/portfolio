package kr.co.hotel.hostboard;

import java.sql.Timestamp;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class HostBoardVO {
	private int hboard_no; // 게시물 번호
	private int host_no; // 호스트 번호
	private int hboard_type; // 문의유형
	private String hboard_title; // 제목
	private String hboard_content; // 내용
	private int hboard_viewcount; // 조회수
	private String hboard_writer; // 작성자
	private Timestamp hboard_regdate; // 등록일
	private Timestamp hboard_updatedate; // 수정일
	private int hboard_status; // 답변상태
	
	private String host_name;// 스칼라서브쿼리로 host_name를 가져옴
	
	private String filename_org;
	private String filename_real;
	
	private int page; // 현재 페이지
	private int pageRow; // 한 페이지당 행(게시물)의 개수
	private int startIdx; // 페이지별 시작 인덱스
	
	private String sword; // 검색어
	private String stype; // 검색유형
	

	public HostBoardVO () {
		this.page = 1;
		this.pageRow = 10;
	}
	
	public HostBoardVO (int page, int pageRow) {
		this.page = page; 
		this.pageRow = pageRow;
	}
	
	
}
