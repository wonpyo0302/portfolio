package kr.co.hotel.hostnotice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HostNoticeMapper {
	int insert(HostNoticeVO vo);
	int count(int hnotice_no);
	List<HostNoticeVO> list(HostNoticeVO vo);
	HostNoticeVO view(HostNoticeVO vo);
	int updateViewcount(int hnotice_no);
	int update(HostNoticeVO vo);
	int delete(int hnotice_no);
	
	
}
