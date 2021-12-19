package js.bs.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import js.bs.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO login(Map loginMap) throws DataAccessException {
		MemberVO member = (MemberVO)sqlSession.selectOne("mapper.member.login", loginMap);

		return member;
	}

	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException {
		sqlSession.insert("mapper.member.insertNewMember", memberVO);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.selectOverlappedID", id);

		return result;
	}

	@Override
	public String kakaoOverlap(String id) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.kakaoOverlap", id);

		return result;
	}

	@Override
	public MemberVO kakaologin(String kakao_id) throws DataAccessException {
		MemberVO memberVO = sqlSession.selectOne("mapper.member.kakaoLogin", kakao_id);

		return memberVO;
	}
}
