package kr.co.hotel.hostnotice;

import java.util.Map;

public interface HostNoticeService {
	Map index(HostNoticeVO vo);
	int updateViewcount(int hnotice_no);
	HostNoticeVO view(int hnotice_no);
	boolean insert(HostNoticeVO vo);
	HostNoticeVO edit(int hnotice_no);
	boolean update(HostNoticeVO vo);
	boolean delete(int hnotice_no);
	
	HostNoticeVO nowRownum(HostNoticeVO vo);
	HostNoticeVO prevRownum(HostNoticeVO vo);
	HostNoticeVO nextRownum(HostNoticeVO vo);
	

}
