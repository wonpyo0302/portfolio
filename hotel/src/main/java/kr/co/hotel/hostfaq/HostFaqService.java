package kr.co.hotel.hostfaq;

import java.util.List;

import kr.co.hotel.guestfaq.GuestFaqVO;

public interface HostFaqService {
	List<HostFaqVO> list(HostFaqVO vo); // 목록보기
	HostFaqVO view(int hfaq_no);// 상세보기
	
	boolean insert(HostFaqVO vo); // 등록하기(관리자용)
	HostFaqVO edit(int hfaq_no);// 수정폼(관리자용)
	boolean update(HostFaqVO vo);// 수정하기(관리자용)
	boolean delete(int hfaq_no);// 삭제하기(관리자용)
	

}
