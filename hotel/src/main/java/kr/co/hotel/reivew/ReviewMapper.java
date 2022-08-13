package kr.co.hotel.reivew;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {
	
	int insert(ReviewVO vo);
	
	int count(ReviewVO vo);
	
	List<ReviewVO> list(ReviewVO vo);
	
	int delete (int no);
	

}
