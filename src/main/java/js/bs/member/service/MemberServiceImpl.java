package js.bs.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import js.bs.member.dao.MemberDAO;
import js.bs.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public MemberVO login(Map loginMap) throws Exception {
		return memberDAO.login(loginMap);
	}

	@Override
	public void addMember(MemberVO memberVO) throws Exception {
		if (memberVO.getKakao_id() == null || memberVO.getKakao_id().trim().equals("")) {
			memberVO.setKakao_id("N");
		}
		if (memberVO.getAge_range() == null || memberVO.getAge_range().trim().equals("")) {
			memberVO.setAge_range("N");
		}

		memberDAO.insertNewMember(memberVO);
	}

	@Override
	public String overlapped(String id) throws Exception {
		return memberDAO.selectOverlappedID(id);
	}

	@Override
	public String kakaoOverlap(String id) throws Exception {
		return memberDAO.kakaoOverlap(id);
	}

	@Override
	public MemberVO kakaologin(String kakao_id) throws Exception {
		return memberDAO.kakaologin(kakao_id);
	}
}
