package kr.co.hotel.cancel;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.reserve.ReserveVO;

@Service
public interface CancelService {
	//카트 결제 취소
	public String cancel(ReserveVO vo, GuestVO gvo) throws IOException;

	//무통장입금 취소
	public ReserveVO SelectReserve(ReserveVO vo);//예약번호로 취소할 리스트 호출
	public int UpdateReserveStatus(ReserveVO vo);//미입금 결제 예약상태(취소)로 변경
	public int UpdateGuestPoint(ReserveVO vo);//미입금 결제 리스트조회
	public int InsertPointTable(ReserveVO vo);//포인트테이블 삽입
	public int UpdateCouponStatus(ReserveVO vo);//쿠폰상태 업데이트
}
