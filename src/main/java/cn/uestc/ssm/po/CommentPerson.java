package cn.uestc.ssm.po;

public class CommentPerson {
	private int id;
	private int personId;
	private int activityId;
	private int grade;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPersonId() {
		return personId;
	}
	public void setPersonId(int personId) {
		this.personId = personId;
	}
	public int getActivityId() {
		return activityId;
	}
	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "CommentPerson [id=" + id + ", personId=" + personId + ", activityId=" + activityId + ", grade=" + grade
				+ "]";
	}
	
	
}
