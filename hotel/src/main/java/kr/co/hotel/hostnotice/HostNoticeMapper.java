package kr.co.hotel.hostnotice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HostNoticeMapper {
	int count(int hnotice_no);
	List<HostNoticeVO> list(HostNoticeVO vo);
	HostNoticeVO view(int hnotice_no);
	int updateViewcount(int hnotice_no);
	
	int insert(HostNoticeVO vo); //(관리자용) 
	int update(HostNoticeVO vo); //(관리자용)
	int delete(int hnotice_no); //(관리자용)
	
	//현재글, 이전글, 다음글 rownum
	HostNoticeVO nowRownum(HostNoticeVO vo);
	HostNoticeVO prevRownum(HostNoticeVO vo);
	HostNoticeVO nextRownum(HostNoticeVO vo);
	
}
