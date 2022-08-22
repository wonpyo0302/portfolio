package kr.co.hotel.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.HRRegister.ImageVO;
import kr.co.hotel.reserve.ReserveVO;

@Mapper
public interface ReviewMapper {
	//리뷰 작성페이지에 뿌려줄 예약 인스턴스 가져오기
	public ReserveVO get_reserve (ReviewVO vo);
	
	//리뷰 작성//예약테이블에 review_status도 1로 update해야함
	public int insert(ReviewVO vo);
	//예약테이블의 리뷰상태 업데이트
	public int update_review_status(ReviewVO vo);
	
//이원표작성(평점 관련 메소드, 리뷰카운트)
	boolean roomUpdate(int room_no);
	boolean hotelUpdate(int hotel_no);
	boolean roomReviewCount(int room_no);
	boolean hotelReviewCount(int hotel_no);
//--------------------------------------------------
	
	public int count(ReviewVO vo);
	
	public List<ReviewVO> list(ReviewVO vo);
	
	public ImageVO get_review_img (int review_no);
	
	public boolean delete(int review_no);
	
	
}
