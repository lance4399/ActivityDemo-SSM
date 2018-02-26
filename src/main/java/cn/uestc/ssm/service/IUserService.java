package cn.uestc.ssm.service;

import java.util.List;

import cn.uestc.ssm.po.Activity;
import cn.uestc.ssm.po.Person;
import cn.uestc.ssm.po.SignUp;
import cn.uestc.ssm.po.SignUpPeople;


public interface IUserService {

	public List<Activity> findAllActivity() throws Exception;

	public List<Activity> getActivitiesByKeyword(String keyword) throws Exception;

	public Activity getActivityById(int aid) throws Exception;

	public Person ajaxQueryByName(String username) throws Exception;

	public Person login(String username,String password) throws Exception;

	public void regist(Person user)throws Exception;

	public void postActivity(Activity a,Person person);

	public void joinActivity(Person person, Activity activity, String msg);

	public int getMyPostedActivityNumber(int pid);

	public int getMyJoinedActivityNumber(int pid);

	public List<Activity> getMyPostedActivities(int pid);

	public List<Activity> getMyJoinedActivities(int pid);

	public SignUp ajaxQueryIfJoined(Person person, Activity activity);

	public List<SignUpPeople> getSignUpOfActivity(int aid);

	public void inclinePerson(int pid, int id);

	public void selectPerson(int pid, int id);


}
