package kr.co.hotel.hostnotice;

import java.util.Map;

public interface HostNoticeService {
	Map index(HostNoticeVO vo);
	int updateViewcount(int hnotice_no);
	HostNoticeVO view(int hnotice_no);
	boolean insert(HostNoticeVO vo); //(관리자용)
	HostNoticeVO edit(int hnotice_no); //(관리자용)
	boolean update(HostNoticeVO vo); //(관리자용)
	boolean delete(int hnotice_no); //(관리자용)
	
	HostNoticeVO nowRownum(HostNoticeVO vo);
	HostNoticeVO prevRownum(HostNoticeVO vo);
	HostNoticeVO nextRownum(HostNoticeVO vo);
	

}
