package kr.co.hotel.guestnotice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GuestNoticeMapper {
	int count(int gnotice_no);
	List<GuestNoticeVO> list(GuestNoticeVO vo);
	GuestNoticeVO view(int gnotice_no);
	int updateViewcount(int gnotice_no); 
	
	int insert(GuestNoticeVO vo); //(관리자용)
	int update(GuestNoticeVO vo); //(관리자용)
	int delete(int gnotice_no); //(관리자용)
	
	//현재글, 이전글, 다음글 rownum
	GuestNoticeVO nowRownum(GuestNoticeVO vo);
	GuestNoticeVO prevRownum(GuestNoticeVO vo);
	GuestNoticeVO nextRownum(GuestNoticeVO vo);
	
	
}
