package kr.co.hotel.guestnotice;

import java.util.Map;

public interface GuestNoticeService {
	Map index(GuestNoticeVO vo);
	boolean insert(GuestNoticeVO vo);
	GuestNoticeVO edit(int gnotice_no);
	int updateViewcount(int gnotice_no);
	boolean update(GuestNoticeVO vo);
	boolean delete(int gnotice_no);
	GuestNoticeVO view(int gnotice_no);
	
	GuestNoticeVO nowRownum(GuestNoticeVO vo);
	GuestNoticeVO prevRownum(GuestNoticeVO vo);
	GuestNoticeVO nextRownum(GuestNoticeVO vo);

}
