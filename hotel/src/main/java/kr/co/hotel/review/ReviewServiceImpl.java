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


	@Override
	public boolean insert(ReviewVO vo) {
		boolean r = false;
		if(mapper.insert(vo)>0 ? true:false) {
			if(mapper.update_review_status(vo)>0) {
				r = true;
			}
		}
		return r ;
	}

	//이원표작성
	//호텔 객실 전체 평점 업데이트
	@Override
	public boolean avgScroe(int room_no, int hotel_no) {
		boolean r= false;
		if(mapper.roomUpdate(room_no)&&mapper.hotelUpdate(hotel_no)) {
			r=true;
		}
		return r;
	}


	@Override
	public boolean reviewTotalCount(int room_no, int hotel_no) {
		boolean r = false;
		if(mapper.hotelReviewCount(hotel_no)&&mapper.roomReviewCount(room_no)) {
			r=true;
		}
		return r;
	}
//---------------------------------------------------------------------	

	

}
