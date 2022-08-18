package kr.co.hotel.hostfaq;

import java.util.List;

public interface HostFaqService {
	List<HostFaqVO> list(HostFaqVO vo); // 목록보기
	boolean insert(HostFaqVO vo); // 등록하기
	HostFaqVO view(int hfaq_no);// 상세보기
}
