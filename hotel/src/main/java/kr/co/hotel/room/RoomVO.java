package kr.co.hotel.room;

import java.sql.Timestamp;
import java.util.List;

import kr.co.hotel.HRRegister.ImageVO;
import lombok.Data;

@Data

public class RoomVO {
	private int room_no;
	private int host_no;
	private int hotel_no;
	private int number; //방번호
	private String room_name; 
	private String room_content; 
	private int room_price;
	private int status;
	
	private String filename_org;
	private String filename_real;
	private int image_order;
	private String image_type;
	private List<ImageVO> imageList;
	
	
	
	//페이지 및 검색
	private int page;
	private String stype;
	private String sword;
	
	private int startIdx;
	private int pageRow;
	
	public RoomVO() {
//		this.page = 1;
//		this.pageRow = 10;
		this(1, 10);
	}
	
	public RoomVO(int page, int pageRow) {
		this.page = page;
		this.pageRow = pageRow;
		
		this.status = 0; //룸 승인 상태 0: 신청 전, 1: 신청 후 대기, 2: 승인, -1: 반려
	}
	
	
	

}
