package kr.co.hotel.guest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GuestServiceImpl implements GuestService {

	@Autowired
	GuestMapper mapper;

	


	@Override
	public GuestVO loginCheck(GuestVO vo) {
		return mapper.loginCheck(vo);
	}

	
}
