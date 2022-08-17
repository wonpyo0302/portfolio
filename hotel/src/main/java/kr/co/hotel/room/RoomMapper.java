package kr.co.hotel.room;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.HRRegister.ImageVO;

@Mapper
public interface RoomMapper {
	List getImageFirst(RoomVO vo);
	List getImageSec(RoomVO vo);
	List getImageThird(RoomVO vo);
	
}
