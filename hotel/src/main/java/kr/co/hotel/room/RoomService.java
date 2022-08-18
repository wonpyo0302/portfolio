package kr.co.hotel.room;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;


public interface RoomService {
	Model getImage(RoomVO vo, Model model);
	
}
