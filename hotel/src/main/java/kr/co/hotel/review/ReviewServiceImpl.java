package kr.co.hotel.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hotel.reserve.ReserveVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired 
	ReviewMapper mapper;

	
	
	
	@Override
	public ReserveVO get_reserve(ReviewVO vo) {
		return mapper.get_reserve(vo);
	}


}
