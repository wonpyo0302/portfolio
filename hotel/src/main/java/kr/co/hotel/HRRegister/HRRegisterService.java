package kr.co.hotel.HRRegister;

import java.util.List;
import java.util.Map;

import kr.co.hotel.main.HotelVO;

public interface HRRegisterService {
	//목록
	Map index (RoomVO vo);
	
	//상세
	RoomVO view(int no);
	
	//수정폼 > 수정될 내용을 가져와야함, 
	RoomVO edit(int no);
	
	//객실 수정 처리 > 
	boolean update(RoomVO vo);
	
	//호텔 수정 처리
	boolean H_update (HotelVO vo);
	
	//객실등록정보 삭제 처리
	boolean delete(int room_no);
	
	//호텔등록정보 삭제 처리
	boolean H_delete(int room_no);
	
	//등록 처리
	boolean insert(RoomVO vo);
	
	//이미지 등록
	boolean img_insert(ImageVO ivo);
	
	//1개의 호텔 인스턴스 가져오기
	HotelVO get_hotelInfo(int host_no);
	
	HotelVO get_hotelview(int hotel_no);
	
	//가장 최근 저장된 1개의 객실 인스턴스 가져오기 
	RoomVO get_roomInfo();
	
	//해당 객실의 이미지 리스트 가져오기
	List<ImageVO> get_imgList(ImageVO ivo);
	
	boolean hotel_insert (HotelVO hvo);
	
	List<HotelVO> get_district_code (HotelVO hvo); 
	
	//호텔, 객실 신청 toAdmin
	boolean toAdmin(RoomVO vo, HotelVO hvo);
}
