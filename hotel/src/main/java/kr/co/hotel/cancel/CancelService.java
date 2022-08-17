package kr.co.hotel.cancel;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.reserve.ReserveVO;

@Service
public interface CancelService {
	public List<LinkedHashMap> list(GuestVO vo);
	public String cancel(ReserveVO vo, GuestVO gvo) throws IOException;

	
}
