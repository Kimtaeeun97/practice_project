package dto;

public class membersDTO {

	private int usernum;
	private String userid;
	private String userpw;
	private String username;
	private String userphone;
	private String usergender;
	private String useraddr;
	private String useremail;
	private String userdomain;
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getUsergender() {
		return usergender;
	}
	public void setUsergender(String usergender) {
		this.usergender = usergender;
	}
	public String getUseraddr() {
		return useraddr;
	}
	public void setUseraddr(String useraddr) {
		this.useraddr = useraddr;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUserdomain() {
		return userdomain;
	}
	public void setUserdomain(String userdomain) {
		this.userdomain = userdomain;
	}
	@Override
	public String toString() {
		return "membersDTO [usernum=" + usernum + ", userid=" + userid + ", userpw=" + userpw + ", username=" + username
				+ ", userphone=" + userphone + ", usergender=" + usergender + ", useraddr=" + useraddr + ", useremail="
				+ useremail + ", userdomain=" + userdomain + "]";
	}

	
	 
}
