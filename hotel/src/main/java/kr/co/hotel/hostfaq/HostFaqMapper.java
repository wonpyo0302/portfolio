package kr.co.hotel.hostfaq;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper

public interface HostFaqMapper {
	List<HostFaqVO> list(HostFaqVO vo); // 목록
	HostFaqVO view(int hfaq_no); // 상세보기
	int insert(HostFaqVO vo); // 등록
}
