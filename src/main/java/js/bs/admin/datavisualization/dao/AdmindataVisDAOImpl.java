package js.bs.admin.datavisualization.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("admindataVisDAO")
public class AdmindataVisDAOImpl implements AdmindataVisDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public Map selectAgeList() throws DataAccessException {

		String dataflag = null;
		String testflag = "3";
		Map dataMap = new HashMap();
		dataflag = String.valueOf(sqlSession.selectList("mapper.admin.datavis.selectDataVisListtwenty"));
		dataMap.put("20대", dataflag);

		dataflag = String.valueOf(sqlSession.selectList("mapper.admin.datavis.selectDataVisListthirty"));
		dataMap.put("30대", dataflag);

		dataflag = String.valueOf(sqlSession.selectList("mapper.admin.datavis.selectDataVisListforty"));
		dataMap.put("40대", dataflag);

		dataflag = String.valueOf(sqlSession.selectList("mapper.admin.datavis.selectDataVisListfifty"));
		dataMap.put("50대", dataflag);

		return dataMap;
	}
}
