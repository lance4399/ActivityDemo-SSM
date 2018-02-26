package cn.uestc.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.uestc.ssm.po.Activity;
import cn.uestc.ssm.po.Person;
import cn.uestc.ssm.po.SignUp;
import cn.uestc.ssm.po.SignUpPeople;

public interface UserMapper {

	@Select("SELECT * FROM person WHERE username=#{username} and password=#{password}" )	
	public Person findPersonByUsernameAndPassword(@Param("username") String username,@Param("password") String password);
		
	/*
	 @Select("SELECT a.id,a.name,a.startTime,a.duringTime,a.needPeople,a.existingPeople,a.selectedPeople,a.location,a.description,a.image,"
			+ "p.pid,p.username,p.password,p.nickname,p.pimage FROM  activity a, person p WHERE a.personId = p.pid "
			+ "AND CONCAT(a.name,a.location,a.description,p.username) LIKE concat(concat('%',#{keyword}),'%')")  
	public List<Activity> getActivitiesByKeyword(@Param("keyword")String keyword);
	 */
	
	@Select("SELECT * FROM person WHERE username=#{person.username}" )
	public Person ajaxQueryByName(String username);
	
	 @Insert("insert into activity (id,name,needPeople,startTime,duringTime,location,description,image,personId) "
			+ "values(#{a.id},#{a.name},#{a.needPeople},#{a.startTime},#{a.duringTime},#{a.location},#{a.description},#{a.image},#{a.person.pid})")
	public void postActivity(@Param("a") Activity activity);
	
	@Insert("insert into signup (id,activityId,personId,accept,message) values(#{su.id},#{su.activityId},#{su.personId},#{su.accept},#{su.message})")
	public void joinActivity(@Param("su") SignUp su);
	
	@Select("SELECT count(s.activityId) FROM signup s,person p where p.pid=s.personId and p.pid=#{id}")
	public int getMyJoinedActivityNumber(@Param("id")int id);
	
	@Select("SELECT count(a.id) FROM activity a where a.personId=#{id}")
	public int getMyPostedActivityNumber(@Param("id")int id);
	
	@Select("SELECT *  FROM activity a where a.personId=#{id}")
	public List<Activity> getMyPostedActivities(@Param("id")int id);
	
	@Select("select a.* from (SELECT *  FROM signup s,person p where p.pid=s.personId and p.pid=#{id}) as x ,activity a where x.activityId=a.id")
	public List<Activity> getMyJoinedActivities(@Param("id")int id);
	
	@Update("update signup set accept ='true' where personId=#{pid} and activityId=#{aid}")
	public void selectPerson(@Param("pid")int pid,@Param("aid")int aid);
	
	@Update("update signup set accept ='false' where personId=#{pid} and activityId=#{aid}")
	public void inclinePerson(@Param("pid")int pid,@Param("aid")int aid);
	
	@Select ("select p.pid,p.nickname,p.pimage, s.message,s.accept FROM person p ,signup s WHERE s.personId=p.pid AND s.activityId=#{aid}")
	public List<SignUpPeople> getSignUpOfActivity(@Param("aid")int aid);

	@Select ("select * from signup where personId=#{pid} and activityId=#{aid}")
	public SignUp ajaxQueryIfJoined(@Param("pid")int pid, @Param("aid")int aid);
	
	public void regist(Person person);
	
	public Activity getActivityById(int aid);
	
	public List<Activity> showActivity();
	
	public List<Activity> getActivitiesByKeyword(String name);
}
