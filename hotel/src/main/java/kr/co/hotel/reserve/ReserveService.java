package kr.co.hotel.reserve;

import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.READER;

import org.springframework.stereotype.Service;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.host.HostVO;
import kr.co.hotel.main.HotelVO;
import kr.co.hotel.room.RoomVO;

@Service
public interface ReserveService {

	
	//예약정보 입력
	public int insert(ReserveVO vo,GuestVO gvo);
	
	//예약 중복 확인
	public int reservecheck(ReserveVO vo);
	
	//보유 쿠폰 리스트 가져오기
	public List<GuestVO> couponlist(GuestVO vo);
	
	//만료 쿠폰 삭제
	public int CouponDelete();
	
	//호스트 정보 가져오기
	public HostVO SelectHostNo(HotelVO vo);
	
	//호텔 정보 가져오기
	public HotelVO SelectHotelInfo(HotelVO vo);
	
	//룸 정보 가져오기
	public RoomVO SelectRoomInfo(ReserveVO vo);
	
	//게스트 totalpoint 가져오기
	public int SelectTotalPoint(ReserveVO vo);
	
	//룸 가격 가져오기
	public int SelectRoomPrice(ReserveVO vo);
	
	//예약테이블에서 해당하는 정보 조회
	public ReserveVO SelectReserveInfo(ReserveVO vo);
	
	//결제 금액 입금 확인시 상태 업데이트
	public ReserveVO UpdatePay_Status(ReserveVO vo);
	
		
	//스케줄러로 자동취소메소드 구현
	public List<ReserveVO> CancleList();//미입금 결제 리스트조회
	public int UpdateReserveStatus(ReserveVO vo);//미입금 결제 예약상태(취소)로 변경
	public int UpdateGuestPoint(ReserveVO vo);//미입금 결제 리스트조회
	public int InsertPointTable(ReserveVO vo);//포인트테이블 삽입
	public int UpdateCouponStatus(ReserveVO vo);//쿠폰상태 업데이트
	
	//--이하 마이페이지 예약내역리스트_빛찬--------------------
	public Map index(ReserveVO vo);
	
}
