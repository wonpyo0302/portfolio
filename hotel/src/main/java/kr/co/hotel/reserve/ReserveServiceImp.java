package kr.co.hotel.reserve;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hotel.guest.GuestVO;

@Service
public class ReserveServiceImp implements ReserveService {

	@Autowired
	ReserveMapper mapper;
	
	@Override
	public GuestVO select(GuestVO vo) {
		return mapper.select(vo);
	}

	@Override
	public void insert(ReserveVO vo,GuestVO gvo) {
		gvo.setTotalpoint(gvo.getTotalpoint() - vo.getUsed_point());
		mapper.insert(vo);
		mapper.guestUsedPointUpdate(gvo);
		mapper.pointinsert(vo);
	}

	@Override
	public int reservecheck(ReserveVO vo) {
		return mapper.reservecheck(vo);
	}



	

}
