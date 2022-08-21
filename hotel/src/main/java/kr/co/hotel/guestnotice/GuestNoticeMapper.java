package kr.co.hotel.guestnotice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GuestNoticeMapper {
	int insert(GuestNoticeVO vo);
	int count(int gnotice_no);
	List<GuestNoticeVO> list(GuestNoticeVO vo);
	
	int updateViewcount(int gnotice_no);
	int update(GuestNoticeVO vo);
	int delete(int gnotice_no);
	GuestNoticeVO view(int gnotice_no);
	
	//현재글, 이전글, 다음글 rownum
	GuestNoticeVO nowRownum(GuestNoticeVO vo);
	GuestNoticeVO prevRownum(GuestNoticeVO vo);
	GuestNoticeVO nextRownum(GuestNoticeVO vo);
	
	
}
