package kr.co.hotel.hostfaq;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.guestfaq.GuestFaqVO;
@Mapper

public interface HostFaqMapper {
	List<HostFaqVO> list(HostFaqVO vo); // 목록
	HostFaqVO view(int hfaq_no); // 상세보기
	int insert(HostFaqVO vo); // 등록(관리자용)
	int update(HostFaqVO vo); // 수정(관리자용)
	int delete(int hfaq_no);// 삭제(관리자용)
}
