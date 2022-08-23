package kr.co.hotel.guestfaq;

import kr.co.hotel.guest.GuestVO;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class GuestFaqVO extends GuestVO{
	private int gfaq_no; // 문의번호
	private int gfaq_type; // 문의유형
	private String gfaq_title; // 문의제목
	private String gfaq_content; // 문의내용
	private int admin_no; // 관리자번호
	
	// 관리자 로그인 확인용
	private String admin_id; 
}
