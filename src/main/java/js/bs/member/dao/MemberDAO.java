package js.bs.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import js.bs.member.vo.MemberVO;

public interface MemberDAO {

	public MemberVO login(Map loginMap) throws DataAccessException;

	public MemberVO kakaologin(String kakao_id) throws DataAccessException;

	public void insertNewMember(MemberVO memberVO) throws DataAccessException;

	public String selectOverlappedID(String id) throws DataAccessException;

	public String kakaoOverlap(String id) throws DataAccessException;
}
