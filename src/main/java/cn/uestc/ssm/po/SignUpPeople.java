package cn.uestc.ssm.po;

public class SignUpPeople {
	private int pid;
	private String nickname;
	private String pimage;
	private String message;
	private String accept;
	
	
/*	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}*/
	
	
	public String getMessage() {
		return message;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getAccept() {
		return accept;
	}
	public void setAccept(String accept) {
		this.accept = accept;
	}
	@Override
	public String toString() {
		return "SignUpPeople [pid=" + pid + ", nickname=" + nickname + ", pimage=" + pimage + ", message=" + message
				+ ", accept=" + accept + "]";
	}



}
