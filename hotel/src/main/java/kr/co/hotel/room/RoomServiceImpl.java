package kr.co.hotel.room;

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
	public Model hotelTopFive(RoomVO vo, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RoomVO> searchList(RoomVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RoomVO> getDistrict(RoomVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RoomVO> stateInfo(RoomVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int searchCount(RoomVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RoomVO> hotelView(int hotel_no) {
		// TODO Auto-generated method stub
		return null;
	}


}
