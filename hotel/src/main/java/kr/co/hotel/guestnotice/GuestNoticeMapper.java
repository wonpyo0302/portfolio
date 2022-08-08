package kr.co.hotel.guestnotice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GuestNoticeMapper {
	int insert(GuestNoticeVO  vo);
	int count(int gnotice_no);
	List<GuestNoticeVO> list(GuestNoticeVO vo);
	GuestNoticeVO view(GuestNoticeVO vo);
	int updateViewcount(int gnotice_no);
	int update(GuestNoticeVO vo);
	int delete(int gnotice_no);
	
	
}
