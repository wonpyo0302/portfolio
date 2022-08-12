package kr.co.hotel.guestboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper

public interface GuestBoardMapper {
	int insert(GuestBoardVO vo); // 등록
	List<GuestBoardVO> list(GuestBoardVO vo); // 목록
	int updateViewcount(int gboard_no); // 조회수 증가
	int count(GuestBoardVO vo); // 게시물 개수 체크
	int update(GuestBoardVO vo); // 수정
	int delete(int gboard_no); // 삭제
	GuestBoardVO view(int gboard_no); //상세보기

}
