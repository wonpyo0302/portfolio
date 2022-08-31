package kr.co.hotel.reserve;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.host.HostVO;
import kr.co.hotel.main.HotelVO;
import kr.co.hotel.room.RoomVO;

@Service
public class ReserveServiceImp implements ReserveService {

	@Autowired
	ReserveMapper mapper;
	
	//예약테이블에 저장하기
	@Override
	public synchronized int insert(ReserveVO vo,GuestVO gvo) {
		int data = mapper.reservecheck(vo);
		if(data !=0) {
			return data;
		}else {
			mapper.insert(vo);
			mapper.guestUsedPointUpdate(gvo);
			if(vo.getUsed_point() !=0) {
				mapper.pointinsert(vo);
			}
			mapper.updateCoupon(vo);
			return data;
		}
	}

	//중복 체크
	@Override
	public int reservecheck(ReserveVO vo) {
		return mapper.reservecheck(vo);
	}
	
	
	//--이하 마이페이지 예약내역리스트_빛찬--------------------
	@Override
	public Map index(ReserveVO vo) {
		
		int totalCount = mapper.count(vo);//총개시물 수
		//총 페이지 수
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		
		//시작 인덱스
		int startIdx = (vo.getPage()-1)*vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<ReserveVO> list = mapper.list(vo);
		
		//페이징 처리
		int endPage = (int)(Math.ceil(vo.getPage()/10.0)*10);
		int startPage = endPage - 9;
		if(endPage > totalPage) endPage= totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true : false;
		
		Map map= new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("list", list);
		map.put("page", vo.getPage());
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
		return map;
	}

	//보유한 쿠폰 리스트 내역
	@Override
	public List<GuestVO> couponlist(GuestVO vo) {
		return mapper.couponlist(vo);
	}

	//쿠폰 기한 만료 삭제
	@Override
	public int CouponDelete() {
		return mapper.CounponDelete();
	}


	//호스트 정보 가져오기
	@Override
	public HostVO SelectHostNo(HotelVO vo) {
		vo.setHost_no(mapper.SelectHostNo(vo).getHost_no());
		return mapper.SelectHostAccount(vo);
	}
	
	//호텔정보 가져오기
	@Override
	public HotelVO SelectHotelInfo(HotelVO vo) {
		return mapper.SelectHostNo(vo);
	}

	//룸정보 가져오기
	@Override
	public RoomVO SelectRoomInfo(ReserveVO vo) {
		return mapper.SelectRoominfo(vo);
	}

	//예약정보 가져오기
	@Override
	public ReserveVO SelectReserveInfo(ReserveVO vo) {
		return mapper.SelectReserveInfo(vo);
	}

	//입금확인시 예약 상태 업데이트
	@Override
	public ReserveVO UpdatePay_Status(ReserveVO vo) {
		return mapper.UpdatePay_Status(vo);
	}


	
	//스케줄러로 자동취소메소드 구현
	
	//미입금 리스트 가져오기
	@Override
	public List<ReserveVO> CancleList() {
		return mapper.CancleList();
	}

	//예약상태를 취소로 업데이트
	@Override
	public int UpdateReserveStatus(ReserveVO vo) {
		return mapper.cancelReserve(vo);
	}

	//게스트계정의 사용한 포인트 돌려주기
	@Override
	public int UpdateGuestPoint(ReserveVO vo) {
		return mapper.UpdateGuestPoint(vo);
	}

	//포인트 테이블에 이력 남기기
	@Override
	public int InsertPointTable(ReserveVO vo) {
		return mapper.InsertPointTable(vo);
	}

	//쿠폰 상태 업데이트
	@Override
	public int UpdateCouponStatus(ReserveVO vo) {
		return mapper.UpdateCouponStatus(vo);
	}

	//totalpoint 가져오기
	@Override
	public int SelectTotalPoint(ReserveVO vo) {
		return mapper.SelectTotalPoint(vo);
	}

	//룸 가격 가져오기
	@Override
	public int SelectRoomPrice(ReserveVO vo) {
		return mapper.SelectRoomPrice(vo);
	}

}
