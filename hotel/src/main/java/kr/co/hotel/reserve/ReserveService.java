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

	public GuestVO select(GuestVO vo);
	public int insert(ReserveVO vo,GuestVO gvo);
	public int reservecheck(ReserveVO vo);
	public List<GuestVO> couponlist(GuestVO vo);
	public int CouponDelete();
	public int PointDeposit(ReserveVO vo, GuestVO gvo);
	public HostVO SelectHostNo(HotelVO vo);
	public HotelVO SelectHotelInfo(HotelVO vo);
	public RoomVO SelectRoomInfo(ReserveVO vo);
	public ReserveVO SelectReserveInfo(ReserveVO vo);
	public ReserveVO UpdatePay_Status(ReserveVO vo);
	public void DeleteAccountPay();
	public int SelectTotalPoint(ReserveVO vo);
	public int SelectRoomPrice(ReserveVO vo);
	
	
	//스케줄러로 자동취소메소드 구현
	public List<ReserveVO> CancleList();//미입금 결제 리스트조회
	public int UpdateReserveStatus(ReserveVO vo);//미입금 결제 예약상태(취소)로 변경
	public int UpdateGuestPoint(ReserveVO vo);//미입금 결제 리스트조회
	public int InsertPointTable(ReserveVO vo);//포인트테이블 삽입
	public int UpdateCouponStatus(ReserveVO vo);//쿠폰상태 업데이트
	
	
	
	
	//--이하 마이페이지 예약내역리스트_빛찬--------------------
	public Map index(ReserveVO vo);
	
}
