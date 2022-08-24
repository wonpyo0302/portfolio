package kr.co.hotel.hostfaq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hotel.guestfaq.GuestFaqVO;

@Service
public class HostFaqServiceImpl implements HostFaqService {

	@Autowired
	HostFaqMapper mapper;

	//목록
	@Override
	public List<HostFaqVO> list(HostFaqVO vo) {
		return mapper.list(vo);
	}
	
	//상세보기
	@Override
	public HostFaqVO view(int hfaq_no) {
		return mapper.view(hfaq_no);
	}

	@Override
	public boolean insert(HostFaqVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}

	@Override
	public HostFaqVO edit(int hfaq_no) {
		return mapper.view(hfaq_no);
	}

	@Override
	public boolean update(HostFaqVO vo) {
		return mapper.update(vo) > 0 ? true : false;
	}

	@Override
	public boolean delete(int hfaq_no) {
		return mapper.delete(hfaq_no) > 0 ? true : false;
	}

	
}
