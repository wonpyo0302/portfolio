package kr.co.hotel.reivew;

import java.util.Map;

public interface ReviewService {
	//목록
	Map index(ReviewVO vo);
	//등록
	int insert(ReviewVO vo);
	//삭제
	int delete(ReviewVO vo);
}
