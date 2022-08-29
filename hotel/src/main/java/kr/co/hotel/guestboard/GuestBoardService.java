package kr.co.hotel.guestboard;

import java.util.Map;

import kr.co.hotel.guest.GuestVO;

public interface GuestBoardService {
	
	Map index(GuestBoardVO vo); // 목록보기 
	int viewCount(int gboard_no); // 조회수 증가
	GuestBoardVO view(int gboard_no); // 상세보기
	boolean insert(GuestBoardVO vo); // 등록(관리자용)
	GuestBoardVO edit(int gboard_no); // 수정폼(관리자용)
	boolean update(GuestBoardVO vo); // 수정처리(관리자용)
	boolean delete(int gboard_no); // 삭제(관리자용)
	boolean replyupdate(GuestBoardVO vo); // 답변달기(관리자용)
	
}
