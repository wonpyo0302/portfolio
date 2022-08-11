package kr.co.hotel.guestfaq;

import java.util.List;
import java.util.Map;

public interface GuestFaqService {
	public Map index(GuestFaqVO vo); // 목록보기
	public GuestFaqVO view(GuestFaqVO vo); // 상세보기
	public boolean insert(GuestFaqVO vo); // 등록하기
}
