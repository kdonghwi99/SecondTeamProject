package talkdog.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import talkdog.dao.CommDAO;
import talkdog.dao.CommReplyDAO;
import talkdog.dao.NoticeDAO;
import talkdog.vo.CommReplyVO;
import talkdog.vo.CommVO;
import talkdog.vo.NoticeVO;

//@WebServlet({"*.do"})
@WebServlet({"/Notice/*", "/Comm/*"})
public class CommController extends HttpServlet {
	
   private static final long serialVersionUID = 1L;
   private static final double AMOUNT_PER_PAGE = 10.0;   	//페이지당 게시글 갯수를 상수로 설정해놈
   private static final double NUM_PER_PAGE = 5.0;      		//하단에 1 2 3 4 5 페이지 뜨게 함
   private HttpSession session;		//로그인한 사람만 게시글을 쓰게 하려면 세션이 필요한데, 서블릿은 세션이 내장객체가 아니라서 필요함
   private String url;
   private CommReplyDAO crdao;
   private CommDAO cmdao;
   private NoticeDAO ndao;
   
   public void init(ServletConfig config) throws ServletException {
	   ServletContext servletCtx = config.getServletContext();
		//DBCPInitListener(커넥션관련 리스너)에서 setAttribute한 걸 getAttribute하는 과정이래
		Connection con = (Connection)servletCtx.getAttribute("con");
		
		crdao = new CommReplyDAO(con);									// dao 객체 생성
		cmdao = new CommDAO(con);	
		ndao = new NoticeDAO(con);
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);		//get,post 방식 모두 다 doPost()로 보내서 처리할 것
//      response.getWriter().print(request.getParameter("heart"));
      
   }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	
		String cmd = request.getRequestURI().substring(request.getContextPath().length());		//cmd에 /*.do만 담길 것임
		session = request.getSession();
		
		if (cmd.equals("/Notice/NoticeWriteForm.do")) { 	// cmd가 /NoticeWriteForm.do인 경우 noticeEnroll.jsp로 이동
			url = "/notice/noticeEnroll.jsp";
		} else if (cmd.equals("/Notice/NoticeWrite.do")) { 	// cmd가 /NoticeWrite.do인 경우 공지사항 작성 메서드 호출
			noticeWrite(request);
			response.sendRedirect(url); 					// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/Notice/NoticeView.do")) {	// cmd가 /NoticeView.do인 경우 공지사항 상세 조회 메서드 호출
			noticeView(request); 						
		} else if (cmd.equals("/Notice/NoticeList.do")) {	// cmd가 /NoticeList.do인 경우 공지사항 목록 조회 메서드 호출
			noticeList(request); 						
		} else if (cmd.equals("/Notice/NoticeModifyForm.do")) {	// cmd가 /NoticeModifyForm.do인 경우 공지사항 수정 조회 메서드 호출
			noticeViewAndUpdate(request);
		} else if (cmd.equals("/Notice/NoticeModify.do")) {	// cmd가 /NoticeModify.do인 경우 공지사항 수정 메서드 호출
			noticeUpdate(request); 						
			response.sendRedirect(url); 					// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/Notice/NoticeRemove.do")) {	// cmd가 /NoticeRemove.do인 경우 공지사항 삭제 메서드 호출
			noticeDelete(request); 						
			response.sendRedirect(url); 					// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/Comm/CommWriteForm.do")) { 	// cmd가 /CommWriteForm.do인 경우 커뮤니티 작성 메서드 호출
			url = "/community/commEnroll.jsp";
		} else if (cmd.equals("/Comm/CommWrite.do")) { 		// cmd가 /CommWrite.do인 경우 커뮤니티 작성 메서드 호출
			commWrite(request);
			response.sendRedirect(url); 					// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/Comm/CommView.do")) {		// cmd가 /CommView.do인 경우 커뮤니티 상세 조회 메서드 호출
			commView(request); 						
		} else if (cmd.equals("/Comm/CommListAll.do")) {	// cmd가 /CommListAll.do인 경우 커뮤니티 목록 전체 조회 메서드 호출
			commListAll(request); 	
		} else if (cmd.equals("/Comm/CommList.do")) {		// cmd가 /CommList.do인 경우 커뮤니티 목록 조회 메서드 호출
			commListPersonal(request); 						
		} else if (cmd.equals("/Comm/CommModifyForm.do")) {	// cmd가 /CommModifyForm.do인 경우 커뮤니티 수정 조회 메서드 호출
			commViewAndUpdate(request);
		} else if (cmd.equals("/Comm/CommModify.do")) {		// cmd가 /CommModify.do인 경우 커뮤니티 수정 메서드 호출
			commUpdate(request); 						
			response.sendRedirect(url); 					// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/Comm/CommRemove.do")) {		// cmd가 /CommRemove.do인 경우 커뮤니티 삭제 메서드 호출
			commDelete(request); 						
			response.sendRedirect(url); 					// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/Comm/CommHeart.do")) {
			commHeart(request);
			return;
		} else if (cmd.equals("/Comm/CmreWrite.do")) { 		// cmd가 /CommWrite.do인 경우 커뮤니티 작성 메서드 호출
			cmreWrite(request);
			response.sendRedirect(url); 					// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/Comm/CmreList.do")) {		// cmd가 /CommList.do인 경우 커뮤니티 목록 조회 메서드 호출
			cmreListPersonal(request); 						
		} else if (cmd.equals("/Comm/CmreModifyForm.do")) {	// cmd가 /CommModifyForm.do인 경우 커뮤니티 수정 조회 메서드 호출
			cmreView(request);
		} else if (cmd.equals("/Comm/CmreModify.do")) {		// cmd가 /CommModify.do인 경우 커뮤니티 수정 메서드 호출
			cmreUpdate(request); 						
			response.sendRedirect(url); 					// forwarding 안 하고 redirect 시킴
			return;
		} else if (cmd.equals("/Comm/CmreRemove.do")) {		// cmd가 /CommRemove.do인 경우 커뮤니티 삭제 메서드 호출
			cmreDelete(request); 						
			response.sendRedirect(url); 					// forwarding 안 하고 redirect 시킴
			return;
		}
			
		RequestDispatcher rdp = request.getRequestDispatcher(url);			//디스패처 검색
		rdp.forward(request, response);
	}

	
	// 공지사항 메서드
	
	public void noticeWrite(HttpServletRequest request) throws IOException {
		String savePath = "/resources/images";
		ServletContext context = request.getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		int maxSize = 1024 * 1024 * 10; // 최대 업로드 크기 10
		String encType = "UTF-8";

		MultipartRequest multi = new MultipartRequest(request, uploadFilePath, maxSize, encType, new DefaultFileRenamePolicy());

		NoticeVO nvo = new NoticeVO();						// insert할 값들 nvo에 담아서 insert 메서드 호출
		nvo.setNotTitle(multi.getParameter("notTitle"));	// 다른 값들도 multi로 넣어야 null값으로 안 넘어감
		nvo.setNotCont(multi.getParameter("notCont"));
		nvo.setNotImage("../resources/images/" + multi.getFilesystemName("notImage"));	// 앞에 풀 경로 넣어줘야 나중에 조회할 때 이미지 나옴
		nvo.setNotCategory(multi.getParameter("notCategory"));
		nvo.setNotHit(0);
		
		if(ndao.noticeInsert(nvo)) {
			session.setAttribute("msg", "글이 등록되었습니다.");
		} else {
			session.setAttribute("msg", "글 등록에 실패하였습니다.");
		}
		String category = multi.getParameter("notCategory");
		
		try {
            String encodedCategory = URLEncoder.encode(category, "UTF-8");
            url = "./NoticeList.do?pageNum=1&type=&keyword=&category=" + encodedCategory;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
//		System.out.println("category : " + category);
//		request.setAttribute("category", category);
//		System.out.println("req.category : " + request.getAttribute(category));
		
//		url = "./NoticeList.do?pageNum=1&type=&keyword=&category=" + category;	// 작성하면 type, keyword 안 받고 그냥 1페이지로
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
		
		url = "/notice/noticeList.jsp";
	}
	public void noticeView(HttpServletRequest request) {
		// num, id, sid 받아오기
		int notNo = Integer.parseInt(request.getParameter("notNo"));
		String admId = request.getParameter("id");
		String sid = (String) session.getAttribute("sid");
		String category = request.getParameter("category");

		if (sid == null || !admId.equals(sid)) { 	// 세션 아이디랑 비교해서 다르다면 updateHit
			ndao.noticeHit(notNo);
		}
		request.setAttribute("nvo", ndao.noticeSelect(notNo)); // 1개 조회 메서드 호출해서 nvo에 담기

		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		request.setAttribute("category", category);
		url = "/notice/noticeDetail.jsp"; 					// nvo 갖고 noticeDetail.jsp로 이동
	}
	public void noticeViewAndUpdate(HttpServletRequest request) {
		int notNo = Integer.parseInt(request.getParameter("notNo"));
		request.setAttribute("nvo", ndao.noticeSelect(notNo));
		
		String category = request.getParameter("category");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		request.setAttribute("category", category);
		
		url = "/notice/noticeEdit.jsp";
	}
	public void noticeUpdate(HttpServletRequest request) {
		NoticeVO nvo = new NoticeVO(); 						// 수정할 값들 view.jsp에서 갖고와서 bvo에 담고 update 메서드 호출
		nvo.setNotCategory(request.getParameter("notCategory"));
		nvo.setNotTitle(request.getParameter("notTitle"));
		nvo.setNotCont(request.getParameter("notCont"));
		nvo.setNotNo(Integer.parseInt(request.getParameter("notNo")));
//		nvo.setNotImage(request.getParameter("notImage"));
		
		if(ndao.noticeUpdate(nvo)) {
			session.setAttribute("msg", "글이 수정되었습니다.");
		} else {
			session.setAttribute("msg", "글 수정에 실패하였습니다.");
		}
		
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		String category = request.getParameter("notCategory");
		request.setAttribute("pageNum", pageNum);			// view.jsp에서 param.type으로 넘겼을 경우
		request.setAttribute("type", type);					// 받고 넘길 필요 없이 그냥 url에 getParameter하면 됨
		request.setAttribute("keyword", keyword);
		request.setAttribute("category", category);
		try {
            String encodedCategory = URLEncoder.encode(category, "UTF-8");
            url = "./NoticeList.do?pageNum=" + request.getAttribute("pageNum") + "&type=" + request.getAttribute("type")
            + "&keyword=" + request.getAttribute("keyword") + "&category=" + encodedCategory;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
		
	}
	public void noticeDelete(HttpServletRequest request) {
		int notNo = Integer.parseInt(request.getParameter("notNo"));	// 삭제할 게시물의 번호 받아와서 delete 메서드 호출
		
		if(ndao.noticeDelete(notNo)) {
			session.setAttribute("msg", "글이 삭제되었습니다.");
		} else {
			session.setAttribute("msg", "글 삭제에 실패하였습니다.");
		}
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		String category = request.getParameter("category");
		request.setAttribute("type", type);			
		request.setAttribute("keyword", keyword);
		request.setAttribute("category", category);
		
		try {
            String encodedCategory = URLEncoder.encode(category, "UTF-8");
            url = "./NoticeList.do?pageNum=1&type=" + request.getAttribute("type") + 
    				"&keyword=" + request.getAttribute("keyword") + "&category=" + encodedCategory;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
		
	}
	
	// 커뮤니티 메서드
	public void commWrite(HttpServletRequest request) {
		CommVO cmvo = new CommVO();						// insert할 값들 cvo에 담아서 insert 메서드 호출
		cmvo.setCmTitle(request.getParameter("cmTitle"));
		cmvo.setCmCont(request.getParameter("cmCont"));
		cmvo.setCmHit(0);
		cmvo.setCmHeart(0);
		cmvo.setAdmId(request.getParameter("sid"));
		cmvo.setCatNo(Integer.parseInt(request.getParameter("catNo")));
		
		if(cmdao.commInsert(cmvo)) {
			session.setAttribute("msg", "게시물이 등록되었습니다.");
		} else {
			session.setAttribute("msg", "게시물 등록에 실패하였습니다.");
		}
//		int catNo = Integer.parseInt(request.getParameter("catNo"));
            url = "./CommListAll.do?pageNum=1&type=&keyword=&catNo=0";
	}
	
	public void commListAll(HttpServletRequest request) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	// 현재 페이지 번호
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");	
		int catNo = Integer.parseInt(request.getParameter("catNo"));
		int totalCnt = cmdao.commCount(type, keyword, catNo); 			// 전체 게시물 수
		int pages = (int)Math.ceil(totalCnt / AMOUNT_PER_PAGE);				// 페이지 수
		// 각 페이지의 시작 페이지 번호 | ... | 끝 번호
		int end   = (int)(Math.ceil(pageNum / NUM_PER_PAGE) * NUM_PER_PAGE);// 끝 페이지 번호
		int start = end - (int)(NUM_PER_PAGE - 1);							// 시작 페이지 번호
			end   = end >= pages? pages : end;		// end가 pages보다 같거나 커지면 pages를 씀
		// 이전 버튼 보이도록
		boolean prev = start > 1;
		boolean next = end < pages;
				
		request.setAttribute("commList", cmdao.commSelectAll(AMOUNT_PER_PAGE, pageNum, type, keyword, catNo));	// selectAll 호출해서 requset.setAttribute(boardList)
		request.setAttribute("totalCnt",totalCnt);	// totalCount 호출해서 requset.setAttribute(totalCnt)
		request.setAttribute("pageNum", pageNum);	// list로 보낼 값들
		request.setAttribute("pages", pages);
		request.setAttribute("end", end);
		request.setAttribute("start", start);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);		
		request.setAttribute("type", type);			
		request.setAttribute("keyword", keyword);
		request.setAttribute("catNo", catNo);
		
		url = "/community/commList.jsp";
	}
	public void commListPersonal(HttpServletRequest request) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	// 현재 페이지 번호
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");	
		int catNo = Integer.parseInt(request.getParameter("catNo"));
		String admId = (String) session.getAttribute("sid");
		int totalCnt = cmdao.commCount(type, keyword, catNo, admId); 		// 전체 게시물 수
		int pages = (int)Math.ceil(totalCnt / AMOUNT_PER_PAGE);				// 페이지 수
		// 각 페이지의 시작 페이지 번호 | ... | 끝 번호
		int end   = (int)(Math.ceil(pageNum / NUM_PER_PAGE) * NUM_PER_PAGE);// 끝 페이지 번호
		int start = end - (int)(NUM_PER_PAGE - 1);							// 시작 페이지 번호
			end   = end >= pages? pages : end;		// end가 pages보다 같거나 커지면 pages를 씀
		// 이전 버튼 보이도록
		boolean prev = start > 1;
		boolean next = end < pages;
		
		request.setAttribute("commListPersonal", cmdao.commSelect(AMOUNT_PER_PAGE, pageNum, type, keyword, admId, catNo));	// selectAll 호출해서 requset.setAttribute(boardList)
		request.setAttribute("totalCnt",totalCnt);	// totalCount 호출해서 requset.setAttribute(totalCnt)
		request.setAttribute("pageNum", pageNum);	// list로 보낼 값들
		request.setAttribute("pages", pages);
		request.setAttribute("end", end);
		request.setAttribute("start", start);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);		
		request.setAttribute("type", type);			
		request.setAttribute("keyword", keyword);
		request.setAttribute("catNo", catNo);
		
		url = "/community/commMine.jsp";
	}
	public void commView(HttpServletRequest request) {	// 글 1개 상세 조회 + 댓글 목록
		// num, id, sid 받아오기
		int cmNo = Integer.parseInt(request.getParameter("cmNo"));
		String admId = request.getParameter("admId");
		String sid = (String) session.getAttribute("sid");

		if (sid == null || !admId.equals(sid)) { 	// 세션 아이디랑 비교해서 다르다면 updateHit
			cmdao.commHit(cmNo);					// 공감수 증가도 넣기
		}
		request.setAttribute("cmvo", cmdao.commSelect(cmNo)); // 1개 조회 메서드 호출해서 cmvo에 담기

		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		int catNo = Integer.parseInt(request.getParameter("catNo"));
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		request.setAttribute("catNo", catNo);
		
		// 댓글 목록 조회
		int totalCnt = crdao.cmreCount(cmNo); // 전체 댓글 수

		request.setAttribute("cmreList", crdao.cmreSelectAll(cmNo)); // selectAll 호출해서
		request.setAttribute("totalCnt", totalCnt); // totalCount 호출해서 requset.setAttribute(totalCnt)
		
		url = "/community/commNreply.jsp"; 					// cmvo 갖고 commNreply.jsp로 이동
	}
	public void commViewAndUpdate(HttpServletRequest request) {
		int cmNo = Integer.parseInt(request.getParameter("cmNo"));
		request.setAttribute("cmvo", cmdao.commSelect(cmNo));
		
		int catNo = Integer.parseInt(request.getParameter("catNo"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		request.setAttribute("catNo", catNo);
		
		url = "/community/commEdit.jsp";
	}
	public void commUpdate(HttpServletRequest request) {
		CommVO cmvo = new CommVO(); 						// 수정할 값들 view.jsp에서 갖고와서 cmvo에 담고 update 메서드 호출
		cmvo.setCmTitle(request.getParameter("cmTitle"));
		cmvo.setCmCont(request.getParameter("cmCont"));
		cmvo.setCatNo(Integer.parseInt(request.getParameter("catNo")));
		cmvo.setCmNo(Integer.parseInt(request.getParameter("cmNo")));
		
		if(cmdao.commUpdate(cmvo)) {
			session.setAttribute("msg", "글이 수정되었습니다.");
		} else {
			session.setAttribute("msg", "글 수정에 실패하였습니다.");
		}
		
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		int catNo = Integer.parseInt(request.getParameter("catNo"));
		request.setAttribute("pageNum", pageNum);			// view.jsp에서 param.type으로 넘겼을 경우
		request.setAttribute("type", type);					// 받고 넘길 필요 없이 그냥 url에 getParameter하면 됨
		request.setAttribute("keyword", keyword);
		request.setAttribute("catNo", catNo);
            url = "./CommListAll.do?pageNum=" + request.getAttribute("pageNum") + "&type=" + request.getAttribute("type")
            + "&keyword=" + request.getAttribute("keyword") + "&catNo=" + catNo;
		
	}
	public void commDelete(HttpServletRequest request) {
		int cmNo = Integer.parseInt(request.getParameter("cmNo"));	// 삭제할 게시물의 번호 받아와서 delete 메서드 호출
		
		if(cmdao.commDelete(cmNo)) {
			session.setAttribute("msg", "글이 삭제되었습니다.");
		} else {
			session.setAttribute("msg", "글 삭제에 실패하였습니다.");
		}
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		request.setAttribute("type", type);			
		request.setAttribute("keyword", keyword);
		
        url = "./CommListAll.do?pageNum=1&type=" + request.getAttribute("type") + 
    				"&keyword=" + request.getAttribute("keyword") + "&catNo=0";
		
	}
	
	public void commHeart(HttpServletRequest request) {
		String sid = (String) session.getAttribute("sid");	
//		String tag = request.getParameter("tag");					// 공감 상태
		int cmNo = Integer.parseInt(request.getParameter("cmNo"));	// 공감할 게시물의 번호
		cmdao.commHeartPlus(cmNo);
			
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
//		int catNo = Integer.parseInt(request.getParameter("catNo"));
		request.setAttribute("type", type);			
		request.setAttribute("keyword", keyword);
//		request.setAttribute("catNo", catNo);
		
	}
	
	// 댓글 메서드

	public void cmreWrite(HttpServletRequest request) {
		CommReplyVO cmrevo = new CommReplyVO(); // insert할 값들 nvo에 담아서 insert 메서드 호출
		cmrevo.setCmreCont(request.getParameter("cmreCont"));
		cmrevo.setCmNo(Integer.parseInt(request.getParameter("cmNo")));
		cmrevo.setAdmId(request.getParameter("sid"));

		if (crdao.cmreInsert(cmrevo)) {
			session.setAttribute("msg", "댓글이 등록되었습니다.");
		} else {
			session.setAttribute("msg", "댓글 등록에 실패하였습니다.");
		}
		int cmNo = Integer.parseInt(request.getParameter("cmNo"));
		String admId = request.getParameter("sid");
		int catNo = Integer.parseInt(request.getParameter("catNo"));

		url = "./CommView.do?pageNum=1&cmNo=" + cmNo + "&admId=" + admId + "&catNo=" + catNo;	// 작성하면 type, keyword 안 받고 그냥 1페이지로
	}


	public void cmreListPersonal(HttpServletRequest request) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 현재 페이지 번호
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		String admId = request.getParameter("sid");
		int totalCnt = crdao.cmreCount(admId, type, keyword); // 전체 게시물 수
		int pages = (int) Math.ceil(totalCnt / AMOUNT_PER_PAGE); // 페이지 수
		// 각 페이지의 시작 페이지 번호 | ... | 끝 번호
		int end = (int) (Math.ceil(pageNum / NUM_PER_PAGE) * NUM_PER_PAGE);// 끝 페이지 번호
		int start = end - (int) (NUM_PER_PAGE - 1); // 시작 페이지 번호
		end = end >= pages ? pages : end; // end가 pages보다 같거나 커지면 pages를 씀
		// 이전 버튼 보이도록
		boolean prev = start > 1;
		boolean next = end < pages;

		request.setAttribute("cmreListPersonal", crdao.cmreSelect(AMOUNT_PER_PAGE, pageNum, type, keyword, admId)); // selectAll 호출해서
		request.setAttribute("totalCnt", totalCnt); // totalCount 호출해서 requset.setAttribute(totalCnt)
		request.setAttribute("pageNum", pageNum); // list로 보낼 값들
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pages", pages);
		request.setAttribute("end", end);
		request.setAttribute("start", start);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);

		url = "/community/commMineReply.jsp";
	}
	
	public void cmreView(HttpServletRequest request) {
		int cmreNo = Integer.parseInt(request.getParameter("cmreNo"));
		int catNo = Integer.parseInt(request.getParameter("catNo"));
		request.setAttribute("cmrevo", crdao.cmreSelect(cmreNo));
		
		int cmNo = Integer.parseInt(request.getParameter("cmNo"));
		request.setAttribute("cmNo", cmNo);
		request.setAttribute("cmreNo", cmreNo);
		request.setAttribute("catNo", catNo);
		url = "/community/commReplyEdit.jsp";
	}

	public void cmreUpdate(HttpServletRequest request) {
		int cmreNo = Integer.parseInt(request.getParameter("cmreNo"));
		String cmreCont = request.getParameter("cmreCont");
		
		if (crdao.cmreUpdate(cmreNo, cmreCont)) {
			session.setAttribute("msg", "댓글이 수정되었습니다.");
		} else {
			session.setAttribute("msg", "댓글 수정에 실패하였습니다.");
		}
		int cmNo = Integer.parseInt(request.getParameter("cmNo"));
		String admId = request.getParameter("sid");
		int catNo = Integer.parseInt(request.getParameter("catNo"));

		url = "./CommView.do?pageNum=1&cmNo=" + cmNo + "&admId=" + admId + "&catNo=" + catNo;
	}

	public void cmreDelete(HttpServletRequest request) {
		int cmreNo = Integer.parseInt(request.getParameter("cmreNo")); // 삭제할 게시물의 번호 받아와서 delete 메서드 호출

		if (crdao.cmreDelete(cmreNo)) {
			session.setAttribute("msg", "댓글이 삭제되었습니다.");
		} else {
			session.setAttribute("msg", "댓글 삭제에 실패하였습니다.");
		}
		
		int cmNo = Integer.parseInt(request.getParameter("cmNo"));
		String admId = request.getParameter("sid");
		int catNo = Integer.parseInt(request.getParameter("catNo"));

		url = "./CommView.do?pageNum=1&cmNo=" + cmNo + "&admId=" + admId + "&catNo=" + catNo;
	}

}
