package kr.co.hotel.guestboard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
@Mapper

public interface GuestBoardMapper {
	public int insert(GuestBoardVO vo); // 등록
	List<GuestBoardVO> list(GuestBoardVO vo); // 목록
	public int updateViewcount(int gboard_no); // 조회수 증가
	public int count(GuestBoardVO vo); // 게시물 개수 체크
	public int update(int gboard_no); // 수정
	public int delete(int gboard_no); // 삭제
	public GuestBoardVO view(int gboard_no); //상세보기
}
