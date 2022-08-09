package kr.co.hotel.guestfaq;

import java.util.List;
import java.util.Map;

public interface GuestFaqService {
	public Map index(GuestFaqVO vo); // 목록보기 // 목록 + 총 게시물 수 확인
	public int insert(GuestFaqVO vo); // 등록
	public int update(int gboard_no); // 수정
	public int delete(int gboard_no); // 삭제
	public int viewCount(int gboard_no); // 조회수 증가
	GuestFaqVO view(int gboard_no);// 상세보기
}
