package talkdog.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import talkdog.dao.CommDAO;
import talkdog.dao.CommReplyDAO;
import talkdog.dao.NoticeDAO;
import talkdog.vo.NoticeVO;

@WebServlet("/notice/*")
public class CommController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final double AMOUNT_PER_PAGE = 10.0;		// 한 페이지의 게시물 수
	private static final double NUM_PER_PAGE = 5.0;			// 한 페이지에 표시할 페이지 번호 수
	private HttpSession session;
	private String url;
	private CommReplyDAO crdao;
	private CommDAO cmdao;
	private NoticeDAO ndao;
	

	public void init(ServletConfig config) throws ServletException {
		ServletContext servletCtx = config.getServletContext();			// ServletContext 객체 생성
		Connection con = (Connection) servletCtx.getAttribute("con");	// Object -> Connection 형변환
		crdao = new CommReplyDAO(con);									// dao 객체 생성
		cmdao = new CommDAO(con);	
		ndao = new NoticeDAO(con);	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length());	// /market/을 걷어냄
		session = request.getSession();					// jsp는 session이 내장 객체지만 java는 아니므로 요청객체 사용
		
		if (cmd.equals("/CommList.do")) { 				// cmd가 /CommList.do인 경우 커뮤니티 글 목록 조회 메서드 호출
			commList(request);
		} else if (cmd.equals("/CommWriteForm.do")) { 	// cmd가 /CommWriteForm.do인 경우 commInsert.jsp로 이동
			url = "/community/commInsert.jsp";
		} else if (cmd.equals("/CommWrite.do")) { 		// cmd가 /CommWrite.do인 경우 커뮤니티 글 작성 메서드 호출
			commWrite(request);
			response.sendRedirect(url); 				// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/CommView.do")) {		// cmd가 /CommView.do인 경우 게시판 상세 조회 메서드 호출
			commView(request); 							
		} else if (cmd.equals("/CommPersonal.do")) {	// cmd가 /CommPersonal.do인 경우 내 글 목록 조회 메서드 호출
			commPersonalList(request); 					
		} else if (cmd.equals("/CommModify.do")) {		// cmd가 /CommModify.do인 경우 커뮤니티 글 수정 메서드 호출
			commUpdate(request); 						
			response.sendRedirect(url); 				// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/CommRemove.do")) {		// cmd가 /CommRemove.do인 경우 커뮤니티 글 삭제 메서드 호출
			commDelete(request); 						
			response.sendRedirect(url); 				// forwarding 안 하고 redirect 시킴
			return;
			
		} else if (cmd.equals("/CmreWrite.do")) { 		// cmd가 /CmreWrite.do인 경우 커뮤니티 댓글 등록 메서드 호출
			cmreWrite(request);
			response.sendRedirect(url); 				// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/CmreView.do")) {		// cmd가 /CmreView.do인 경우 커뮤니티 내 댓글 목록 조회 메서드 호출
			cmreView(request); 							
		} else if (cmd.equals("/CmreList.do")) {		// cmd가 /CmreList.do인 경우 커뮤니티 댓글 전체 목록 메서드 호출
			cmreList(request); 					
		} else if (cmd.equals("/CmreModify.do")) {		// cmd가 /CmreModify.do인 경우 커뮤니티 댓글 수정 메서드 호출
			cmreUpdate(request); 						
			response.sendRedirect(url); 				// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/CmreRemove.do")) {		// cmd가 /CmreRemove.do인 경우 커뮤니티 댓글 삭제 메서드 호출
			cmreDelete(request); 						
			response.sendRedirect(url); 				// forwarding 안 하고 redirect 시킴
			return;
			
		} else if (cmd.equals("/notice/NoticeWriteForm.do")) { // cmd가 /NoticeWriteForm.do인 경우 noticeEnroll.jsp로 이동
			url = "/notice/noticeEnroll.jsp";
		} else if (cmd.equals("/notice/NoticeWrite.do")) { 	// cmd가 /NoticeWrite.do인 경우 공지사항 작성 메서드 호출
			noticeWrite(request);
			response.sendRedirect(url); 					// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/notice/NoticeView.do")) {	// cmd가 /NoticeView.do인 경우 공지사항 상세 조회 메서드 호출
			noticeView(request); 						
		} else if (cmd.equals("/notice/NoticeList.do")) {	// cmd가 /NoticeList.do인 경우 공지사항 목록 조회 메서드 호출
			System.out.println("list 왜 안 나오냐");
			noticeList(request); 						
		} else if (cmd.equals("/notice/NoticeModify.do")) {	// cmd가 /NoticeModify.do인 경우 공지사항 수정 메서드 호출
			noticeUpdate(request); 						
			response.sendRedirect(url); 					// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/notice/NoticeRemove.do")) {	// cmd가 /NoticeRemove.do인 경우 공지사항 삭제 메서드 호출
			noticeDelete(request); 						
			response.sendRedirect(url); 					// forwarding 안 하고 redirect 시킴
			return;
		} 
		
		RequestDispatcher rdp = request.getRequestDispatcher(url);	// 저장된 url로 forwarding
		System.out.println(url);
		System.out.println(rdp);
		rdp.forward(request, response);
	}

	public void commWrite(HttpServletRequest request) {
	}
	public void commList(HttpServletRequest request) {
	}
	public void commPersonalList(HttpServletRequest request) {
	}
	public void commView(HttpServletRequest request) {
	}
	public void commUpdate(HttpServletRequest request) {
	}
	public void commDelete(HttpServletRequest request) {
	}
	public void cmreWrite(HttpServletRequest request) {
	}
	public void cmreList(HttpServletRequest request) {
	}
	public void cmreView(HttpServletRequest request) {
	}
	public void cmreUpdate(HttpServletRequest request) {
	}
	public void cmreDelete(HttpServletRequest request) {
	}
	public void noticeWrite(HttpServletRequest request) {
		NoticeVO nvo = new NoticeVO();						// insert할 값들 bvo에 담아서 insert 메서드 호출
		nvo.setNotTitle(request.getParameter("notTitle"));
		nvo.setNotCont(request.getParameter("notCont"));
		nvo.setNotImage(request.getParameter("notImage"));
		nvo.setNotHit(0);
		
		if(ndao.noticeInsert(nvo)) {
			session.setAttribute("msg", "글이 등록되었습니다.");
		} else {
			session.setAttribute("msg", "글 등록에 실패하였습니다.");
		}
		String category = request.getParameter("category");
		request.setAttribute("category", category);
		
		url = "./notice/NoticeList.do?pageNum=1&type=&keyword=&category=" + request.getAttribute(category);	// 작성하면 type, keyword 안 받고 그냥 1페이지로
	}
	
	public void noticeList(HttpServletRequest request) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	// 현재 페이지 번호
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");	
		String category = request.getParameter("category");
		int totalCnt = ndao.noticeCount(type, keyword, category); 			// 전체 게시물 수
		int pages = (int)Math.ceil(totalCnt / AMOUNT_PER_PAGE);				// 페이지 수
		// 각 페이지의 시작 페이지 번호 | ... | 끝 번호
		int end   = (int)(Math.ceil(pageNum / NUM_PER_PAGE) * NUM_PER_PAGE);// 끝 페이지 번호
		int start = end - (int)(NUM_PER_PAGE - 1);							// 시작 페이지 번호
			end   = end >= pages? pages : end;		// end가 pages보다 같거나 커지면 pages를 씀
		// 이전 버튼 보이도록
		boolean prev = start > 1;
		boolean next = end < pages;
		
		request.setAttribute("noticeList", ndao.noticeSelectAll(AMOUNT_PER_PAGE, pageNum, type, keyword, category));	// selectAll 호출해서 requset.setAttribute(boardList)
		request.setAttribute("totalCnt",totalCnt);	// totalCount 호출해서 requset.setAttribute(totalCnt)
		request.setAttribute("pageNum", pageNum);	// list로 보낼 값들
		request.setAttribute("pages", pages);
		request.setAttribute("end", end);
		request.setAttribute("start", start);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);		
		request.setAttribute("type", type);			
		request.setAttribute("keyword", keyword);
		request.setAttribute("category", category);
		
		System.out.println("list나와라");
		url = "/notice/noticeList.jsp";
	}
	public void noticeView(HttpServletRequest request) {
	}
	public void noticeUpdate(HttpServletRequest request) {
	}
	public void noticeDelete(HttpServletRequest request) {
	}	
		
}