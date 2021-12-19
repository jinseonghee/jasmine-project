package js.bs.member.service;

import java.util.Map;

import js.bs.member.vo.MemberVO;

public interface MemberService {

	public MemberVO login(Map loginMap) throws Exception;

	public MemberVO kakaologin(String kakao_id) throws Exception;

	public void addMember(MemberVO memberVO) throws Exception;

	public String overlapped(String id) throws Exception;

	public String kakaoOverlap(String id) throws Exception;
}
