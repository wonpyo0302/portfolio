package kr.co.hotel.guestfaq;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper

public interface GuestFaqMapper {
	List<GuestFaqVO> list(GuestFaqVO vo); // 목록
	GuestFaqVO view(int gfaq_no); // 상세보기
	int insert(GuestFaqVO vo); // 등록(관리자용)
	int update(GuestFaqVO vo); // 수정(관리자용)
	int delete(int gfaq_no);// 삭제(관리자용)
}
