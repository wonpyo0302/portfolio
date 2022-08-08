package kr.co.hotel.guestnotice;

import java.util.Map;

public interface GuestNoticeService {
	
	Map index(GuestNoticeVO vo);
	int insert(GuestNoticeVO  vo);
	GuestNoticeVO view( GuestNoticeVO vo);

	int updateViewcount(int gnotice_no);
	int update(GuestNoticeVO vo);
	int delete(int gnotice_no);
	

}
