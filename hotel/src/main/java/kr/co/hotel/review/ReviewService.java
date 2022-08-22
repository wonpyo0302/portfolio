package kr.co.hotel.review;

import java.util.Map;

import kr.co.hotel.reserve.ReserveVO;

public interface ReviewService {
	
	//예약번호(reserv_no)로 예약 인스턴스가져오기
	public ReserveVO get_reserve (ReviewVO vo);
	
	//리뷰 작성
	public boolean insert(ReviewVO vo);

	//이원표작성 /평점평균 및 리뷰 총 갯수 구하기
	boolean avgScroe(int room_no, int hotel_no);
	boolean reviewTotalCount(int room_no, int hotel_no);
	//--------------------------------------------------
	
	public Map index(ReviewVO vo);
	
	public boolean delete(int review_no);
	
	public boolean review_update(ReviewVO vo);
}
