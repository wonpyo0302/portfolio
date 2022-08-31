package kr.co.hotel.reserve;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.host.HostVO;
import kr.co.hotel.main.HotelVO;
import kr.co.hotel.room.RoomVO;

@Mapper
public interface ReserveMapper {
	
//예약 메소드 순선
	//1. 예약 중복 확인
	public int reservecheck(ReserveVO vo);

	//2. 예약 테이블 삽입
	public int insert(ReserveVO vo);

	//3. 사용포인트 업데이트
	public void guestUsedPointUpdate(GuestVO vo);

	//4. 포인트 테이블 내역 삽입
	public void pointinsert(ReserveVO vo);

	//5. 쿠폰 상태 업데이트
	public void updateCoupon(ReserveVO vo);
	
//보유 쿠폰 리스트 가져오기	
	public List<GuestVO> couponlist(GuestVO vo);
	
//유효기간 만료 쿠폰 삭제
	public int CounponDelete();

//무통장 입금 취소 순서
	//1. 미입금 리스트 가져오기
	public List<ReserveVO> CancleList();
	
	//2. 예약 테이블 상태 업데이트
	public int cancelReserve(ReserveVO vo);
	
	//3. 사용한 포인트 반환해주기
	public int UpdateGuestPoint(ReserveVO vo);
	
	//4. 포인트 테이블에 이력 삽임
	public int InsertPointTable(ReserveVO vo);
	
	//5. 쿠폰 상태 업데이트
	public int UpdateCouponStatus(ReserveVO vo);
	
	
	
//룸, 호텔 정보 가져오기
	//호텔정보 가져오기
	public HotelVO SelectHostNo(HotelVO vo);

	//호스트 계좌정보 가져오기
	public HostVO SelectHostAccount(HotelVO vo);
	
	//룸정보 가져오기
	public RoomVO SelectRoominfo(ReserveVO vo);
	
	//해당하는 게스트의 totalpoint 가져오기	
	public int SelectTotalPoint(ReserveVO vo);
	
	//룸 가격 가져오기
	public int SelectRoomPrice(ReserveVO vo);
	
	//
	
//이하 마이페이지 예약리스트_빛찬 
	public int count(ReserveVO vo);
	public List<ReserveVO> list (ReserveVO vo);
		
//예약 정보 가져오기
	public ReserveVO SelectReserveInfo(ReserveVO vo);
	
//입금상태 확인시 예약 테이블 상태 업데이트
	public ReserveVO UpdatePay_Status(ReserveVO vo);
	
}
