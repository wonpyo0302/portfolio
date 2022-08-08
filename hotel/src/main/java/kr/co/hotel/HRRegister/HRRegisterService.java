package kr.co.hotel.HRRegister;

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
	boolean delete(int no);
	
	//등록 처리
	boolean insert(RoomVO vo);
	
	//이미지 등록
	boolean img_insert(RoomVO vo);
	
	RoomVO get_hotelInfo(int host_no);
	
}
