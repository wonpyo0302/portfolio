package kr.co.hotel.hostboard;

import java.util.Map;

import kr.co.hotel.guest.GuestVO;

public interface HostBoardService {
	
	Map index(HostBoardVO vo); // 목록보기 
	int viewCount(int hboard_no); // 조회수 증가
	HostBoardVO view(int hboard_no); // 상세보기
	boolean insert(HostBoardVO vo); // 등록
	HostBoardVO edit(int hboard_no); // 수정폼
	boolean update(HostBoardVO vo); // 수정처리
	boolean delete(int hboard_no); // 삭제
	
}
