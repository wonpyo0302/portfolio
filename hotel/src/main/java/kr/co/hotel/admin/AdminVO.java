package kr.co.hotel.admin;

import lombok.Data;

@Data
public class AdminVO {
	private int admin_no;
	private String admin_id;
	private String admin_pwd;

	private int page; // 현재 페이지
	private int pageRow; // 한 페이지당 행(게시물)의 개수

	private String sword; // 검색어
	private String stype; // 검색유형

	private int startIdx; // 페이지별 시작 인덱스

	public AdminVO() {
		this.page = 1;
		this.pageRow = 10;
	}

	public AdminVO(int page, int pageRow) {
		this.page = page;
		this.pageRow = pageRow;
	}

}
