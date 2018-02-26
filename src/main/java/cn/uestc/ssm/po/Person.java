package cn.uestc.ssm.po;

public class Person {
	private int  pid;
	private String username;
	private String password;
	private String nickname;
	private String pimage;
	private String tel;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}


	@Override
	public String toString() {
		return "Person [pid=" + pid + ", username=" + username + ", password=" + password + ", nickname=" + nickname
				+ ", pimage=" + pimage + ", tel=" + tel + "]";
	}
	
	
}
