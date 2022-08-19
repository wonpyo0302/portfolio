package kr.co.hotel.room;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.review.ReviewVO;

@Mapper
public interface RoomMapper {
	RoomVO roomView(int room_no);
	List<RoomVO> getRoomImage(int room_no);
	List<ReviewVO> getReviewList(int room_no);
}
