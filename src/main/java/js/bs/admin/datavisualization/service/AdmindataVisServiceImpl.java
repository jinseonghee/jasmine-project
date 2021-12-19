package js.bs.admin.datavisualization.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import js.bs.admin.datavisualization.dao.AdmindataVisDAO;

@Service("admindataVisService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdmindataVisServiceImpl implements AdmindataVisService {

	@Autowired
	private AdmindataVisDAO admindataVisDAO;

	@Override
	public Map selectAgeList() throws Exception {

		Map dataMap = admindataVisDAO.selectAgeList();

		return dataMap;
	}
}
