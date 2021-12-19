package js.bs.admin.datavisualization.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AdmindataVisController {

	public ModelAndView adminDataVisMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
