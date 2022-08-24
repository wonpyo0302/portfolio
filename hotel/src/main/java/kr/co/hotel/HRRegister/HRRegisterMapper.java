package kr.co.hotel.HRRegister;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.host.HostVO;
import kr.co.hotel.main.HotelVO;
import kr.co.hotel.room.RoomVO;


@Mapper  
public interface HRRegisterMapper {
	
	public int insert(RoomVO vo);
	
	public int count(RoomVO vo);
	
	public List<RoomVO> list(RoomVO vo);
	
	public RoomVO view(int room_no);

	public int update (RoomVO vo);
	
	public int H_update (HotelVO vo);
	
	public int delete (int room_no);
	
	public int H_delete (int hotel_no);
	
	public int delete_img(ImageVO ivo);

	public int H_delete_img(ImageVO ivo);
		
	public int img_insert(ImageVO ivo);
	
	public HotelVO get_hotelInfo(int host_no);
	
	public HotelVO get_hotelview(int hotel_no);
	
	public RoomVO get_roomInfo(); //객실 정보 등록(insert)후 생성된 room_no를 축출
	
	public List<ImageVO> get_imgList(ImageVO ivo);//이미지를 리스트로 불러옴
	
	
	//호텔 등록
	public int hotel_insert (HotelVO hvo);
	
	//지역 코드 가져오기
	public List<HotelVO> get_district_code (HotelVO hvo); 
	
	//호텔/객실 신청하기 toAdmin
	public boolean room_toAdmin(RoomVO vo);
	
	public boolean hotel_toAdmin(HotelVO hvo);
	
	//호텔 등록시 HOST테이블에 host_no 업데이트
	public int update_host_no(HostVO vo);
	//host페이지에 hotel_no 업데이트 후, 세션 계정 업데이트
	public HostVO get_hostInfo(HostVO vo);
	
	
}
