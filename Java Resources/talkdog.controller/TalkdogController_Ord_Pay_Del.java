package talkdog.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import talkdog.dao.AdminDAO;
import talkdog.dao.CartDAO;
import talkdog.dao.DeliveryDAO;
import talkdog.dao.MasterDAO;
import talkdog.dao.OrderDAO;
import talkdog.dao.PaymentDAO;
import talkdog.vo.DeliveryVO;
import talkdog.vo.OrderVO;
import talkdog.vo.PaymentVO;
import talkdog.vo.ProductVO;
import talkdog.vo.CartVO;

@WebServlet("/Order/*")
public class TalkdogController_Ord_Pay_Del extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private HttpSession session; // 로그인한 사람만 하려면 세션이 필요, 서블릿은 세션이 내장객체가 아니라서 필요함
	private String url;
	private DeliveryDAO ddao; // 이 시점에선 dao가 null
	private OrderDAO odao;
	private PaymentDAO pdao;
	private CartDAO cdao;

	private MasterDAO masdao;
	private AdminDAO adao;

	public void init(ServletConfig config) throws ServletException {
		ServletContext servletCtx = config.getServletContext(); // ServletContext 객체 생성
		// DBCPInitListener(커넥션관련 리스너)에서 setAttribute한 걸 getAttribute
		Connection con = (Connection) servletCtx.getAttribute("con"); // Object -> Connection 형변환
		ddao = new DeliveryDAO(con); // dao 객체 생성
		odao = new OrderDAO(con);
		pdao = new PaymentDAO(con);
		cdao = new CartDAO(con);

		// 로그인
		adao = new AdminDAO(con);
		masdao = new MasterDAO(con);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response); // get,post 방식 모두 다 doPost()로 보내서 처리
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cmd = request.getRequestURI().substring(request.getContextPath().length()); // cmd에 /어쩌구.do만 담길 것임
		session = request.getSession(); // jsp는 session이 내장 객체지만 java는 아니므로 요청객체 사용

		// <cmd에 따라 각 해당 메서드 호출>
		if (cmd.equals("/DeliveryView.do")) { // 배송정보 상세 조회
			delSelect(request);
		} else if (cmd.equals("/InsertForm.do")) // 주문정보, 배송정보, 결제 정보 등록 폼
		{
			url = "/order/orderEnroll.jsp";
		} else if (cmd.equals("/Insert.do")) { // 주문정보, 배송정보, 결제 정보 등록
			System.out.println("부르긴 부름");
			allInsert(request);
		} else if (cmd.equals("/OrderList.do")) { // 주문정보 전체 조회
			ordSelectAll(request);
		} else if (cmd.equals("/OrderView.do")) { // 주문정보 상세 조회
			ordSelect(request, response);
			response.sendRedirect(url);
		} else if (cmd.equals("/OrderUpdateForm.do")) { // 주문정보 수정 폼
			ordUpdateForm(request);
		} else if (cmd.equals("/OrderUpdate.do")) { // 주문정보 수정
			ordUpdate(request);
			response.sendRedirect(url);
			return;
		} else if (cmd.equals("/PayView.do")) { // 결제 정보 상세 조회
			paySelect(request, response);
			response.sendRedirect(url);
		} else if (cmd.equals("/PayModify.do")) { // 결제 정보 수정
			payUpdate(request);
			response.sendRedirect(url);
		} else {
			System.out.println("해당하는 커맨드가 존재하지 않습니다.");
		}

		// 저장된 u rl로 forwarding
		RequestDispatcher rdp = request.getRequestDispatcher(url); // 디스패처 검색
		System.out.println(url);
		System.out.println(rdp);
		rdp.forward(request, response);
	}

	// /order/예시예시.do 로 요청이 들어온 경우 실행할 내용을 메서드 안에 기입
	// --------------------------------------Delivery---------------------------------------

	// 주문정보, 배송정보, 결제 정보 등록 /Insert.do
	private void allInsert(HttpServletRequest request) {
		
		// 클라이언트로부터 받은 파라미터를 이용하여 DeliveryVO 객체 생성
	    DeliveryVO dvo = new DeliveryVO();
	    // DeliveryVO에 클라이언트로부터 받은 파라미터 값 넣기
	    dvo.setDelName(request.getParameter("delName"));
	    dvo.setDelAddress1(request.getParameter("delAddress1"));
	    dvo.setDelAddress2(request.getParameter("delAddress2"));
	    dvo.setDelAddress3(request.getParameter("delAddress3"));
	    dvo.setDelPhone(request.getParameter("delPhone"));
	    dvo.setDelMemo(request.getParameter("delMemo"));
	    // DeliveryDAO의 delInsert 메서드를 호출하여 배송정보 등록
	    if (ddao.delInsert(dvo)) {
	        request.getSession().setAttribute("msg", "배송정보 등록 완료");

	     // 클라이언트로부터 받은 파라미터를 이용하여 OrderVO 객체 생성
	     OrderVO ovo = new OrderVO();
	     // OrderVO에 클라이언트로부터 받은 파라미터 값 넣기
	     ovo.setOrdIng(request.getParameter("ordIng"));
	     ovo.setAdmId(request.getParameter("admId"));
	     // OrderDAO의 ordInsert 메서드를 호출하여 주문내역 등록
        if (odao.ordInsert(ovo)) {
            request.getSession().setAttribute("msg", "주문내역 등록 완료");
	            
	    // 클라이언트로부터 받은 파라미터를 이용하여 PaymentVO 객체를 생성
	    PaymentVO payvo = new PaymentVO();
	    // PaymentVO에 클라이언트로부터 받은 파라미터 값을 채움 (VO와 동일)
	    payvo.setPayNo(request.getParameter("payNo"));
	    payvo.setPayTotal(0); // int값 이게 맞는지 해결
	    payvo.setPayAgree(request.getParameter("payAgree"));
	    payvo.setPayDate(request.getParameter("paid_at"));
	    payvo.setPayCancleDate(request.getParameter("payCancelDate"));
	    
	    String impUid = request.getParameter("imp_uid");
	    int paidAmount = Integer.parseInt(request.getParameter("paid_amount"));
	    String merchantUid = request.getParameter("merchant_uid");
	    String applyNum = request.getParameter("apply_num");
	    long paidAt = Long.parseLong(request.getParameter("paid_at"));
	
	    // PaymentDAO의 payInsert 메서드를 호출하여 결제내역을 등록
	    if (pdao.payInsert(payvo)) {
	        request.getSession().setAttribute("msg", "등록 성공");
	    } else {
	        request.getSession().setAttribute("msg", "등록 실패");
	    }
        }
	    }
	  
	}


	// --------------------------------------Delivery---------------------------------------

	// 배송정보 조회 메서드
	private void delSelect(HttpServletRequest request) {
		// 클라이언트로부터 받은 파라미터를 이용하여 주문번호 가져오기

		// DeliveryDAO의 delSelect 메서드를 호출하여 주문번호에 해당하는 배송정보를 조회합니다.
		// DeliveryVO deliveryVO = ddao.delSelect(ordNo);
		// 조회한 결과를 적절한 방식으로 응답합니다.
	}

	// --------------------------------------Order---------------------------------------

	// 주문내역 전체조회
	private void ordSelectAll(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("sid");
		
		//로그인 한 사람의 주문내역 전체조회
		List<OrderVO> ordList = odao.ordSelectAll("sid"); 
		Map<Number, CartVO> cartMap = new HashMap<>();	
		for (OrderVO ovo : ordList) {
			int cartNo = ovo.getCartNo();
	        CartVO cvo = odao.getCvo(cartNo);						//장바구니번호로 (수량, 옵션)이 담긴 장바구니vo 꺼냄
	        
	        if (cvo != null) {
	        	cartMap.put(cartNo, cvo);								//map에 상품아이디-상품vo로 담음
	        }
	    }
		
		// 클라이언트로부터 받은 파라미터를 이용하여 페이지 번호와 주문번호를 가져옵니다.
		String ordNo = request.getParameter("ordNo");
		int cnt = odao.ordCount(ordNo); // 전체 주문내역 숫자
		// ordSelectAll() 반환값을 요청객체의 ordList속성에 저장
		request.setAttribute("ordList", ordList);
		request.setAttribute("cartMap", cartMap);
		request.setAttribute("cnt", cnt);
		
		System.out.println("주문/배송 건수: " + cnt);

		// 조회한 결과를 적절한 방식으로 응답합니다.
		url = "/order/orderListAll.jsp"; // 끝나면 정해진 url로 보냄
	}// ordSelectAll() end

	// 주문내역 상세조회 메서드
	private void ordSelect(HttpServletRequest request, HttpServletResponse response) {
		// 클라이언트로부터 받은 파라미터를 이용하여 주문번호를 가져오기
		// orderListAll.jsp에서 제목 클릭 시 함께 담긴 파라미터들 꺼내기
		String ordNo = request.getParameter("ordNo");
		// String admId = request.getParameter("admId");

		request.setAttribute("ovo", odao.ordSelect(ordNo)); // 조회하려는 qvo 담아오기
		request.setAttribute("ordNo", ordNo); // 상세조회하는 페이지에서 qnaNo를 가지고 있어야 수정,삭제 가능
	}// ordSelect() end

	// 주문내역 수정폼
	// 주문내역 상세조회에서 가져온 ordNo을 사용하여 DB VO 하나 가져오기
	private void ordUpdateForm(HttpServletRequest request) {

		String ordNo = request.getParameter("ordNo");

		OrderVO ovo = odao.ordSelect(ordNo);
		request.setAttribute("ovo", ovo);
		request.setAttribute("ordNo", ordNo);

		System.out.println("ovo가 잘 담겼는지 확인 : " + ovo.getOrdNo());

		url = "/order/orderListEdit.jsp";
	}

	// 주문내역 수정
	// 주문내역 상세조회에서 가져온 ordNo을 사용하여 DB VO 하나 가져오기
	private void ordUpdate(HttpServletRequest request) {

		String ordNo = request.getParameter("ordNo");

		// 송장번호, 처리현황 수정
		// vo 담기
		OrderVO ovo = odao.ordSelect(ordNo);
		ovo.setInvoiceNo(Integer.parseInt(request.getParameter("InvoiceNo")));
		ovo.setOrdIng(request.getParameter("OrdIng"));

		// OrderDAO의 ordUpdate 메서드를 호출하여 주문내역을 수정
		if (odao.ordUpdate(ovo)) {
			session.setAttribute("msg", "수정 완료");
		} else {
			session.setAttribute("msg", "수정 실패");
		}
	}

	// --------------------------------------Payment---------------------------------------

	// 결제내역 조회 메서드
	private void paySelect(HttpServletRequest request, HttpServletResponse response) {

	}

	// 결제내역 수정 메서드 /payUpdate.do
	private void payUpdate(HttpServletRequest request) {
		PaymentVO payvo = new PaymentVO();
		// PaymentVO에 클라이언트로부터 받은 파라미터 값을 채움
		payvo.getPayCancleDate();
		// PaymentDAO의 payUpdate 메서드를 호출하여 결제내역을 수정
		if (pdao.payUpdate(payvo)) {
			session.setAttribute("msg", "성공 ");
		} else {
			session.setAttribute("msg", "실패");
		}
	}
}
