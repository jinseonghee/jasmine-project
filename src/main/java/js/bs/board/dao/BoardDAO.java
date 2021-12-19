package js.bs.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import js.bs.board.vo.ArticleVO;

public interface BoardDAO {

	public List selectAllArticlesList() throws DataAccessException;

	public int insertNewArticle(Map articleMap) throws DataAccessException;

	public int insertReply(Map articleMap) throws DataAccessException;

	public ArticleVO selectArticle(int articleNO) throws DataAccessException;

	public void updateArticle(Map articleMap) throws DataAccessException;

	public void deleteArticle(int articleNO) throws DataAccessException;

	public List selectImageFileList(int articleNO) throws DataAccessException;

	public List selectAllArticles(Map pagingMap) throws DataAccessException;
}
