package kr.co.hotel.guestfaq;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper

public interface GuestFaqMapper {
	Map list(GuestFaqVO vo); // 목록
	public GuestFaqVO view(int gfaq_no); // 상세보기
	int insert(GuestFaqVO vo); // 등록
}
