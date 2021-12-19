package js.bs.admin.datavisualization.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface AdmindataVisDAO {

	public Map selectAgeList() throws DataAccessException;
}
