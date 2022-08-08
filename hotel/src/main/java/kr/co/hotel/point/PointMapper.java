package kr.co.hotel.point;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface PointMapper {
	
	int count(PointVO vo);
	
	List<PointVO> list(PointVO vo);
	
	Integer total (int guest_no);
	
	int delete (int no);
	

}
