package kr.co.hotel.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.guestboard.GuestBoardVO;
import kr.co.hotel.host.HostVO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminMapper amapper;
	@Override
	public boolean adminLogin(AdminVO avo, HttpSession sess) {
		boolean r= false;
		AdminVO loginInfo = amapper.adminLogin(avo);
		if(loginInfo != null) {
			r = true;
			sess.setAttribute("loginInfo_admin", loginInfo);
		}
		return r;
	}
	
	@Override
	public Map guestListPaging(AdminVO vo) {
		int totalCount = amapper.count(vo); //총 게시물수
		int totalPage = totalCount / vo.getPageRow(); //총 페이지수
		
		if (totalCount % vo.getPageRow() > 0 ) totalPage++;
		
		/*
		 * 총 게시물 수 12개 총 페이지는 12 / 한 페이지에 표시되는 행(게시물개수) 수 10개 1페이지(10행), 2행 12 % 10 > 0
		 */
		
		// 페이지별 시작 인덱스 mySQL 에서는 시작이 0부터니까 
		int startIdx = (vo.getPage() - 1 ) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<GuestVO> list = amapper.listPaging(vo);
		
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
	public List<GuestVO> guestList(AdminVO vo) {
		return amapper.list(vo);
	}

	@Override
	public List<AdminVO> salesMonth() {
		return amapper.salesMonth();
	}

	@Override
	public Model memberCount(Model model) {
		model.addAttribute("guestInfo",amapper.guestCount());
		model.addAttribute("hostInfo",amapper.hostCount());
		return model;
	}

	@Override
	public List<HostVO> getHostList() {
		return amapper.getHostList();
	}

}
