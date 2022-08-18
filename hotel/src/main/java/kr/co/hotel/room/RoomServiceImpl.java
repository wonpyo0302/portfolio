package kr.co.hotel.room;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	RoomMapper mapper;

	@Override
	public Model getImage(RoomVO vo, Model model) {
		vo.setRoom_no(1);
		model.addAttribute("roomOne",mapper.getImageFirst(vo));
		vo.setRoom_no(2);
		model.addAttribute("roomTwo",mapper.getImageFirst(vo));
		vo.setRoom_no(3);
		model.addAttribute("roomThr",mapper.getImageFirst(vo));
		return model;
	}

}
