package js.bs.admin.datavisualization.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import js.bs.admin.datavisualization.service.AdmindataVisService;
import js.bs.common.base.BaseController;
import js.bs.member.vo.MemberVO;

@Controller("AdmindataVisController")
@RequestMapping(value = "/admin/datavis")
public class AdmindataVisControllerImpl extends BaseController implements AdmindataVisController {

	@Autowired
	private AdmindataVisService admindataVisService;
	@Autowired
	private MemberVO memberVO;

	@Override
	@RequestMapping(value = "/dataVisualization.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView adminDataVisMain(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		Map dataMap = (Map)admindataVisService.selectAgeList();
		mav.addObject("dataMap", dataMap);

		return mav;
	}

	@RequestMapping(value = "/sales.csv", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView adminDataVisMaincsv(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = "/admin/datavis/dataVisualization";
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("salesperson", "salesperson");

		return mav;
	}
}
