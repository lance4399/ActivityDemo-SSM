package cn.uestc.ssm.service;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import cn.uestc.ssm.dao.UserMapper;
import cn.uestc.ssm.po.Activity;
import cn.uestc.ssm.po.Person;
import cn.uestc.ssm.po.SignUp;
import cn.uestc.ssm.po.SignUpPeople;

@Service
public class UserService  implements IUserService{

	@Resource
    private UserMapper userMapper;

	//用户注册
	public void regist(Person person) throws Exception {
		userMapper.regist(person);
		System.out.println("进入dao层执行了regist()...");
	}

	//AJAX识别用户名是否存在
	public Person ajaxQueryByName(String username)  throws Exception{	 
		Person checkedUser =userMapper.ajaxQueryByName(username);
		return checkedUser;
	}

	//无参查找全体活动
	public List<Activity> findAllActivity() throws Exception{		
		return userMapper.showActivity();
	}

	//关键字查询活动
	public List<Activity> getActivitiesByKeyword(String keyword) throws Exception{
		System.out.println("进入service层执行了getActivitiesByKeyword ");
		return userMapper.getActivitiesByKeyword(keyword);
	}

	//根据ID查询某一个活动
	public Activity getActivityById(int aid) throws Exception{
		
		return userMapper.getActivityById(aid);
	}

	//登录
	public Person login(String username,String password) throws Exception {
		System.out.println("login service invoked!");
		Person loginUser=userMapper.findPersonByUsernameAndPassword(username,password);		
		  if(loginUser==null){
			throw new Exception("用户名或密码错误!");
		}
		return loginUser;
	}

	//发布活动
	public void postActivity(Activity activity,Person person) {	
		activity.setPerson(person);
		System.out.println("进入DAO层的activity对象为："+activity.toString());
		userMapper.postActivity(activity);
	}

	public void joinActivity(Person person, Activity activity, String msg) {
		 SignUp su=new SignUp();
		 su.setPersonId(person.getPid());
		 su.setActivityId(activity.getId());
		 su.setAccept("unknown");
		 su.setMessage(msg);	 
		 userMapper.joinActivity(su);
	}

	public int getMyPostedActivityNumber(int pid) {
		return userMapper.getMyPostedActivityNumber(pid);
	}


	public int getMyJoinedActivityNumber(int pid) {	
		return userMapper.getMyJoinedActivityNumber(pid);
	}

	public List<Activity> getMyPostedActivities(int pid) {		
		return userMapper.getMyPostedActivities(pid);
	}

	public List<Activity> getMyJoinedActivities(int pid) {
		return userMapper.getMyJoinedActivities(pid);
	}

	public SignUp ajaxQueryIfJoined(Person person, Activity activity) {
		return userMapper.ajaxQueryIfJoined(person.getPid(),activity.getId());
	}

	public List<SignUpPeople> getSignUpOfActivity(int aid) {
		return userMapper.getSignUpOfActivity(aid);
	}

	public void inclinePerson(int pid, int aid) {
		userMapper.inclinePerson(pid, aid);
	}

	public void selectPerson(int pid, int aid) {
		userMapper.selectPerson(pid, aid);		
	}
	
}
