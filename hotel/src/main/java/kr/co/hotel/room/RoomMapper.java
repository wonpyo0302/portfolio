package kr.co.hotel.room;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.HRRegister.ImageVO;

@Mapper
public interface RoomMapper {
	RoomVO roomView(int room_no);
	List<RoomVO> getRoomImage(int room_no);
}
