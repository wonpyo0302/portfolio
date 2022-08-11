package kr.co.hotel.guestfaq;

import java.util.Map;

public interface GuestFaqService {
	Map index(GuestFaqVO vo); // 목록보기
	
	boolean insert(GuestFaqVO vo); // 등록하기
	GuestFaqVO view(int gfaq_no );// 상세보기
}
