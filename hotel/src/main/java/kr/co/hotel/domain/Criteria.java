package kr.co.hotel.domain;

import lombok.Data;

@Data
public class Criteria {
	//게시글 조회 쿼리에 전달될 파라미터 담는 클래스
	
	private int page;
	private int pageRow;
	
	private int startIdx;
	
	public Criteria() {
		this.page = 1;
		this.pageRow = 10;
	}
	
	public Criteria(int page, int pageRow) {
		this.page = page;
		this.pageRow = pageRow;
	}

}
