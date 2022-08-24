package kr.co.hotel.guest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hotel.admin.AdminVO;
import util.SendMail;
@Service
public class GuestServiceImpl implements GuestService {

	@Autowired
	GuestMapper gmapper;

	@Override
	public int insert(GuestVO gvo) {
		return gmapper.insert(gvo);
	}

	@Override
	public int emailDupCheck(String guest_email) {
		return gmapper.emailDupCheck(guest_email);
	}

	@Override
	public int idDupCheck(String guest_id) {
		return gmapper.idDupCheck(guest_id);
	}
	@Override
	public int hpDupCheck(String guest_hp) {
		return gmapper.hpDupCheck(guest_hp);
	}
	@Override
	public boolean guestloginCheck(GuestVO gvo, HttpSession sess) {
		boolean r = false;
		GuestVO loginInfo = gmapper.guestloginCheck(gvo);
		if (loginInfo != null) {
			r = true;
			// 로그인 성공시 세션에 저장
			sess.setAttribute("loginInfo", loginInfo);
		}
		return r;
	}

	@Override
	public GuestVO findGuestId(GuestVO gvo) {
		return gmapper.findGuestId(gvo);
	}
	@Override
	public GuestVO findGuestPwd(GuestVO gvo) {
		// update
		GuestVO mv = gmapper.findGuestPwd(gvo);
		if (mv != null) {
			// 임시비밀번호 생성
			// 영문두자리, 숫자두자리
			String temp = "";
			for (int i=0; i<2; i++) {
				temp += (char)(Math.random()*26+65);
			}
			for (int i=0; i<3; i++) {
				temp += (int)(Math.random()*9);
			}
			
			// 임시비밀번호 update
			gvo.setGuest_pwd(temp);
			gmapper.updateTempGuestPwd(gvo);
			
			// email발송
			SendMail.sendMail("gdbebe@naver.com", gvo.getGuest_email(), "[둘이놀까]Guest임시비밀번호", "임시비밀번호:"+temp);
			
			return mv;
		} else {
			return null;
		}
	}
	@Override
	public GuestVO myinfoLogin(GuestVO gvo) {
		return gmapper.myinfoLogin(gvo);
		
	}

	@Override
	public int updatePwd(GuestVO gvo) {
		return gmapper.updatePwd(gvo);
	}
	@Override
	public boolean totalUpdate(GuestVO gvo) {
		return gmapper.totalUpdate(gvo) >0 ?  true : false;
	}
	
	@Override
	public GuestVO deleteGuestInfo(GuestVO gvo) {
		// update
				GuestVO mv = gmapper.deleteGuestInfo(gvo);
				if (mv != null) {
					// 임시비밀번호 생성
					// 영문두자리, 숫자두자리
					String temp = "";
					for (int i=0; i<2; i++) {
						temp += (char)(Math.random()*26+65);
					}
					for (int i=0; i<3; i++) {
						temp += (int)(Math.random()*9);
					}
					
					// 임시비밀번호 update
					gvo.setGuest_pwd(temp);
					gmapper.fakeDelete(gvo);
					
					return mv;
				} else {
					return null;
				}
			}

	//=========admin guestlist 추가===================
	
	@Override
	public Map guestListPaging(AdminVO vo) {
		int totalCount = gmapper.count(vo); //총 게시물수
		int totalPage = totalCount / vo.getPageRow(); //총 페이지수
		
		if (totalCount % vo.getPageRow() > 0 ) totalPage++;
		
		/*
		 * 총 게시물 수 12개 총 페이지는 12 / 한 페이지에 표시되는 행(게시물개수) 수 10개 1페이지(10행), 2행 12 % 10 > 0
		 */
		
		// 페이지별 시작 인덱스 mySQL 에서는 시작이 0부터니까 
		int startIdx = (vo.getPage() - 1 ) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<GuestVO> list = gmapper.listPaging(vo);
		
		// 페이징처리
		int endPage = (int)(Math.ceil(vo.getPage()/10.0) * 10);
		int startPage = endPage - 9;
		
		if (endPage > totalPage) endPage = totalPage;
		
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true : false;
		
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startIdx", startIdx);
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}

	@Override
	public GuestVO guestlist(GuestVO vo) {
		return gmapper.guestlist(vo);
	}

}