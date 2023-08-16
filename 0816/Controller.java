package talkdog.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import talkdog.dao.AdminDAO;
import talkdog.dao.MasterDAO;
import talkdog.vo.AdminMasterWrapperVO;
import talkdog.vo.AdminVO;
import talkdog.vo.MasterVO;

@WebServlet({"/Common/*", "/Mypage/*"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final double AMOUNT_PER_PAGE = 5.0;
	private static final double NUM_PER_PAGE = 5.0;
	private HttpSession session;
	private String url;
	private MasterDAO masdao;
	private AdminDAO adao;

	public void init(ServletConfig config) throws ServletException {
		ServletContext servletCtx = config.getServletContext(); // ServletContext 객체 생성
		Connection con = (Connection) servletCtx.getAttribute("con");
		adao = new AdminDAO(con);
		masdao = new MasterDAO(con);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length());	// /market/을 걷어냄
		session = request.getSession();

		if (cmd.equals("/Common/join.do")) {
			admInsert(request);
			response.sendRedirect(url);
			System.out.println("joindo");
			return;
		} else if (cmd.equals("/Common/joinform.do")) {
			url = "/common/join.jsp";
			
		} else if (cmd.equals("/Common/findPwForm.do")) {
			url = "/common/fidnPw.jsp";

		} else if (cmd.equals("/Common/findId.do")) { // 매핑을 못찾음
			admFid(request);
			response.sendRedirect(url);
			return;
		} else if (cmd.equals("/Common/findPw.do")) {
			admFpw(request);
			response.sendRedirect(url);
			return;
		} else if (cmd.equals("/Mypage/masInsert.do")) {
			System.out.println("신청 전");
	 		masInsert(request);
			response.sendRedirect(url);
			System.out.println("신청 후");
			return;
		} else if(cmd.equals("/Mypage/masReqConfirm.do")) {
//			System.out.println("승인 start\n");
			masAppSelect(request);
			System.out.println("승인 중간");
	//		response.sendRedirect(url); //리다이렉트로 받아오면 안됨
//			System.out.print("승인 done\n");
//			return;
		} else if(cmd.equals("/Mypage/admMemList.do")) {
			admSelectAll(request);
			response.sendRedirect(url);
			return;
		} else if(cmd.equals("/Mypage/masProfileSelect.do")) {
			masProfileSelect(request);
			response.sendRedirect(url);
			return;
		}else if(cmd.equals("/Mypage/masProfileSelectView.do")) {
			masProfileSelectView(request);
			response.sendRedirect(url);
			return;
		}else if(cmd.equals("/Mypage/masConfirm.do")) {
//			System.out.println("승인 전");
			masConfirm(request);
			response.sendRedirect(url);
//			System.out.println("승인 후");
			return;
		}else if(cmd.equals("/Mypage/masReject.do")) {
//			System.out.println("거절 전");
			masReject(request);
			response.sendRedirect(url);
//			System.out.println("거절 후");
			return;
		}
//		else if(cmd.equals("/Common/login.do")) {
//			System.out.println("로그인 con 들어옴");
//			masAppSelect(request);
//			response.sendRedirect(url);
//			return;
//		}

		RequestDispatcher rdp = request.getRequestDispatcher(url);	// 저장된 url로 forwarding
		rdp.forward(request, response);
		// foward
	}
	
//	private void login(HttpServletRequest request){
//		AdminVO avo = new AdminVO();
//		if(adao.login(avo)) {
//			// msg에 login 저장하고 messages.jsp로 리다이렉트
//			session.setAttribute("sid", avo.getAdmId());
//			
//			url = "../index.jsp?msg=login";	 //빨간 글쉬..
//		} else{
//		// 그렇지 않은 경우
//			// 파라미터의 msg 속성에 fail을 저장하고 login.jsp로 리다이렉트
//			url="login.jsp?msg=fail";
//		}
//		
//	}
	private void admFid(HttpServletRequest request) {
		String admName = request.getParameter("admName");
		String admPhone = request.getParameter("admPhone");

		AdminVO avo = new AdminVO();
		avo.setAdmName(request.getParameter("admName")); // avo에 저장
		avo.setAdmPhone(request.getParameter("admPhone"));

		String admId = adao.admFid(avo);

		if (admId != null) {
			// 아이디를 찾았을 경우
			session.setAttribute("admId", admId);

		} else {
			// 아이디를 찾지 못했을 경우
			session.setAttribute("msg", "회원정보가 일치하지 않습니다.");
		}

		url = "/talkdog/common/findId.jsp";//
	}
	
	private void admFpw(HttpServletRequest request) {
		// 비밀번호 찾기
		System.out.println("77");
		String admName = request.getParameter("admName");
		String admPhone = request.getParameter("admPhone");
		String admId = request.getParameter("admId");

//		System.out.println("테스트");
		AdminVO avo = new AdminVO();
		avo.setAdmName(request.getParameter("admName")); // avo에 저장
		avo.setAdmPhone(request.getParameter("admPhone"));
		avo.setAdmId(request.getParameter("admId"));

		String admPw = adao.admFpw(avo);

		if (admPw != null) {
			// 아이디를 찾았을 경우
			session.setAttribute("admPw", admPw);

		} else {
			// 아이디를 찾지 못했을 경우
			session.setAttribute("msg", "회원정보가 일치하지 않습니다.");
		}

		url = "/talkdog/common/findPw.jsp";//

	}

	public void masInsert(HttpServletRequest request) throws IOException {
		// 전문가 등록 신청
		System.out.println("신청 중간 1");
		
		String savePath = "/resources/images";
		ServletContext context = request.getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		int maxSize = 1024 * 1024 * 10; // 최대 업로드 크기 10
		String encType = "UTF-8";
		
		
		MultipartRequest multi = new MultipartRequest(request, uploadFilePath, maxSize, encType,
				new DefaultFileRenamePolicy());

		MasterVO masvo = new MasterVO();
		HttpSession session = request.getSession(); // 세션 가져오기
		String sid = (String) session.getAttribute("sid");
		System.out.println("신청 중간 2");
		System.out.println(sid);
		if (sid != null) {
	        masvo.setAdmId(sid);
	        masvo.setMasPaper(multi.getFilesystemName("masPaper")); // multi로 넣어야 됨
	        masvo.setMasSveri(multi.getFilesystemName("masSveri"));
	        masvo.setMasProf("../resources/images/" + multi.getFilesystemName("masProf")); // 앞에 풀 경로 넣어줘야 나중에 조회할 때 이미지 나옴
	        masvo.setMasIntro(multi.getParameter("masIntro"));
	        masvo.setMasSchool(multi.getParameter("masSchool"));

	        System.out.print(uploadFilePath);

	        System.out.println("\n masInsert ok \n"); // 확인용

	        if (masdao.masInsert(masvo)) {
	        	url = "/talkdog/common/messages.jsp?msg=masReq";
	        } else {
	        	url = "/talkdog/common/messages.jsp?msg=masReqFail";
	        }
	        System.out.println("신청 중간3\n");
	        
//	        //신청시 회원 종류 변경
//	        AdminVO avo = new AdminVO();
//	        boolean masUpType = masdao.masConType("avo");
//	        avo.setAdmType(sid);
	        
	      //신청시 요청목록
	        boolean masRequest = masdao.masReqList(masvo);
	        masvo.setAdmId(sid);
	        System.out.println("신청 중간 4\n");
	        
	        
	    } else {
	        session.setAttribute("msg", "로그인되어 있지 않습니다."); // userId가 null일 때
	    }
		
		url = "/talkdog/index.jsp";
	}
	
	private void masAppSelect(HttpServletRequest request) {
		//요청 목록 조회 리스트
		System.out.print("승인 컨트롤러 시작\n");
		List<AdminMasterWrapperVO> amvolist = masdao.masAppSelect();
		// 조회된 데이터를 request에 저장
		request.setAttribute("amvolist", amvolist);
		System.out.print("승인 컨트롤러 끝\n");
		
		url = "/mypage/admMasCon.jsp";
		
	}
	
	public void masConfirm(HttpServletRequest request) {
		
		//승인
		System.out.println("승인 중간 1");
		
		AdminVO avo = new AdminVO();
		MasterVO masvo = new MasterVO();
		String admId = request.getParameter("admId");
		// 전문가 승인 - 승인 여부 변경
		boolean masCon = masdao.masConfirm(admId);
		masvo.setMasConfirm(admId);
		System.out.println("승인 중간 2");
		
		//승인 - 회원 종류 업데이트
		boolean masUpType = masdao.masConType(admId);
		avo.setAdmType(admId);
		System.out.println("승인 중간 3");
		//request 삭제
		boolean reqDelete = masdao.reqDelete(admId);
		System.out.println("승인 중간 4");
		
		url="/talkdog/Mypage/masReqConfirm.do";
	}

	private void masReject(HttpServletRequest request) {
		// 전문가 거절
		
		System.out.println("거절 중간1");
		
		AdminVO avo = new AdminVO();
		MasterVO masvo = new MasterVO();
		String admId = request.getParameter("admId");
		//전문가 목록에서 삭제
		boolean masConR = masdao.masDelete(admId);
		System.out.println("거절 중간2");
		//전문가 요청 목록 삭제
		boolean masReqR = masdao.reqDelete(admId);
		System.out.println("거절 중간3");
		
		url="/talkdog/Mypage/masReqConfirm.do";
	}

	private void masSelect(HttpServletRequest request) {

	}
	
	private void masProfileSelectView(HttpServletRequest request) {
		//타인 전문가 프로필 조회
		System.out.println("프로필 조회 start\n");

		String admId = request.getParameter("admId"); //로그인 한 아이다
		
		MasterVO masvo = masdao.masProfileSelect(admId);
		
		String masProf = request.getParameter("masProf");
		String admName = request.getParameter("admName");
		String masAuth = request.getParameter("masAuth");
		String masIntro = request.getParameter("masIntro");
		String masAddr = request.getParameter("masAddr");
		String masSchool = request.getParameter("masSchool");
		String masCert = request.getParameter("masCert");
		String admid = request.getParameter("sid");
		
		request.setAttribute("masProf", masProf);
		request.setAttribute("admName", admName);
		request.setAttribute("masAuth", masAuth);
		request.setAttribute("masIntro", masIntro);
		request.setAttribute("masAddr", masAddr);
		request.setAttribute("masSchool", masSchool);
		request.setAttribute("masCert", masCert);
		
		url = "/talkdog/mypage/memMyProfileView.jsp";
	}

	private void masProfileSelect(HttpServletRequest request) {
		//본인 전문가 프로필 조회
		System.out.println("프로필 조회 start\n");

		String sid = (String) session.getAttribute("sid"); //로그인 한 아이다
		
		MasterVO masvo = masdao.masProfileSelect(sid);
		
		String masProf = request.getParameter("masProf");
		String admName = request.getParameter("admName");
		String masAuth = request.getParameter("masAuth");
		String masIntro = request.getParameter("masIntro");
		String masAddr = request.getParameter("masAddr");
		String masSchool = request.getParameter("masSchool");
		String masCert = request.getParameter("masCert");
		String admid = request.getParameter("sid");
		
		request.setAttribute("masProf", masProf);
		request.setAttribute("admName", admName);
		request.setAttribute("masAuth", masAuth);
		request.setAttribute("masIntro", masIntro);
		request.setAttribute("masAddr", masAddr);
		request.setAttribute("masSchool", masSchool);
		request.setAttribute("masCert", masCert);
		
		url = "/talkdog/mypage/memMyProfile.jsp";
	}

	private void masPUpdate(HttpServletRequest request) {
		System.out.println("프로필 조회 start\n");

		String sid = (String) session.getAttribute("sid"); //로그인 한 아이다
		
		MasterVO masvo = masdao.masProfileSelect(sid);
		
		String masProf = request.getParameter("masProf");
		String admName = request.getParameter("admName");
		String masAuth = request.getParameter("masAuth");
		String masIntro = request.getParameter("masIntro");
		String masAddr = request.getParameter("masAddr");
		String masSchool = request.getParameter("masSchool");
		String masCert = request.getParameter("masCert");
		String admid = request.getParameter("sid");
		
		request.setAttribute("masProf", masProf);
		request.setAttribute("admName", admName);
		request.setAttribute("masAuth", masAuth);
		request.setAttribute("masIntro", masIntro);
		request.setAttribute("masAddr", masAddr);
		request.setAttribute("masSchool", masSchool);
		request.setAttribute("masCert", masCert);
		
		//본인 전문가 프로필 수정
		masvo = new MasterVO(); 						// 수정할 값들 view.jsp에서 갖고와서 bvo에 담고 update 메서드 호출
		masvo.setMasProf(request.getParameter("masProf"));
		masvo.setMasProf(request.getParameter("masProf"));
		masvo.setMasProf(request.getParameter("masProf"));
		masvo.setMasProf(request.getParameter("masProf"));
		masvo.setMasProf(request.getParameter("masProf"));
		
//		if(masdao.masPUpdate(masvo)) {
//			session.setAttribute("msg", "게시물이 수정되었습니다.");
//		} else {
//			session.setAttribute("msg", "게시물 수정에 실패하였습니다.");
//		}
//		
	}

	private void masDelete(HttpServletRequest request) {
		//dao에서 전문가 요청 삭제
		
	}

	

	private void admInsert(HttpServletRequest request) {
		System.out.println("db넘김 전전전");
		// 회원 등록
		AdminVO avo = new AdminVO();
		avo.setAdmName(request.getParameter("admName"));
		avo.setAdmId(request.getParameter("admId"));
		avo.setAdmNick(request.getParameter("admNick"));
		avo.setAdmPw(request.getParameter("admPw"));
		avo.setAdmMail(request.getParameter("zipNo"));
		avo.setAdmAdd1(request.getParameter("admAdd1"));
		avo.setAdmAdd2(request.getParameter("admAdd2"));
		avo.setAdmAdd3(request.getParameter("admAdd3"));
		avo.setAdmPhone(request.getParameter("admPhone"));
		avo.setAdmEmail((String) request.getParameter("admEmail"));

		System.out.println(request.getParameter("admEmail"));// 확인용

		if (adao.admInsert(avo)) {
			url = "/talkdog/common/messages.jsp?msg=join";
//			session.setAttribute("msg", "회원가입이 완료되었습니다.");
		} else {
			url = "/talkdog/common/messages.jsp?msg=joinFail";
//			session.setAttribute("msg", "회원가입에 실패하였습니다.");
		}
	}

	private void admSelectAll(HttpServletRequest request) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	// 현재 페이지 번호
		String admId = request.getParameter("admId");
		String admName = request.getParameter("admName");		
		int totalCnt = adao.totalCount(admId, admName); 						// 전체 게시물 수
		int pages = (int)Math.ceil(totalCnt / AMOUNT_PER_PAGE);				// 페이지 수
		// 각 페이지의 시작 페이지 번호 | ... | 끝 번호
		int end   = (int)(Math.ceil(pageNum / NUM_PER_PAGE) * NUM_PER_PAGE);// 끝 페이지 번호
		int start = end - (int)(NUM_PER_PAGE - 1);							// 시작 페이지 번호
			end   = end >= pages? pages : end;		// end가 pages보다 같거나 커지면 pages를 씀
		// 이전 버튼 보이도록
		boolean prev = start > 1;
		boolean next = end < pages;
		
		request.setAttribute("boardList", adao.admSelectAll(AMOUNT_PER_PAGE, pageNum, admId, admName));	// selectAll 호출해서 requset.setAttribute(boardList)
		request.setAttribute("totalCnt",totalCnt);	// totalCount 호출해서 requset.setAttribute(totalCnt)
		request.setAttribute("pageNum", pageNum);	// list로 보낼 값들
		request.setAttribute("pages", pages);
		request.setAttribute("end", end);
		request.setAttribute("start", start);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);		
		request.setAttribute("admId", admId);			
		request.setAttribute("admName", admName);
		
//		url = "/board/list.jsp";
	}

	private void admSelectNormal(HttpServletRequest request) {

	}

	private void admSelect(HttpServletRequest request) {

	}

	private void admUpdate(HttpServletRequest request) {

	}

	private void admDelete(HttpServletRequest request) {
		//회원 탈퇴
		String sid = request.getParameter("sid");
		if(adao.admDelete(sid)) {
			url = "/talkdog/common/messages.jsp?msg=rem";
//			response.sendRedirect("/common/messages.jsp?msg=rem");
		} else {
			url = "/talkdog/common/messages.jsp?msg=remFail";
//			response.sendRedirect("/common/messages.jsp?msg=remFail");
		}
		
	}

}