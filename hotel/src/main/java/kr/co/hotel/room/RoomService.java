package kr.co.hotel.room;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;


public interface RoomService {
	RoomVO roomView(int room_no);
	List<RoomVO> getRoomImage(int room_no);
}
