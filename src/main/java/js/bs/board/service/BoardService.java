package js.bs.board.service;

import java.util.List;
import java.util.Map;

import js.bs.board.vo.ArticleVO;

public interface BoardService {

	public List<ArticleVO> listArticles() throws Exception;

	public int addNewArticle(Map articleMap) throws Exception;

	public ArticleVO viewArticle(int articleNO) throws Exception;

	public void modArticle(Map articleMap) throws Exception;

	public void removeArticle(int articleNO) throws Exception;

	public int addReply(Map articleMap) throws Exception;

	public Map listArticles(Map<String, Integer> pagingMap) throws Exception;
}
