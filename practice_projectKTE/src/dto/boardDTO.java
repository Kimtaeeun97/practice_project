package dto;

import java.sql.Date;

public class boardDTO {
	
	private int bnum;
	private int busernum;
	private String btitle;
	private String bcontents;
	private Date bdate;
	private int bhits;
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getBusernum() {
		return busernum;
	}
	public void setBusernum(int busernum) {
		this.busernum = busernum;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontents() {
		return bcontents;
	}
	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getBhits() {
		return bhits;
	}
	public void setBhits(int bhits) {
		this.bhits = bhits;
	}
	@Override
	public String toString() {
		return "boardDTO [bnum=" + bnum + ", busernum=" + busernum + ", btitle=" + btitle + ", bcontents=" + bcontents
				+ ", bdate=" + bdate + ", bhits=" + bhits + "]";
	}
	
	
	
	
}
