package kr.co.hotel.guestboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.guest.GuestVO;
@Mapper

public interface GuestBoardMapper {
	List<GuestBoardVO> list(GuestBoardVO vo); // 목록
	int updateViewcount(int gboard_no); // 조회수 증가
	int count(GuestBoardVO vo); // 게시물 개수 체크
	GuestBoardVO view(int gboard_no); //상세보기
	int insert(GuestBoardVO vo); // 등록(관리자용)
	int update(GuestBoardVO vo); // 수정(관리자용)
	int delete(int gboard_no); // 삭제(관리자용)
	int replyupdate(GuestBoardVO vo); // 답변달기(관리자용)

	
	//마이페이지 내 문의글 목록보기_빛찬_220829
	List<GuestBoardVO> list_in_mypage(GuestBoardVO vo); // 목록
	int count_in_mypage(GuestBoardVO vo); // 게시물 개수 체크



}
