package js.bs.goods.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import js.bs.goods.vo.GoodsVO;
import js.bs.goods.vo.ImageFileVO;

@Repository("goodsDAO")
public class GoodsDAOImpl implements GoodsDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsVO> selectGoodsList(String goodsStatus) throws DataAccessException {
		List<GoodsVO> goodsList = (ArrayList)sqlSession.selectList("mapper.goods.selectGoodsList", goodsStatus);

		return goodsList;
	}

	@Override
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException {
		List<String> list = (ArrayList)sqlSession.selectList("mapper.goods.selectKeywordSearch", keyword);

		return list;
	}

	@Override
	public ArrayList selectGoodsBySearchWord(String searchWord) throws DataAccessException {
		ArrayList list = (ArrayList)sqlSession.selectList("mapper.goods.selectGoodsBySearchWord", searchWord);

		return list;
	}

	@Override
	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException {
		GoodsVO goodsVO = (GoodsVO)sqlSession.selectOne("mapper.goods.selectGoodsDetail", goods_id);

		return goodsVO;
	}

	@Override
	public List<ImageFileVO> selectGoodsDetailImage(String goods_id) throws DataAccessException {
		List<ImageFileVO> imageList = (ArrayList)sqlSession.selectList("mapper.goods.selectGoodsDetailImage", goods_id);

		return imageList;
	}

	@Override
	public List selectGoodsByCategory(String keyWord) throws DataAccessException {
		ArrayList list = null;
		list = (ArrayList)sqlSession.selectList("mapper.goods.selectGoodsByCategory", keyWord);

		return list;
	}
}
