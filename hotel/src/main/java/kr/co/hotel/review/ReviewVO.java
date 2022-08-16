package kr.co.hotel.review;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//or @Data
public class ReviewVO {
	private int review_no;
	private int guest_no;
	private int hotel_no;
	private int room_no;
	private int reserv_no; //예약 테이블의 예약번호
	private String review_title;
	private String review_content;
	private Timestamp review_regdate;
	private int review_score;
	
	
	
	//스칼라 서브쿼리로 호텔명과, 객실번호를 가져옴
	private String hotel_name;
	private int number;
	
	
	//페이징
	private int startIdx; //페이지의 row시작 번호
	private int pageRow; //페이지당 row갯수 //기본 10의로 설정
	private int page;
	
	
	
	public ReviewVO() {
		this.pageRow = 10; //기본 10의로 설정
		this.page = 1;
		
	}
	

}
