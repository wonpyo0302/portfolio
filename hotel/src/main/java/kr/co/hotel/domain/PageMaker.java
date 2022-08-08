package kr.co.hotel.domain;

import lombok.Data;

@Data

public class PageMaker {
	// 페이징 처리 클래스
	
	private Criteria cri;
	
	private int totalCount;
	private int totalPage;
	
	private int startPage;
	private int endPage;
	
	private boolean prev;
	private boolean next;
	
	public PageMaker(Criteria cri, int totalCount) {
		this.cri = cri;
		this.totalCount = totalCount; //총 게시물수
		this.totalPage = this.totalCount / cri.getPageRow(); // 총페이지수
		
		if (this.totalCount % cri.getPageRow() > 0 ) this.totalPage++; //페이지 1증가
		
		
		this.endPage = (int)(Math.ceil(cri.getPage() / 10.0)) * 10;
		this.startPage = this.endPage - 9 ;
		
		if (this.endPage < this.totalPage) {
			this.endPage = this.totalPage;
		}
		
		this.prev = this.startPage > 1 ? true : false;
		this.next = this.endPage < this.totalPage ? true : false;
	}
	
	
}
