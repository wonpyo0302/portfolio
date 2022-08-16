package kr.co.hotel.guestboard;

import java.util.Map;

import kr.co.hotel.guest.GuestVO;

public interface GuestBoardService {
	
	Map index(GuestBoardVO vo); // 목록보기 // 목록 + 총 게시물 수 확인
	boolean insert(GuestBoardVO vo); // 등록
	GuestBoardVO edit(int gboard_no); // 수정폼
	boolean update(GuestBoardVO vo); // 수정처리
	boolean delete(int gboard_no); // 삭제
	int viewCount(int gboard_no); // 조회수 증가
	GuestBoardVO view(int gboard_no); // 상세보기
	
}
