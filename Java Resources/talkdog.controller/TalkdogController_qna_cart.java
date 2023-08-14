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

import talkdog.dao.CartDAO;
import talkdog.dao.QnaDAO;
import talkdog.vo.CartVO;
import talkdog.vo.ProductVO;
import talkdog.vo.QnaVO;

@WebServlet({"/Qna/*", "/Cart/*"})
public class TalkdogController_qna_cart extends HttpServlet {
	
   private static final long serialVersionUID = 1L;
   private static final double AMOUNT_PER_PAGE = 10.0;   	//페이지당 게시글 갯수를 상수로 설정해놈
   private static final double NUM_PER_PAGE = 5.0;      		//하단에 1 2 3 4 5 페이지 뜨게 함
   private HttpSession session;		//로그인한 사람만 게시글을 쓰게 하려면 세션이 필요한데, 서블릿은 세션이 내장객체가 아니라서 필요함
   private String url;
   private CartDAO cdao;
   private QnaDAO qdao;
   

   public void init(ServletConfig config) throws ServletException {
	   ServletContext servletCtx = config.getServletContext();
		//DBCPInitListener(커넥션관련 리스너)에서 setAttribute한 걸 getAttribute하는 과정이래
		Connection con = (Connection)servletCtx.getAttribute("con");
		
		cdao = new CartDAO(con);
		qdao = new QnaDAO(con);
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);		//get,post 방식 모두 다 doPost()로 보내서 처리할 것
   }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length());		//cmd에 /어쩌구.do만 담길 것임
		
		session = request.getSession();
		
		//cmd에 따라 각 해당 메서드 호출  (switch 사용해도 됨)
		if(cmd.equals("/Qna/list.do")){ qnaSelectAll(request);	 }								//문의글 전체 조회
		else if(cmd.equals("/Qna/listMine.do")){ qnaSelectMine(request); }				//나의 문의글 조회 
		else if(cmd.equals("/Qna/listWaiting.do")){ qnaSelectWating(request); }		//답변대기 문의글 조회
		else if(cmd.equals("/Qna/View.do")){ qnaSelectOne(request); }					//문의글 상세조회
		else if(cmd.equals("/Qna/WriteForm.do")){ url="/qna/qnaInsert.jsp"; }		//문의글 등록폼 
		else if(cmd.equals("/Qna/Write.do")){ qnaInsert(request); 							//문의글 등록
																response.sendRedirect(url);	//리다이렉트
																return;	}								//redirect 후 함수 탈출
		else if(cmd.equals("/Qna/ModifyForm.do")){  qnaModifyForm(request); 	}	//문의글 수정폼
		else if(cmd.equals("/Qna/Modify.do")){  qnaUpdate(request); 						//문의글 수정
																	response.sendRedirect(url);
																	return;	 }
		else if(cmd.equals("/Qna/Remove.do")){ qnaRemove(request);					//문의글 삭제
																	response.sendRedirect(url);
																	return;}
		else if(cmd.equals("/Qna/ReplyUpdate.do")){  replyUpdate(request); 			//문의글댓글 등록, 수정, 삭제
																			response.sendRedirect(url);
																			return;	 }
		
		else if(cmd.equals("/Cart/CartList.do")){ cartSelectAll(request);	 }				//장바구니 전체 조회
		else if(cmd.equals("/Cart/CartAdd.do")){ cartInsert(request); 						//장바구니에 추가
																	response.sendRedirect(url);	//리다이렉트
																	return;	}								//redirect 후 함수 탈출
		else if(cmd.equals("/Cart/CartRemove.do")){ cartRemove(request);				//장바구니 개별삭제
															response.sendRedirect(url);
															return;}	
		else if(cmd.equals("/Cart/CartAllRemove.do")){ cartRemoveAll(request);		//장바구니 전체삭제(장바구니 비우기)
															response.sendRedirect(url);
															return;}	
		else if(cmd.equals("/Cart/CartUpdate.do")){ cartUpdate(request);				//장바구니 수정
															response.sendRedirect(url);
															return;}	
			
		RequestDispatcher rdp = request.getRequestDispatcher(url);			
		rdp.forward(request, response);
	}

	
	//문의글 전체 조회
	public void qnaSelectAll(HttpServletRequest request) {
		
//		try {
//			request.setCharacterEncoding("UTF-8");			//post로 보낸 거 한글안깨지게 처리
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	//pageNum(현재 페이지숫자)
		String category = request.getParameter("category");
		
		System.out.println("pageNum, category : " + pageNum + ", " + category );
		
		int qnaCnt = qdao.qnaCount(category);					//totalCount(전체 게시물 수) 
//		System.out.println("현재 문의글 건수: " + qnaCnt);
		int pages = (int)(Math.ceil(qnaCnt / AMOUNT_PER_PAGE));				//pages(총 페이지 수) : 올림 -> 전체 게시물 개수 /페이지당 표시할 게시물 개수
		
		//각 페이지의 시작 번호 | . . . | 끝 번호
		int end = (int)(Math.ceil(pageNum / NUM_PER_PAGE) * NUM_PER_PAGE );		//double형이니까 형변환
		int start =(end -  ((int)NUM_PER_PAGE -1));
			 end = end >= pages ? pages : end;																
		
		//이전 | 이후 버튼 활성화 여부
		boolean prev = start > 1;				//페이지버튼이 1보다 클 경우 [이전]버튼 활성화
		boolean next = end < pages;			//페이지버튼이 총 페이지 수(마지막 페이지)보다 작으면 [다음]버튼 활성화
			 
		System.out.println("pageNum : " + pageNum);
		request.setAttribute("qvoList", qdao.qnaSelectAll(AMOUNT_PER_PAGE, pageNum, category));  		//qnaSelectAll() 반환값을 요청객체의 qvoList속성에 저장
		request.setAttribute("qnaCnt", qnaCnt);  															//qnaCount() 반환값을 요청객체의 qnaCnt 속성에 저장
		
		//페이지 관련내용 요청객체에 담기
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pages", pages);
		request.setAttribute("end", end);
		request.setAttribute("start", start);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);
		request.setAttribute("category", category);	//검색 후 목록으로 돌아갔을 때도 카테고리 값을 남아있게 하기 위함
		
		url = "/qna/qnaListAll.jsp";		//71번 라인에서 포워딩할 url (넘어갈 페이지)
		
	}//END qnaSelectAll()
	

	 //나의 문의글 조회 
	public void qnaSelectMine(HttpServletRequest request) {
		// http://localhost:8090/talkdog/Qna/listMine.do?category=&pageNum=1 우선 이걸로 접속
		
		//세션에 담아둔 sid
		HttpSession session = request.getSession();
	    String sid = (String) session.getAttribute("sid");

		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	//pageNum(현재 페이지숫자)
		String category = request.getParameter("category");
	
		int qnaCnt = qdao.qnaMCount(category, sid);					//(전체 게시물 수) 
		int pages = (int)(Math.ceil(qnaCnt / AMOUNT_PER_PAGE));				//pages(총 페이지 수) : 올림 -> 전체 게시물 개수 /페이지당 표시할 게시물 개수
		//각 페이지의 시작 번호 | . . . | 끝 번호
		int end = (int)(Math.ceil(pageNum / NUM_PER_PAGE) * NUM_PER_PAGE );		//double형이니까 형변환
		int start =(end -  ((int)NUM_PER_PAGE -1));
			 end = end >= pages ? pages : end;				
		
		//이전 | 이후 버튼 활성화 여부
		boolean prev = start > 1;				//페이지버튼이 1보다 클 경우 [이전]버튼 활성화
		boolean next = end < pages;			//페이지버튼이 총 페이지 수(마지막 페이지)보다 작으면 [다음]버튼 활성화
		
		request.setAttribute("qvoList", qdao.qnaSelectMine(sid, AMOUNT_PER_PAGE, pageNum, category));  		//qnaSelectAll() 반환값을 요청객체의 qvoList속성에 저장
		request.setAttribute("qnaCnt", qnaCnt);  															//qnaCount() 반환값을 요청객체의 qnaCnt 속성에 저장
		
		//페이지 관련내용 요청객체에 담기
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pages", pages);
		request.setAttribute("end", end);
		request.setAttribute("start", start);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);
		request.setAttribute("category", category);	//검색 후 목록으로 돌아갔을 때도 카테고리 값을 남아있게 하기 위함
		
		url = "/qna/qnaMine.jsp";	
	}
	
    
	//답변대기 문의글 조회
	//관리자가 이용자관리 탭을 통해 접속하는데, category 가져와야 함
	public void qnaSelectWating(HttpServletRequest request) {
		//http://localhost:8090/talkdog/Qna/listWaiting.do?pageNum=1&category= 우선 이걸로 접속
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	//pageNum(현재 페이지숫자)
		String category = request.getParameter("category");
		
		int qnaCnt = qdao.qnaWCount(category);					//totalCount(전체 게시물 수) 
//		System.out.println("현재 문의글 건수: " + qnaCnt);
		int pages = (int)(Math.ceil(qnaCnt / AMOUNT_PER_PAGE));				//pages(총 페이지 수) : 올림 -> 전체 게시물 개수 /페이지당 표시할 게시물 개수
		
		//각 페이지의 시작 번호 | . . . | 끝 번호
		int end = (int)(Math.ceil(pageNum / NUM_PER_PAGE) * NUM_PER_PAGE );		//double형이니까 형변환
		int start =(end -  ((int)NUM_PER_PAGE -1));
			 end = end >= pages ? pages : end;																
		
		//이전 | 이후 버튼 활성화 여부
		boolean prev = start > 1;				//페이지버튼이 1보다 클 경우 [이전]버튼 활성화
		boolean next = end < pages;			//페이지버튼이 총 페이지 수(마지막 페이지)보다 작으면 [다음]버튼 활성화
			 
		request.setAttribute("qvoList", qdao.qnaSelectWating(AMOUNT_PER_PAGE, pageNum, category));  		//qnaSelectAll() 반환값을 요청객체의 qvoList속성에 저장
		request.setAttribute("qnaCnt", qnaCnt);  																							//qnaCount() 반환값을 요청객체의 qnaCnt 속성에 저장
		
		//페이지 관련내용 요청객체에 담기
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pages", pages);
		request.setAttribute("end", end);
		request.setAttribute("start", start);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);
		request.setAttribute("category", category);	//검색 후 목록으로 돌아갔을 때도 카테고리 값을 남아있게 하기 위함
		
		url = "/qna/qnaWating.jsp";	
	}

	 //문의글 상세조회
	public void qnaSelectOne(HttpServletRequest request) {
		
		//qnaListAll.jsp에서 제목 클릭 시 함께 담긴 파라미터들 꺼내기
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		String category = request.getParameter("category");
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		
		request.setAttribute("qvo", qdao.qnaSelectOne(qnaNo));		//조회하려는 qvo 담아오기
		request.setAttribute("pageNum", pageNum);	//상세조회 페이지에서 '목록' 클릭 시 pageNum, category 필요
		request.setAttribute("category", category);
//		request.setAttribute("qnaNo", qnaNo);		//상세조회하는 페이지에서 qnaNo를 가지고 있어야 수정,삭제 가능
		
		url = "/qna/qnaNreply.jsp";
	}

	//문의글 등록
	public void qnaInsert(HttpServletRequest request) {
		
		//등록폼에서 넘어온 요소들을 vo에 담고
		QnaVO qvo = new QnaVO();				
		qvo.setAdmId(request.getParameter("admId"));
		qvo.setQnaCategory(request.getParameter("qnaCategory"));
		qvo.setQnaSecCategory(request.getParameter("qnaSecCategory"));
		qvo.setQnaTitle(request.getParameter("qnaTitle"));
		qvo.setQnaContent(request.getParameter("qnaContent"));
		
		if(qdao.qnaInsert(qvo)) {	
			 session.setAttribute("msg", "문의글을 등록하였습니다.");
		}else {
			session.setAttribute("msg", "문의글 등록에 실패하였습니다.");
		}
				
		url = "./list.do?pageNum=1&category=";		//등록 후 1페이지로 이동
		
	}//END qnaInsert()
	
	
	
	//문의글 수정폼
	//상세보기에서 가져온 qnaNo를 사용해서 DB의 VO하나 꺼내오기
	public void qnaModifyForm(HttpServletRequest request) {
		
		String category = request.getParameter("category");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		
		QnaVO qvo = qdao.qnaSelectOne(qnaNo);
		request.setAttribute("qvo", qvo);
		request.setAttribute("category", category);
		request.setAttribute("pageNum", pageNum);
		
		System.out.println("qvo가 잘 담겼는지 확인 : " + qvo.getQnaTitle());
	
		url = "/qna/qnaModify.jsp";
	}
	
	
	//문의글 수정
	//jsp파일에서 hidden에 qnaNo를 포함해야 함
	public void qnaUpdate(HttpServletRequest request) {
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		String category = request.getParameter("category");
		if(category.equals("undefined")) {
			category="";
		}
		
		//카테고리, 하위카테고리, 제목, 내용을 수정할 수 있음
		//vo에 담고
		QnaVO qvo = qdao.qnaSelectOne(qnaNo);
		qvo.setQnaCategory(request.getParameter("qnaCategory"));
		qvo.setQnaSecCategory(request.getParameter("qnaSecCategory"));
		qvo.setQnaTitle(request.getParameter("qnaTitle"));
		qvo.setQnaContent(request.getParameter("qnaContent"));
		
		if(qdao.qnaUpdate(qvo)) {		//dao에서 잘 넘어가면 
			 session.setAttribute("msg", "문의글이 수정되었습니다.");
		}else {
			session.setAttribute("msg", "수정에 실패하였습니다.");
		}
		
		
//        request.setAttribute("category", category);
        
		url = "./View.do?qnaNo="+qnaNo+"&pageNum=1&category="+ category;
								
	}
	
	//문의글 삭제
	public void qnaRemove(HttpServletRequest request) {

		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));	
//		일단 삭제로직 짜야해서 category는 잠깐 보류
		String category = request.getParameter("category");
		
		System.out.println("pageNum이 null인지 체크 -> " + request.getParameter("pageNum") + "category는 : " + category);
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		
		
		if(qdao.qnaRemove(qnaNo)) {		
			 session.setAttribute("msg", "문의글을 삭제했습니다.");
		}else {
			session.setAttribute("msg", "문의글 삭제에 실패하였습니다.");
		}
		
//		url = "./list.do?pageNum=1&category="+category;
		url = "./list.do?pageNum="+pageNum + "&category=" + category;
	}
	
	
	//댓글 업데이트 (등록, 수정, 삭제)
	public void replyUpdate(HttpServletRequest request) {
			
			int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
			String qnaReply = request.getParameter("qnaReply");
			String category = request.getParameter("category");
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			
			
			if(qnaReply.equals("")) {		//qnaReply로 빈 값이 넘어왔을 경우
				if(qdao.replyUpdate(qnaNo, qnaReply)) {		
					 session.setAttribute("msg", "댓글이 삭제되었습니다.");
				}else {
					session.setAttribute("msg", "댓글삭제에 실패하였습니다.");
				}
			}else {
				if(qdao.replyUpdate(qnaNo, qnaReply)) {		//dao에서 잘 넘어가면 
					 session.setAttribute("msg", "처리되었습니다.");
				}else {
					session.setAttribute("msg", "처리에 실패하였습니다.");
				}
			}
			
			url = "./View.do?qnaNo="+qnaNo+"&pageNum="+pageNum+"&category="+ category;
		}

	
	//장바구니 전체 조회
	public void cartSelectAll(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String sid = (String) session.getAttribute("sid");
		
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
		    
		    url = "/cart/cart.jsp";
	}
	
	//장바구니에 추가
	public void cartInsert(HttpServletRequest request) {
		//상품상세페이지에서 장바구니에 추가 누르면 (pId, 수량, 옵션) 넘어온다고 가정하고 작성
		
		//세션에 담아둔 sid
		HttpSession session = request.getSession();
		
		String sid = (String) session.getAttribute("sid");
		String pId = request.getParameter("pId");
		int cartQuan = Integer.parseInt(request.getParameter("cartQuan"));
		String cartOpt = request.getParameter("cartOpt");
		
		boolean check = false;		//장바구니 목록에 pId가 있었는지 없었는지 체크해줄 flag변수
		
		List<CartVO> cartList = null;
		cartList = cdao.cartSelectAll(sid);		//현재 로그인한 사람의 장바구니목록
		
		for(CartVO cvo : cartList) {					//현재 로그인한 사람의 장바구니 목록에 해당 pId가 있는 경우
			if(cvo.getpId().equals(pId) && cvo.getCartOpt().equals(cartOpt)) {			
				cvo.setCartQuan(cvo.getCartQuan() +1);
				check = true;		//장바구니 목록에서 pId를 찾았다면
				break;					//for문 탈출
			}
		}
		if(check==false) {										//현재 로그인한 사람의 장바구니 목록에 해당 pId가 없는 경우
			if(cdao.cartInsert(sid, pId, cartQuan, cartOpt)) {
				session.setAttribute("msg", "상품을 장바구니에 추가했습니다.");
			}else {
				session.setAttribute("msg", "장바구니 담기에 실패했습니다.");
			}
		}
		//url = 해당 상품의 상세페이지목록으로 새로고침해야 함
	}
	
	
	//장바구니 개별삭제 (개별상품 삭제)
	public void cartRemove(HttpServletRequest request) {
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));		//특정 장바구니 삭제를 위해 필요
		String sid = request.getParameter("sid");										//삭제 후 장바구니 조회를 위해 필요
		
		if(cdao.cartRemove(cartNo)==false) {
			session.setAttribute("msg", "삭제에 실패했습니다.");
		};
		url = "./CartList.do?sid=" + sid;
	}
	
	
	//장바구니 전체삭제 (특정회원의 장바구니 전체삭제)
	public void cartRemoveAll(HttpServletRequest request) {
		String sid = request.getParameter("sid");
		
		if(cdao.cartRemoveAll(sid) == true ) {
			session.setAttribute("msg", "장바구니를 초기화하였습니다.");
			
		}else{
			session.setAttribute("msg", "장바구니 초기화 실패");
		};
		url = "./CartList.do?sid=" + sid;
	}
	
	
	//장바구니 수정
	public void cartUpdate(HttpServletRequest request) {
		
		//세션에 담아둔 sid
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("sid");
		
		//장바구니에 담은 수량 수정
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		int newQuan = Integer.parseInt(request.getParameter("newQuan"));
		
		boolean cartUpdate = cdao.cartUpdate(newQuan, cartNo);
		if(!cartUpdate) {
			session.setAttribute("msg", "수량 변경 실패");
		}
		
		url = "./CartList.do?sid="+sid;
	}

	
	
      

}
