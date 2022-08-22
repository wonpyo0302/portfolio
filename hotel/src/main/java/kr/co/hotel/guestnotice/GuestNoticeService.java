package kr.co.hotel.guestnotice;

import java.util.Map;

public interface GuestNoticeService {
	Map index(GuestNoticeVO vo);
	int updateViewcount(int gnotice_no);
	GuestNoticeVO view(int gnotice_no);
	boolean insert(GuestNoticeVO vo); //(관리자용)
	GuestNoticeVO edit(int gnotice_no); //(관리자용)
	boolean update(GuestNoticeVO vo); //(관리자용)
	boolean delete(int gnotice_no); //(관리자용)
	
	GuestNoticeVO nowRownum(GuestNoticeVO vo);
	GuestNoticeVO prevRownum(GuestNoticeVO vo);
	GuestNoticeVO nextRownum(GuestNoticeVO vo);

}
