package kr.co.hotel.guestfaq;

import java.sql.Timestamp;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class GuestFaqVO {
	private int gfaq_no; // 문의번호
	private String gfaq_title; // 문의제목
	private String gfaq_content; // 문의내용
	private int gfaq_type; // 문의유형
	private int admin_no; // 관리자번호
	
}
