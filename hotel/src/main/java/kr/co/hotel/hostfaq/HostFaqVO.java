package kr.co.hotel.hostfaq;

import java.sql.Timestamp;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class HostFaqVO {
	private int hfaq_no; // 문의번호
	private int hfaq_type; // 문의유형
	private String hfaq_title; // 문의제목
	private String hfaq_content; // 문의내용
	private int admin_no; // 관리자번호
	
	// 관리자 로그인 확인용
		private String admin_id; 
}
