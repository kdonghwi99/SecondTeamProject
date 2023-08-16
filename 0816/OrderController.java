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
import talkdog.vo.AdminVO;
import talkdog.vo.CartVO;

@WebServlet("/Order/*")
public class OrderController extends HttpServlet {

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
		} else if (cmd.equals("/Order/InsertForm.do")) // 주문정보, 배송정보, 결제 정보 등록 폼
		{
			url = "/order/orderEnroll.jsp";
		} else if (cmd.equals("/Order/Insert.do")) { // 주문정보, 배송정보, 결제 정보 등록
			allInsert(request);
		} else if (cmd.equals("/Order/OrderList.do")) { // 주문정보 전체 조회
			ordSelectAll(request);
		} else if (cmd.equals("/Order/OrderView.do")) { // 주문정보 상세 조회
			ordSelect(request, response);
			response.sendRedirect(url);
		} else if (cmd.equals("/Order/OrderUpdateForm.do")) { // 주문정보 수정 폼
			ordUpdateForm(request);
		} else if (cmd.equals("/Order/OrderUpdate.do")) { // 주문정보 수정
			ordUpdate(request);
			response.sendRedirect(url);
			return;
		} else if (cmd.equals("/Order/PayView.do")) { // 결제 정보 상세 조회
			paySelect(request, response);
			response.sendRedirect(url);
		} else if (cmd.equals("/Order/PayModify.do")) { // 결제 정보 수정
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
		//세션에 담아둔 sid (현재 로그인한 아이디에 주문정보 등록 위함)
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("sid");
		
		//주문상품 정보 표시= 장바구니 리스트
		List<CartVO> cartList = cdao.cartSelectAll(sid);						//로그인한 사람의 장바구니리스트
		Map<String, ProductVO> productMap = new HashMap<>();		
			for (CartVO cvo : cartList) {
				String productId = cvo.getpId();
		        ProductVO pvo = cdao.getPvo(productId);						//상품번호로 (상품명, 가격)이 담긴 상품vo 꺼냄
		        
		        if (pvo != null) {
		            productMap.put(productId, pvo);								//map에 상품아이디-상품vo로 담음
		        }	
		    }
		    request.setAttribute("cartList", cartList);
		    request.setAttribute("productMap", productMap);		//상품명, 가격을 담은 Map
	}//allInsert end

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
		
		//ordSelectAll 반환값 요청객체의 qvoList속성에 저장
		request.setAttribute("ovoList", odao.ordSelectAll());

		url = "/order/orderListAll.jsp";
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
