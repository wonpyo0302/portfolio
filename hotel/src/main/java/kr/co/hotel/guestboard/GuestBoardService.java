package kr.co.hotel.guestboard;

import java.util.List;
import java.util.Map;

public interface GuestBoardService {
	
	Map index(GuestBoardVO vo); // 목록보기 // 목록 + 총 게시물 수 확인
	boolean insert(GuestBoardVO vo); // 등록
	boolean update(GuestBoardVO vo); // 수정
	boolean delete(int gboard_no); // 삭제
	int viewCount(int gboard_no); // 조회수 증가
	GuestBoardVO view(int gboard_no); // 상세보기
}
