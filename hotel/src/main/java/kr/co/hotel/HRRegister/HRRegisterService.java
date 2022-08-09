package kr.co.hotel.HRRegister;

import java.util.List;
import java.util.Map;

public interface HRRegisterService {
	//목록
	Map index (RoomVO vo);
	
	//상세
	RoomVO view(int no);
	
	//수정폼 > 수정될 내용을 가져와야함, 
	RoomVO edit(int no);
	
	//수정 처리 > 
	boolean update(RoomVO vo);
	
	//삭제 처리
	boolean delete(int room_no);
	
	//등록 처리
	boolean insert(RoomVO vo);
	
	//이미지 등록
	boolean img_insert(RoomVO vo);
	
	RoomVO get_hotelInfo(int host_no);
	
	RoomVO get_roomInfo();
	
	List<RoomVO> get_imgList(int room_no);
	
}
