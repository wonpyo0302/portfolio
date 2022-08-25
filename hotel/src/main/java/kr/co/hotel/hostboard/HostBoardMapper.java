package kr.co.hotel.hostboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.guest.GuestVO;
@Mapper

public interface HostBoardMapper {
	List<HostBoardVO> list(HostBoardVO vo); // 목록
	int updateViewcount(int hboard_no); // 조회수 증가
	int count(HostBoardVO vo); // 게시물 개수 체크
	HostBoardVO view(int hboard_no); //상세보기
	int insert(HostBoardVO vo); // 등록
	int update(HostBoardVO vo); // 수정
	int delete(int hboard_no); // 삭제

}
