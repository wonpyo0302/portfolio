package kr.co.hotel.favorite;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.HRRegister.ImageVO;

@Mapper
public interface FavoriteMapper {
	
	int insert(FavoriteVO vo);
	
	int count(FavoriteVO vo);
	
	List<FavoriteVO> list(FavoriteVO vo);
	
	int delete (FavoriteVO vo);
	
	List<ImageVO> get_hotel_img(int no);
	
	int get_Review_Count(int hotel_no);
	

}
