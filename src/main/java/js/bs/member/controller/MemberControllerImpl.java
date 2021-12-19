package js.bs.member.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import js.bs.common.base.BaseController;
import js.bs.common.kakao.KakaoAPI;
import js.bs.member.service.MemberService;
import js.bs.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value = "/member")
public class MemberControllerImpl extends BaseController implements MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberVO memberVO;

	@Autowired
	private KakaoAPI kakao;

	@Override
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
		HttpServletRequest request,
		HttpServletResponse response
	) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String kakao_id = (String)session.getAttribute("kakao_id");

		if (kakao_id != null && loginMap == null) {
			memberVO = memberService.kakaologin(kakao_id);
		} else {
			memberVO = memberService.login(loginMap);
		}

		if (memberVO != null && memberVO.getMember_id() != null) {

			session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo", memberVO);

			String action = (String)session.getAttribute("action");
			if (action != null && action.equals("/order/orderEachGoods.do")) {
				mav.setViewName("forward:" + action);
			} else {
				mav.setViewName("redirect:/main/main.do");
			}
		} else {
			String message = "아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		session.removeAttribute("kakao_id");
		session.removeAttribute("access_Token");
		session.invalidate();
		mav.setViewName("redirect:/main/main.do");

		return mav;
	}

	@Override
	@RequestMapping(value = "/addMember.do", method = RequestMethod.POST)
	public ResponseEntity addMember(
		@ModelAttribute("memberVO") MemberVO _memberVO,
		HttpServletRequest request,
		HttpServletResponse response
	) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String email2 = _memberVO.getEmail2();

		if (email2.contains(",")) {
			int ei = email2.indexOf(",");
			String testemail1 = email2.substring(0, ei);
			String testemail2 = email2.substring(ei);
			if (testemail1 != null || !(testemail1.trim().equals(""))) {
				_memberVO.setEmail2(testemail1);
			} else if (testemail2 != null) {
				_memberVO.setEmail2(testemail2);
			}
		}

		String age_range = _memberVO.getAge_range();

		if (age_range.trim().equals("") || age_range == null) {
			String birth_y = _memberVO.getMember_birth_y();
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int age = (year - Integer.parseInt(birth_y) + 1);

			age = age / 10;
			if (age == 0) {
				_memberVO.setAge_range("0~9");
			} else if (age == 1) {
				_memberVO.setAge_range("10~19");
			} else if (age == 2) {
				_memberVO.setAge_range("20~29");
			} else if (age == 3) {
				_memberVO.setAge_range("30~39");
			} else if (age == 4) {
				_memberVO.setAge_range("40~49");
			} else if (age == 5) {
				_memberVO.setAge_range("50~59");
			} else if (age == 6) {
				_memberVO.setAge_range("60~69");
			} else if (age == 7) {
				_memberVO.setAge_range("70~79");
			} else if (age == 8) {
				_memberVO.setAge_range("80~89");
			} else if (age == 9) {
				_memberVO.setAge_range("90~99");
			}
		}

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			memberService.addMember(_memberVO);
			message = "<script>";
			message += " alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
			message += " location.href='" + request.getContextPath() + "/member/loginForm.do';";
			message += " </script>";

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/member/memberForm.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/overlapped.do", method = RequestMethod.POST)
	public ResponseEntity overlapped(
		@RequestParam("id") String id,
		HttpServletRequest request,
		HttpServletResponse response
	) throws Exception {

		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id); // id 중복 검사.
		resEntity = new ResponseEntity(result, HttpStatus.OK);

		return resEntity;
	}

	@Override
	@RequestMapping(value = "/memberForm.do")
	public ModelAndView memberForm(
		@RequestParam(value = "code", required = false) String code,
		HttpServletRequest request,
		HttpServletResponse response
	) throws Exception {

		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		if (code != null) {
			String access_Token = kakao.getAccessToken(code);
			HttpSession session = request.getSession();

			HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
			String kakao_id = (String)userInfo.get("kakao_id");

			if (kakao_id != null) {
				String kakaoOverlap = memberService.kakaoOverlap(kakao_id);

				if (kakaoOverlap.equals("true")) {
					session.setAttribute("kakao_id", kakao_id);
					mav = loginflag(request, response);
				} else {
					session.setAttribute("userInfo", userInfo);
					mav.addObject("userInfo", userInfo);
				}
			}
		}
		return mav;
	}

	private ModelAndView loginflag(HttpServletRequest request,
		HttpServletResponse response
	) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String kakao_id = (String)session.getAttribute("kakao_id");

		if (kakao_id != null) {
			memberVO = memberService.kakaologin(kakao_id);
		} else {
		}

		if (memberVO != null && memberVO.getMember_id() != null) {

			session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo", memberVO);

			String action = (String)session.getAttribute("action");
			if (action != null && action.equals("/order/orderEachGoods.do")) {
				mav.setViewName("forward:" + action);
			} else {
				mav.setViewName("redirect:/main/main.do");
			}
		} else {
			String message = "아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}
}
