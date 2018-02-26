package cn.uestc.ssm.controller;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.uestc.ssm.po.Activity;
import cn.uestc.ssm.po.Person;
import cn.uestc.ssm.service.IUserService;

@Controller
public class SelectionController {
	
	@Resource 
	private IUserService userService;    
		
	//接受用户
	@ResponseBody
	@RequestMapping("/selectPerson.do")
	public Map<String, String> ajax_regist(HttpServletRequest request,HttpSession session) throws Exception {
		Map<String, String> map = new HashMap<String, String>();		
		//ModelAndView modelAndView=new ModelAndView();
		int pid =Integer.parseInt(request.getParameter("pid"));
		Person person=(Person) session.getAttribute("loginPerson");
		session.setAttribute("postedPersonId", person.getPid());
		Activity activity=(Activity) session.getAttribute("activity");
		userService.selectPerson(pid,activity.getId());
		//modelAndView.setViewName("myPostedActivityDetails");
		map.put("msg", "接受用户");
		System.out.println("selectPerson.do invoked!");
		return map;	
	}
	
	//拒绝用户
	@ResponseBody
	@RequestMapping("/inclinePerson.do"  )
	public Map<String,String > regist(HttpSession session,HttpServletRequest request) throws Exception{	
		Map<String, String> map = new HashMap<String, String>();
		int pid =Integer.parseInt(request.getParameter("pid"));
		Person person=(Person) session.getAttribute("loginPerson");
		session.setAttribute("postedPersonId", person.getPid());
		Activity activity=(Activity) session.getAttribute("activity");
		userService.inclinePerson(pid,activity.getId());
		map.put("msg", "已拒绝用户");
		System.out.println("inclinePerson.do invoked!");
		return map;
	}
	
	
}
