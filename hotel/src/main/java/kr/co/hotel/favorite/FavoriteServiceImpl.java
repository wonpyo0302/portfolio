package kr.co.hotel.favorite;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hotel.HRRegister.ImageVO;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	@Autowired 
	FavoriteMapper mapper;
	
	@Override
	public Map index(FavoriteVO vo) {
		int totalCount = mapper.count(vo);//총개시물 수
		//총 페이지 수
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		
		//시작 인덱스
		int startIdx = (vo.getPage()-1)*vo.getPageRow();
		vo.setStartIdx(startIdx);
		
		List<FavoriteVO> list = mapper.list(vo);
		//FavoriteVO 안에 List<ImageVO>가 있음, 
		
		
		for(int i=0; i<list.size(); i++) {
			//해당 호텔의 이미지 리스트를 가져옴
			List<ImageVO> imgList = mapper.get_hotel_img(list.get(i).getHotel_no());
			list.get(i).setImageList(imgList);
			//해당 호텔의 총 리뷰 개수를 가져옴
			int totalRevCnt = mapper.get_Review_Count(list.get(i).getHotel_no());
			System.out.println("리뷰카운트 : "+ totalRevCnt);
			list.get(i).setTotalReview(totalRevCnt);
		}
		 
		
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

	@Override
	public int insert(FavoriteVO vo) {
		
		return mapper.insert(vo);
	}

	@Override
	public int delete(FavoriteVO vo) {
		// TODO Auto-generated method stub
		return mapper.delete(vo);
	}

}
