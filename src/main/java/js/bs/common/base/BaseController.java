package js.bs.common.base;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import js.bs.goods.vo.ImageFileVO;

public abstract class BaseController {

	private static final String CURR_IMAGE_REPO_PATH = "C:\\shopping\\file_repo";
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";

	protected List<ImageFileVO> upload(MultipartHttpServletRequest multipartRequest) throws IOException {

		List<ImageFileVO> fileList = new ArrayList<ImageFileVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {
			ImageFileVO imageFileVO = new ImageFileVO();
			String fileName = fileNames.next();
			imageFileVO.setFileType(fileName); // fileName
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			imageFileVO.setFileName(originalFileName); // OriginalFileName
			fileList.add(imageFileVO);

			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);

			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					if (file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + originalFileName));
			}
		}

		return fileList;
	}

	private void deleteFile(String fileName) {
		File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
		try {
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/*.do", method = {RequestMethod.POST, RequestMethod.GET})
	protected ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		return mav;
	}

	@RequestMapping("/download.img.do")
	protected void download(
		@RequestParam("imageFileName") String imageFileName,
		@RequestParam("articleNO") String articleNO,
		HttpServletResponse response
	) throws Exception {

		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO + "\\" + articleNO + "\\" + imageFileName;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];

		while (true) {
			int count = in.read(buffer);
			if (count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

	protected String calcSearchPeriod(String fixedSearchPeriod) {

		String beginDate = null;
		String endDate = null;
		String endYear = null;
		String endMonth = null;
		String endDay = null;
		String beginYear = null;
		String beginMonth = null;
		String beginDay = null;
		DecimalFormat df = new DecimalFormat("00");
		Calendar cal = Calendar.getInstance();

		endYear = Integer.toString(cal.get(Calendar.YEAR));
		endMonth = df.format(cal.get(Calendar.MONTH) + 1);
		endDay = df.format(cal.get(Calendar.DATE));
		endDate = endYear + "-" + endMonth + "-" + endDay;

		if (fixedSearchPeriod == null) {
			cal.add(cal.MONTH, -4);
		} else if (fixedSearchPeriod.equals("one_week")) {
			cal.add(Calendar.DAY_OF_YEAR, -7);
		} else if (fixedSearchPeriod.equals("two_week")) {
			cal.add(Calendar.DAY_OF_YEAR, -14);
		} else if (fixedSearchPeriod.equals("one_month")) {
			cal.add(cal.MONTH, -1);
		} else if (fixedSearchPeriod.equals("two_month")) {
			cal.add(cal.MONTH, -2);
		} else if (fixedSearchPeriod.equals("three_month")) {
			cal.add(cal.MONTH, -3);
		} else if (fixedSearchPeriod.equals("four_month")) {
			cal.add(cal.MONTH, -4);
		}

		beginYear = Integer.toString(cal.get(Calendar.YEAR));
		beginMonth = df.format(cal.get(Calendar.MONTH) + 1);
		beginDay = df.format(cal.get(Calendar.DATE));
		beginDate = beginYear + "-" + beginMonth + "-" + beginDay;

		return beginDate + "," + endDate;
	}
}
