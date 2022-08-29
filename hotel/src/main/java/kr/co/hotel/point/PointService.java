package kr.co.hotel.point;

import java.util.Map;

import kr.co.hotel.reserve.ReserveVO;

public interface PointService {
	//목록
	Map index(PointVO vo);
	
	
	//totalpoint 가져오기
	int total (int guest_no);
	
	
	
}