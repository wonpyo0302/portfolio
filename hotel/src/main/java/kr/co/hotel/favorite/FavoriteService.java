package kr.co.hotel.favorite;

import java.util.Map;

public interface FavoriteService {
	//목록
	Map index(FavoriteVO vo);
	//등록
	int insert(FavoriteVO vo);
	//삭제
	int delete(FavoriteVO vo);
}
