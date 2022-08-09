package kr.co.hotel.guestfaq;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
@Mapper

public interface GuestFaqMapper {
	List<GuestFaqVO> list(GuestFaqVO vo); // 목록
	public GuestFaqVO view(int gfaq_no); //상세보기
}
