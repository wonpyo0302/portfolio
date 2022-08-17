package kr.co.hotel.hostnotice;

import java.util.Map;

public interface HostNoticeService {
	Map index(HostNoticeVO vo);
	boolean insert(HostNoticeVO vo);
	HostNoticeVO edit(int hnotice_no);
	int updateViewcount(int hnotice_no);
	boolean update(HostNoticeVO vo);
	boolean delete(int hnotice_no);
	HostNoticeVO view(HostNoticeVO vo);
	

}
