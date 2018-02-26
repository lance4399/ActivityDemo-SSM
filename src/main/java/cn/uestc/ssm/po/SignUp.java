package cn.uestc.ssm.po;

public class SignUp {
	private int id;
	private int activityId;
	private int personId;
	private String accept;
	private String message;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getActivityId() {
		return activityId;
	}
	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}
	public int getPersonId() {
		return personId;
	}
	public void setPersonId(int personId) {
		this.personId = personId;
	}
	public String getAccept() {
		return accept;
	}
	public void setAccept(String accept) {
		this.accept = accept;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "SignUp [id=" + id + ", activityId=" + activityId + ", personId=" + personId + ", accept=" + accept
				+ ", message=" + message + "]";
	}
	
	
	
}
