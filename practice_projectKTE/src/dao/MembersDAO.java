package dao;

import static db.jdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import dto.membersDTO;

public class MembersDAO {

	private static MembersDAO dao;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private MembersDAO() {};
	public static MembersDAO getInstance() {
		if (dao==null) {
			dao = new MembersDAO();
		}
		return dao;
	}
	
	public void setConnection(Connection con) {
		this.con = con;		
	}
	
	public String MemLogin(String id, String pw) {
		String sql = "SELECT USERID FROM MEMBERS WHERE USERID=? AND USERPW=?";
		String result = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
	public int insertJoin(membersDTO dto) {
		String sql = "INSERT INTO MEMBERS VALUES(?,?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getUsernum());
			pstmt.setString(2, dto.getUserid());
			pstmt.setString(3, dto.getUserpw());
			pstmt.setString(4, dto.getUsername());
			pstmt.setString(5, dto.getUserphone());
			pstmt.setString(6, dto.getUsergender());
			pstmt.setString(7, dto.getUseraddr());
			pstmt.setString(8, dto.getUseremail());
			pstmt.setString(9, dto.getUserdomain());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int getUsernum() {
		String sql = "SELECT COUNT(USERNUM) FROM MEMBERS";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1)+1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	public membersDTO memInfo(String idCheck) {
		String sql = "SELECT * FROM MEMBERS WHERE USERID=?";
		membersDTO memInfo = new membersDTO();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idCheck);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memInfo.setUserid(rs.getString(2));
				memInfo.setUserpw(rs.getString(3));
				memInfo.setUsername(rs.getString(4));
				memInfo.setUserphone(rs.getString(5));
				memInfo.setUsergender(rs.getString(6));
				memInfo.setUseraddr(rs.getString(7));
				memInfo.setUseremail(rs.getString(8));
				memInfo.setUserdomain(rs.getString(9));
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return memInfo;
	}
	public String checkId(String uid) {
		String sql = "SELECT USERID FROM MEMBERS WHERE USERID=?";
		String result = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);

		}
		return result;
	}
	
	public membersDTO memberModify(String login) {
		String sql = "SELECT * FROM MEMBERS WHERE USERID = ?";
		membersDTO Modify = new membersDTO();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Modify.setUserid(rs.getString(2));
				Modify.setUserpw(rs.getString(3));
				Modify.setUsername(rs.getString(4));
				Modify.setUserphone(rs.getString(5));
				Modify.setUsergender(rs.getString(6));
				Modify.setUseraddr(rs.getString(7));
				Modify.setUseremail(rs.getString(8));
				Modify.setUserdomain(rs.getString(9));
				
			}System.out.println(Modify);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return Modify;
	}
	public int ModifyUpdate(membersDTO modifyPro) {
		String sql = "UPDATE MEMBERS SET USERNAME = ?, USERID = ?, USERPW = ?, USERPHONE = ?, USERGENDER = ?, USERADDR = ?, USEREMAIL = ?  WHERE USERID = ?";
		int modifyResult = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyPro.getUsername());
			pstmt.setString(2, modifyPro.getUserid());
			pstmt.setString(3, modifyPro.getUserpw());
			pstmt.setString(4, modifyPro.getUserphone());
			pstmt.setString(5, modifyPro.getUsergender());
			pstmt.setString(6, modifyPro.getUseraddr());
			pstmt.setString(7, modifyPro.getUseremail());
			pstmt.setString(8, modifyPro.getUserid());

			modifyResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return modifyResult;
	}
	public int memberDel(String login) {
		String sql = "DELETE FROM MEMBERS WHERE USERID = ?";
		int deleteResult = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login);
			deleteResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return deleteResult;

	}
	
	
	
	
	
	
	
}
