
package cn.uestc.ssm.po;

public class CommentActivity {
	private int id;
	private int personId;
	private int activityId;
	private int grades;
	
	
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


	public int getGrades() {
		return grades;
	}


	public void setGrades(int grades) {
		this.grades = grades;
	}


	@Override
	public String toString() {
		return "CommentActivity [id=" + id + ", personId=" + personId + ", activityId=" + activityId + ", grades="
				+ grades + "]";
	}
	
	
}
