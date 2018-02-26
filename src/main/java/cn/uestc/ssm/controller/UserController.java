package cn.uestc.ssm.controller;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import cn.uestc.ssm.utils.VerifyCode;
import cn.uestc.ssm.po.Activity;
import cn.uestc.ssm.po.Person;

import cn.uestc.ssm.service.IUserService;

@Controller
public class UserController {
	
	@Resource
	private IUserService userService;

	@RequestMapping("/toIndex.do")
	public String toIndex(Person person, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "index";
	}

	@RequestMapping("/toRegist.do")
	public String toRegist(Person person, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "regist";
	}

	@RequestMapping("/toLogin.do")
	public String toLogin(Person person, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "login";
	}

	@RequestMapping("/toMyPage.do")
	public String toPersonCenter(Person person, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "myPage";
	}

	@RequestMapping("/toPostActivity.do")
	public String toPostActivity(Person person, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "postActivity";
	}

	@RequestMapping("/toGetActivityPage.do")
	public ModelAndView toGetActivityPage(Person person, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("getActivities");
		return modelAndView;
	}

	@RequestMapping(value = "/toLogout")
	public ModelAndView toLogout(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		session.invalidate();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/ajax_regist.do")
	public Map<String, String> ajax_regist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		String username = request.getParameter("username");
		System.out.println("Ajax执行，接收到的username为:" + username);
		Person existsUser = userService.ajaxQueryByName(username);
		if (existsUser != null) {
			map.put("ret", "1"); // 用户名存在
			map.put("msg", "请更换一个新的用户名再注册");
		} else {
			map.put("ret", "2"); // 用户名可用
		}
		System.out.println("ajax_regist()方法被调用");
		return map;
	}

	@RequestMapping("/regist.do")
	public ModelAndView regist(Person person, HttpSession session) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("欲注册的账号:" + person.toString());

		Person user = userService.ajaxQueryByName(person.getUsername());
		if (user == null) {
			userService.regist(person);
			session.setAttribute("loginPerson", person);
			modelAndView.setViewName("success");
		} else {
			modelAndView.setViewName("regist");
		}
		System.out.println("regist.do invoked!");
		return modelAndView;
	}

	@RequestMapping("/login.do")
	public ModelAndView login(Person person, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println(
				"the one try to login whose name:" + person.getUsername() + ",password:" + person.getPassword());
		Person loginUser = userService.login(person.getUsername(), person.getPassword());
		// 判断用户身份
		if (loginUser != null) {
			System.out.println(" the loginUsername:" + loginUser.getUsername() + ",Nickname:" + loginUser.getNickname());
			session.setAttribute("loginPerson", loginUser);
			modelAndView.setViewName("index");
		} else {
			modelAndView.setViewName("login");
		}
		System.out.println("login.do invoked!");
		return modelAndView;
	}

	@RequestMapping("/ifLoginForMyPage.do")
	public String ifLoginForMyPage(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		return "ifLoginForMyPage";
	}
	
	@RequestMapping("/ifLoginForPostActivity.do")
	public String ifLoginForPostActivity(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		return "ifLoginForPostActivity";
	}

	// 获取我的信息：发表记录和参与记录
	@RequestMapping("/getMyPageDetails.do")
	public ModelAndView getMyPageDetails(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("进入  postActivity()方法，...");
		ModelAndView modelAndView = new ModelAndView();
		Person person = (Person) session.getAttribute("loginPerson");
		System.out.println("session中的person为:" + person.toString());

		if(person != null){				
			// 获取我参与的活动记录数
			int num1 = userService.getMyPostedActivityNumber(person.getPid());
			session.setAttribute("myPostedActivityNumber", num1);
			// 获取我发布的活动记录数
	
			int num2 = userService.getMyJoinedActivityNumber(person.getPid());
			session.setAttribute("myJoinedActivityNumber", num2);
	
			System.out.println("发布的活动数目为: " + num1 + ",参与的活动数为：" + num2);
	
			modelAndView.setViewName("myPage");
		}else{
			modelAndView.setViewName("login");
		}
		
		return modelAndView;
	}

	// 获取我的发表详细记录
	@RequestMapping("/getMyPostedActivities.do")
	public ModelAndView getMyPostedActivities(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("进入  postActivity()方法，...");
		Map<String, String> map = new HashMap<String, String>();
		ModelAndView modelAndView = new ModelAndView();
		Person person = (Person) session.getAttribute("loginPerson");
		System.out.println("session中的person为:" + person.toString());

		List<Activity> activitylist = userService.getMyPostedActivities(person.getPid());
		modelAndView.addObject("activitylist", activitylist);
		System.out.println("我发布的活动有以下: " + activitylist.toString());

		modelAndView.setViewName("myPostedActivities");
		return modelAndView;
	}

	// 获取我参与的详细记录
	@RequestMapping("/getMyJoinedActivities.do")
	public ModelAndView getMyJoinedActivities(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("进入  postActivity()方法，...");
		Map<String, String> map = new HashMap<String, String>();
		ModelAndView modelAndView = new ModelAndView();
		Person person = (Person) session.getAttribute("loginPerson");
		System.out.println("session中的person为:" + person.toString());

		// 获取我参与的活动记录
		List<Activity> activitylist = userService.getMyJoinedActivities(person.getPid());
		session.setAttribute("activitylist", activitylist);

		modelAndView.setViewName("myJoinedActivities");
		return modelAndView;
	}

	@RequestMapping("/verifycode.do")
	public void verifycode(Person person, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		VerifyCode vc = new VerifyCode();
		BufferedImage image = vc.getImage();
		request.getSession().setAttribute("session_verifycode", vc.getText());
		VerifyCode.output(image, response.getOutputStream());
		System.out.println("verifycode.do invoked!");
	}

	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("YYYY-MM-dd"), true));
	}

}
