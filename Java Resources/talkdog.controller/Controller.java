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

@WebServlet("/Common/*.do, /Mypage/*.do")
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
		String cmd = request.getRequestURI().substring(request.getContextPath().length()); // /market/을 걷어냄
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
		} else if (cmd.equals("/Common/masInsert.do")) {
	 		masInsert(request);
			response.sendRedirect(url);
			return;
		} else if(cmd.equals("/Mypage/masReqConfirm.do")) {
//			System.out.println("승인 start\n");
			masAppSelect(request);
			System.out.println("승인 중간");
			response.sendRedirect(url);
//			System.out.print("승인 done\n");
			return;
		}

		RequestDispatcher rdp = request.getRequestDispatcher(url); // 저장된 url로 forwarding
		rdp.forward(request, response);
		// foward
	}

	private void admFid(HttpServletRequest request) {
		System.out.println("77");
		String admName = request.getParameter("admName");
		String admPhone = request.getParameter("admPhone");

//		System.out.println("테스트");
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

	}

	public void masInsert(HttpServletRequest request) throws IOException {
		// 전문가 등록 신청
		System.out.println("reqInsert start\n");
		
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
		
		if (sid != null) {
	        masvo.setAdmId(sid);
	        masvo.setMaspaper(multi.getFilesystemName("masPaper")); // multi로 넣어야 됨
	        masvo.setMasSveri(multi.getFilesystemName("masSveri"));
	        masvo.setMasProf("../resources/images/" + multi.getFilesystemName("masProf")); // 앞에 풀 경로 넣어줘야 나중에 조회할 때 이미지 나옴
	        masvo.setMasIntro(multi.getParameter("masIntro"));
	        masvo.setMasSchool(multi.getParameter("masSchool"));

	        System.out.print(uploadFilePath);

	        System.out.println("\n masInsert ok \n"); // 확인용

	        if (masdao.masInsert(masvo)) {
	            session.setAttribute("msg", "전문가 신청이 완료되었습니다.");
	        } else {
	            session.setAttribute("msg", "전문가 신청에 실패하였습니다.");
	        }
	        System.out.println("reqInsert 신청 전\n");
	        
	      //신청시 요청목록
	        boolean masRequest = masdao.masReqList(masvo);
	        masvo.setAdmId(sid);
	        System.out.println("reqInsert 신청 후\n");
	        
	        
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
		
		url = "/talkdog/mypage/admMasCon.jsp";
		
	}
	
	public void masConfirm(HttpServletRequest request) {
		AdminVO avo = new AdminVO();
		MasterVO masvo = new MasterVO();
		
		// 전문가 승인 - 승인 여부 변경
		boolean masCon = masdao.masConfirm("masvo");
		
		//승인 - 회원 종류 업데이트
		boolean masUpType = masdao.masConType("");
		
		
		//request 삭제
		boolean reqDelete = masdao.reqDelete("");
		
	}

	private void masReject(HttpServletRequest request) {
		// 전문가 거절

	}

	private void masSelect(HttpServletRequest request) {

	}

	private void masProfileSelect(HttpServletRequest request) {

	}

	private void masPUpdate(HttpServletRequest request) {

	}

	private void masDelete(HttpServletRequest request) {

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
			session.setAttribute("msg", "회원가입이 완료되었습니다.");
		} else {
			session.setAttribute("msg", "회원가입에 실패하였습니다.");
		}
		url = "/talkdog/common/messages.jsp?msg=";
	}

	private void admSelectAll(HttpServletRequest request) {

	}

	private void admSelectNormal(HttpServletRequest request) {

	}

	private void admSelect(HttpServletRequest request) {

	}

	private void admUpdate(HttpServletRequest request) {

	}

	private void admDelete(HttpServletRequest request) {

	}

}