package service;

import static db.jdbcUtil.*;

import java.sql.Connection;

import dao.MembersDAO;

import dto.membersDTO;

public class memberService {

	public String checkLogin(String id, String pw) {
		MembersDAO dao = MembersDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		String login = dao.MemLogin(id, pw);
		close(con);
		return login;
	}

	public int insertJoin(membersDTO dto) {
		Connection con = getConnection();
		MembersDAO dao = MembersDAO.getInstance();
		dao.setConnection(con);
		int usernum = dao.getUsernum();
		dto.setUsernum(usernum);
		int result = dao.insertJoin(dto);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public membersDTO memberInfo(String idCheck) {
		Connection con = getConnection();
		MembersDAO dao = MembersDAO.getInstance();
		dao.setConnection(con);
		membersDTO memInfo = dao.memInfo(idCheck);
		close(con);
		return memInfo;
	}

	public String checkId(String uid) {
		Connection con = getConnection();
		MembersDAO dao = MembersDAO.getInstance();
		dao.setConnection(con);
		String resultMsg;
		String checkId = dao.checkId(uid);
		System.out.println("checkId :" + checkId);
		if (checkId == null) {
			resultMsg = "OK";
		} else {
			resultMsg = "NO";
		}
		close(con);
		return resultMsg;
	}

	public membersDTO memberModify(String login) {
		MembersDAO dao = MembersDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		membersDTO Modify = dao.memberModify(login);

		close(con);
		return Modify;
	}

	public int ModifyProcess(membersDTO modifyPro) {
		MembersDAO dao = MembersDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		int modifyResult = dao.ModifyUpdate(modifyPro);

		if (modifyResult > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		return modifyResult;
	}

	public int memberDel(String login) {
		MembersDAO dao = MembersDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		int deleteResult = dao.memberDel(login);

		if (deleteResult > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		return deleteResult;
	}
}
