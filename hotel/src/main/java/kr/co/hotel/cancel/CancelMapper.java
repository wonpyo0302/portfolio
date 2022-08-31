package kr.co.hotel.cancel;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.reserve.ReserveVO;

@Mapper
public interface CancelMapper {

//카드결제 취소
	//1. 취소할 결제 내역 가져오기
	public int cancelReserve(ReserveVO vo);
	
	//2. 특정 게스트 포인트 업데이트
	public int cancelGuestPoint(GuestVO vo);
	
	//3. 포인트 테이블 이력 저장(포인트 취소)
	public int cancelPoint(ReserveVO vo);
	
	//4. 쿠폰 상태 업데이트
	public void cancelCoupon(ReserveVO vo);
	
//무통장 입금 취소	
	//1. 취소할 결제 내역 가져오기
	public ReserveVO SelectReserve(ReserveVO vo);
	
	//2. 예약 테이블에서 상태 업데이트
	public int UpdateReserveStatus(ReserveVO vo);
	
	//3. 특정 게스트 포인트 업데이트
	public int UpdateGuestPoint(ReserveVO vo);
	
	//4. 포인트 테이블 이력 저장(포인트 취소)
	public int InsertPointTable(ReserveVO vo);
	
	//5. 쿠폰 상태 업데이트
	public int UpdateCouponStatus(ReserveVO vo);
}
