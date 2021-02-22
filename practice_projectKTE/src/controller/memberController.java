package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.membersDTO;
import service.memberService;

/**
 * Servlet implementation class memberLogin
 */
@WebServlet(value = { "/memberLogin", "/memberLogout", "/memberJoin", "/memberInfo", "/checkId", "/ModifyProcess", "/ModifyProcesser", "/memberDel" })
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public memberController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		memberService membersvc = new memberService();

		switch (request.getServletPath()) {
		case "/memberLogin":
			System.out.println("/memberLogin");
			String id = request.getParameter("userid");
			String pw = request.getParameter("userpw");

			String login = membersvc.checkLogin(id, pw);
			System.out.println("login : " + login);

			session.setAttribute("login", login);
			response.sendRedirect("home.jsp");

			break;

		case "/memberJoin":
			System.out.println("memberJoin");
			membersDTO dto = new membersDTO();
			dto.setUserid(request.getParameter("userid"));
			dto.setUserpw(request.getParameter("userpw"));
			dto.setUsername(request.getParameter("username"));
			dto.setUserphone(request.getParameter("userphone"));
			dto.setUsergender(request.getParameter("usergender"));
			dto.setUseraddr(request.getParameter("useraddr"));
			dto.setUseremail(request.getParameter("useremail"));
			dto.setUserdomain(request.getParameter("userdomain"));

			int result = membersvc.insertJoin(dto);
			System.out.println(result);

			if (result > 0) {
				response.sendRedirect("login.jsp");
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원가입실패!')");
				out.println("history.back()");
				out.println("</script>");

			}
			break;

		case "/memberLogout":
			System.out.println("/memberLogout");
			session.invalidate();
			response.sendRedirect("login.jsp");

			break;

		case "/memberInfo":
			System.out.println("/memberInfo");
			login = (String) session.getAttribute("login");
			System.out.println(login);

			membersDTO MemInfo = membersvc.memberInfo(login);

			request.setAttribute("memInfo", MemInfo);
			if (login == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인이 되지않았습니다.')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("mypage.jsp");
				dispatcher.forward(request, response);
			}
			break;

		case "/checkId":
			System.out.println("/idCheck");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			String uid = request.getParameter("uid");
			String resultMsg = membersvc.checkId(uid);

			out.print(resultMsg);
			break;
			
		case "/ModifyProcess":
			System.out.println("/ModifyProcess");
			response.setContentType("text/html; charset=UTF-8");

			login = (String) session.getAttribute("login");
			System.out.println(login);
			
			membersDTO Modify = membersvc.memberModify(login);
			System.out.println(Modify);
			request.setAttribute("Modify", Modify);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("memberModify.jsp");
			dispatcher.forward(request, response);	
			
			break;
			
		case "/ModifyProcesser":
			System.out.println("/ModifyProcesser");
			response.setContentType("text/html; charset=UTF-8");

			String userid = request.getParameter("userid");
			String userpw = request.getParameter("userpw");
			String username = request.getParameter("username");
			String userphone = request.getParameter("userphone");
			String usergender = request.getParameter("usergender");
			String useraddr = request.getParameter("useraddr");
			String useremail = request.getParameter("useremail");
			
			membersDTO modifyPro = new membersDTO();
			modifyPro.setUserid(userid);
			modifyPro.setUserpw(userpw);
			modifyPro.setUsername(username);
			modifyPro.setUserphone(userphone);
			modifyPro.setUsergender(usergender);
			modifyPro.setUseraddr(useraddr);
			modifyPro.setUseremail(useremail);
			
			int modifyResult = membersvc.ModifyProcess(modifyPro);
			if(modifyResult > 0) {
				response.sendRedirect("memberInfo");
			
			break;
			}
			
			case "/memberDel":
				System.out.println("/memberDel");
				response.setContentType("text/html; charset=UTF-8");

				login = (String) session.getAttribute("login");
				System.out.println(login);
				
				int delete = membersvc.memberDel(login);
				System.out.println(delete);
				
				dispatcher = request.getRequestDispatcher("home.jsp");
				dispatcher.forward(request, response);	
				
				break;
				
			
			}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
