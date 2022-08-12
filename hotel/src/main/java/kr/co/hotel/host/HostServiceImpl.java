package kr.co.hotel.host;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.hotel.host.HostVO;
import util.SendMail;
@Service
public class HostServiceImpl implements HostService {

	@Autowired
	HostMapper hmapper;

	@Override
	public int insert(HostVO hvo) {
		return hmapper.insert(hvo);
	}

	@Override
	public int emailDupCheck(String host_email) {
		return hmapper.emailDupCheck(host_email);
	}

	@Override
	public int idDupCheck(String host_id) {
		return hmapper.idDupCheck(host_id);
	}
	@Override
	public int hpDupCheck(String host_hp) {
		return hmapper.hpDupCheck(host_hp);
	}
	@Override
	public boolean HostloginCheck(HostVO hvo, HttpSession sess) {
		boolean r = false;
		HostVO loginInfo = hmapper.hostloginCheck(hvo);
		if (loginInfo != null) {
			r = true;
			// 로그인 성공시 세션에 저장
			sess.setAttribute("loginInfo2", loginInfo);
		}
		return r;
	}

	@Override
	public HostVO findHostEmail(HostVO hvo) {
		return hmapper.findHostEmail(hvo);
	}
	@Override
	public HostVO findHostPwd(HostVO hvo) {
		// update
		HostVO mv = hmapper.findHostPwd(hvo);
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
			hvo.setHost_pwd(temp);
			hmapper.updateTempHostPwd(hvo);
			
			// email발송
			SendMail.sendMail("gdbebe@naver.com", hvo.getHost_email(), "[둘이놀까]임시비밀번호", "임시비밀번호:"+temp);
			
			return mv;
		} else {
			return null;
		}
	}
	@Override
	public HostVO myinfoLogin(HostVO hvo) {
		return hmapper.myinfoLogin(hvo);
	}

}