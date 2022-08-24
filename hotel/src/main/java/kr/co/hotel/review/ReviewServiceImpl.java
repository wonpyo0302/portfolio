package kr.co.hotel.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hotel.HRRegister.ImageVO;
import kr.co.hotel.reserve.ReserveVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired 
	ReviewMapper mapper;

	
	@Override
	public ReserveVO get_reserve(ReviewVO vo) {
		return mapper.get_reserve(vo);
	}


	@Override
	public boolean insert(ReviewVO vo) {
		boolean r = false;
		if(mapper.insert(vo)>0 ? true:false) {
			if(mapper.update_review_status(vo)>0) {
				r = true;
			}
		}
		return r ;
	}

	//이원표작성
	//호텔 객실 전체 평점 업데이트
	@Override
	public boolean avgScroe(int room_no, int hotel_no) {
		boolean r= false;
		if(mapper.roomUpdate(room_no)&&mapper.hotelUpdate(hotel_no)) {
			r=true;
		}
		return r;
	}


	@Override
	public boolean reviewTotalCount(int room_no, int hotel_no) {
		boolean r = false;
		if(mapper.hotelReviewCount(hotel_no)&&mapper.roomReviewCount(room_no)) {
			r=true;
		}
		return r;
	}
//---------------------------------------------------------------------	


	@Override
	public Map index(ReviewVO vo) {
		int totalCount = mapper.count(vo);//총개시물 수
		//총 페이지 수
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		
		//시작 인덱스
		int startIdx = (vo.getPage()-1)*vo.getPageRow();
		vo.setStartIdx(startIdx);
		
		List<ReviewVO> list = mapper.list(vo);
		//FavoriteVO 안에 ImageVO가 있음, 
		
		
		for(int i=0; i<list.size(); i++) {
			//해당 호텔의 이미지 리스트를 가져옴
			ImageVO img = mapper.get_review_img(list.get(i).getReview_no());
			list.get(i).setImg(img);
			//해당 호텔의 총 리뷰 개수를 가져옴
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
	public boolean delete(int review_no) {
		
		return mapper.delete(review_no);
	}


	@Override
	public boolean review_update(ReviewVO vo) {
		
		return mapper.review_update(vo);
	}
	
	@Override
	public Map host_index(ReviewVO vo) {
		int totalCount = mapper.host_review_count(vo);//총개시물 수
		//총 페이지 수
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		
		//시작 인덱스
		int startIdx = (vo.getPage()-1)*vo.getPageRow();
		vo.setStartIdx(startIdx);
		
		List<ReviewVO> list = mapper.host_review_list(vo);
		//FavoriteVO 안에 ImageVO가 있음, 
		
		
		for(int i=0; i<list.size(); i++) {
			//해당 호텔의 이미지 리스트를 가져옴
			ImageVO img = mapper.get_review_img(list.get(i).getReview_no());
			list.get(i).setImg(img);
			//해당 호텔의 총 리뷰 개수를 가져옴
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

	

}
