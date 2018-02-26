package cn.uestc.ssm.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import cn.uestc.ssm.po.Activity;
import cn.uestc.ssm.po.Person;
import cn.uestc.ssm.po.SignUp;
import cn.uestc.ssm.po.SignUpPeople;
import cn.uestc.ssm.service.IUserService;

@Controller
public class ActivityController {
	
	@Resource 
	private IUserService userService;    
	
	//跳转至报名页
	@RequestMapping("/toSignUpPage.do")
	public ModelAndView toSignupPage(HttpSession session,HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();		
		modelAndView.setViewName("signupPage");
		return modelAndView;	
	}	
	
	//主页显示活动
	@RequestMapping("/getActivities.do")
	public ModelAndView getActivities(HttpSession session,HttpServletRequest request) throws Exception {
		List<Activity> activitylist = userService.findAllActivity();
		for(Activity a:activitylist){
			System.out.println("Activity中的person属性为："+a.getPerson().toString());
		}
		ModelAndView modelAndView = new ModelAndView();		
		modelAndView.addObject("activitylist", activitylist);
		modelAndView.setViewName("getActivities");
		return modelAndView;	
	}
	
	//获取全部活动详情
	@RequestMapping("/toActivityDetails.do")
	public ModelAndView toActivityDetails(HttpSession session,HttpServletRequest request) throws Exception {
		System.out.println("活动详情界面，活动的ID为: "+request.getParameter("aid"));
		int aid=Integer.parseInt(request.getParameter("aid"));
		
		ModelAndView modelAndView = new ModelAndView();	

		Activity activity = userService.getActivityById(aid);
		List<SignUpPeople> peopleList=userService.getSignUpOfActivity(aid);
		System.out.println("###############################");
		System.out.println(peopleList.toString());
		session.setAttribute("activity", activity);
		modelAndView.addObject("peopleList", peopleList);
		modelAndView.addObject("activity", activity);
		//*/
		modelAndView.setViewName("activityDetails");
		return modelAndView;	
	}	

	//按关键字搜索指定的活动	
	@RequestMapping("/searchActivities.do")
	public ModelAndView getActivitiesByKeyword(HttpSession session,HttpServletRequest request) throws Exception {
		System.out.println("关键字为: "+request.getParameter("search"));
		String keyword=request.getParameter("search");
		ModelAndView modelAndView = new ModelAndView();	

		List<Activity> activitylist = userService.getActivitiesByKeyword(keyword);

		modelAndView.addObject("activitylist", activitylist);

		modelAndView.setViewName("getActivities");
		return modelAndView;	
	}

	//获取活动详情
		@RequestMapping("/toMyPostedActivityDetails.do")
		public ModelAndView toMyPostedActivityDetails(HttpSession session,HttpServletRequest request) throws Exception {
			System.out.println("活动详情界面，活动的ID为: "+request.getParameter("aid"));
			int aid=Integer.parseInt(request.getParameter("aid"));
			ModelAndView modelAndView = new ModelAndView();	
			List<SignUpPeople> peopleList=userService.getSignUpOfActivity(aid);
			Activity activity = userService.getActivityById(aid);
			
			session.setAttribute("activity", activity);
			modelAndView.addObject("peopleList", peopleList);
			modelAndView.addObject("activity", activity);
			//*/
			modelAndView.setViewName("myPostedActivityDetails");
			return modelAndView;	
		}	
		
		//获取活动详情
		@RequestMapping("/toMyJoinedActivityDetails.do")
		public ModelAndView toMyJoinedActivityDetails(HttpSession session,HttpServletRequest request) throws Exception {
			System.out.println("活动详情界面，活动的ID为: "+request.getParameter("aid"));
			int aid=Integer.parseInt(request.getParameter("aid"));
			ModelAndView modelAndView = new ModelAndView();	
			List<SignUpPeople> peopleList=userService.getSignUpOfActivity(aid);
			Activity activity = userService.getActivityById(aid);
			
			session.setAttribute("activity", activity);
			modelAndView.addObject("peopleList", peopleList);
			modelAndView.addObject("activity", activity);
			//*/
			modelAndView.setViewName("myJoinedActivityDetails");
			return modelAndView;	
		}	
		
	
	
	//报名参加活动
		@ResponseBody
		@RequestMapping("/joinActivity.do")
		public  Map<String,Integer> toSignUp(HttpSession session, HttpServletRequest request) throws Exception {
			Map<String,Integer>map =new HashMap<String,Integer>();
			String msg=request.getParameter("message");
			Person person=(Person) session.getAttribute("loginPerson");
			if (person!=null){
				Activity activity= (Activity) session.getAttribute("activity");
				System.out.println("Session中的person为:  "+person.toString()+",activity为"+activity.toString()+",msg:"+msg);
				SignUp su=userService.ajaxQueryIfJoined(person,activity); 
				if(null==su){
					userService.joinActivity(person,activity,msg);		
					map.put("msg",0);//恭喜您，报名成功！
				}else{
					map.put("msg",1);//您已报过名，无需再报名
				}
			}else{
				map.put("msg",2 ); //请先登录
			}
			
			return map;	
		}	
		
		//发布活动
		@ResponseBody
		@RequestMapping("/postActivity.do")
		public Map<String,String> postActivity(Activity activity,HttpSession session,HttpServletRequest request) throws Exception {
			System.out.println("进入  postActivity()方法，..."+activity.toString());
			Map<String,String>map =new HashMap<String,String>();
			Person person=(Person) session.getAttribute("loginPerson");
			System.out.println("session中的person为:"+person.toString());
			userService.postActivity(activity,person);
			System.out.println("即将要发布的活动为:  "+activity.toString());
			//ModelAndView modelAndView = new ModelAndView();	
			
			map.put("msg","活动发布成功！");
			//modelAndView.setViewName("postActivity");
			return map;	
		}	
		
	

	
}
