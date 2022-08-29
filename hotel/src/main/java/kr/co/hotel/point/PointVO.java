package kr.co.hotel.point;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//or @Data
public class PointVO {
	private int point_no;
	private int guest_no;
	private int io_point;//작성자
	private int totalpoint;
	private Timestamp date; 
	private String hotel_name;
	private int pointtype;
	
	private Timestamp searchStartDate; 
	private Timestamp searchEndDate; 
	

	
	//페이징
	private int startIdx; //페이지의 row시작 번호
	private int pageRow; //페이지당 row갯수 //기본 10의로 설정
	private int page;
	
	
	
	public PointVO() {
		this.pageRow = 10; //기본 10의로 설정
		this.page = 1;
		
	}
	
	
	
	

}