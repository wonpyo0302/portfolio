package kr.co.hotel.guestfaq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GuestFaqServiceImpl implements GuestFaqService {

	@Autowired
	GuestFaqMapper mapper;

	//목록
	@Override
	public Map index(GuestFaqVO vo) {
		return mapper.list(vo);
	}
	
	//상세보기
	@Override
	public GuestFaqVO view(int gfaq_no) {
		return mapper.view(gfaq_no);
	}

	@Override
	public boolean insert(GuestFaqVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}

	
}
