package kr.co.hotel.review;

import java.util.Map;

import kr.co.hotel.reserve.ReserveVO;

public interface ReviewService {
	
	//예약번호(reserv_no)로 예약 인스턴스가져오기
	public ReserveVO get_reserve (ReviewVO vo);
}
