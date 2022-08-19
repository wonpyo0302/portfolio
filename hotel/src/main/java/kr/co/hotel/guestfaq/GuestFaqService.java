package kr.co.hotel.guestfaq;

import java.util.List;

public interface GuestFaqService {
	List<GuestFaqVO> list(GuestFaqVO vo); // 목록보기
	boolean insert(GuestFaqVO vo); // 등록하기
	GuestFaqVO view(int gfaq_no);// 상세보기
	GuestFaqVO edit(int gfaq_no);// 수정폼
	boolean update(GuestFaqVO vo);// 수정하기
	boolean delete(int gfaq_no);// 삭제하기
}
