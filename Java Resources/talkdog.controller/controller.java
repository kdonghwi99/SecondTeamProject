package talkdog.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import talkdog.dao.ProductDAO;
import talkdog.dao.ReviewDAO;
import talkdog.dao.TestDAO;
import talkdog.vo.ReviewVO;


@WebServlet("*.do")
public class controller extends HttpServlet {
   private static final double AMOUNT_PER_PAGE = 9.0;   
   private static final double NUM_PER_PAGE = 5.0;      

   private static final long serialVersionUID = 1L;

   
   private HttpSession session;
   private ProductDAO pdao;
   private ReviewDAO rdao;
   private TestDAO tdao;
   private String url;

   

   public void init(ServletConfig config) throws ServletException {
	   ServletContext servletCtx = config.getServletContext();
		Connection con = (Connection) servletCtx.getAttribute("con");
		pdao = new ProductDAO(con);
        rdao = new ReviewDAO(con);;

   }
  

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    doPost(request, response);
	}


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String cmd = request.getRequestURI()
	            .substring(request.getContextPath()
	                              .length());
	    session = request.getSession();
		
	    // cmd에 따라 각 해당 메서드 호출
	    if(cmd.equals("/Productlist.do"))     { list(request);            }
	    else if (cmd.equals("/ReviewUpdate.do")) {
	        reviewUpdate(request, response);
	        return;
	    }
	    else if (cmd.equals("/ReviewDelete.do")) {
	        reviewDelete(request);
	        response.sendRedirect(url);
	        return;
	    }
	    
	    RequestDispatcher rdp = request.getRequestDispatcher(url);
        rdp.forward(request, response);
}

	//게시판 목록 조회		
	public void list(HttpServletRequest request) {
	    
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		 
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int totalCnt = pdao.totalCount(type, keyword);//////
		int pages = (int)(Math.ceil(totalCnt/AMOUNT_PER_PAGE)); 
		
		//각 페이지의 시작 번호 | ... | 끝 번호
		int end 	= (int)(Math.ceil(pageNum/NUM_PER_PAGE) * NUM_PER_PAGE); 
		int start 	= end - (int)(NUM_PER_PAGE - 1);
		    end  	= end >= pages ? pages : end; 
		    
		//이전 | 이후 버튼 활성화 여부
		boolean prev = start > 1;
		boolean next = end < pages;
		    
		request.setAttribute("productlist", pdao.selectAll());
		request.setAttribute("totalCnt", totalCnt); //  
		request.setAttribute("pageNum", pageNum); 
		request.setAttribute("pages", pages); 
		request.setAttribute("end", end); 
		request.setAttribute("start", start); 
		request.setAttribute("prev", prev); 
		request.setAttribute("next", next); 
		
		request.setAttribute("type", type); 
		request.setAttribute("keyword", keyword); 
		
		url = "/product/productlist.jsp";
	}
	
	private void remove(HttpServletRequest request) {
        // 제거 작업을 수행하기 위한 로직을 구현하세요
    }

    private void modify(HttpServletRequest request) {
        // 수정 작업을 수행하기 위한 로직을 구현하세요
    }
   
      public void write(HttpServletRequest request) {
      }
      
      public void view(HttpServletRequest request) {
      }
      
      private void update(HttpServletRequest request) {
         
      }
      
      private void delete(HttpServletRequest request) {
      
      }

   // 상품 등록
    public void productEnroll(HttpServletRequest request) {
    }

    // 상품 수정
    public void productUpdate(HttpServletRequest request) {
    }

    // 상품 삭제
    public void productDelete(HttpServletRequest request) {

    }

    // 상품 상세 조회
    public void productSelect(HttpServletRequest request) {
  
    }
    

    // 상품 리뷰 등록
    public void reviewEnroll(HttpServletRequest request) {

    }

    // 상품 리뷰 목록 상품별로 조회
    public void reviewSelect(HttpServletRequest request) {
       
    }

    // 상품 리뷰 목록 회원별로 조회
    public void memberreview(HttpServletRequest request) {
       
    }
    
    private void reviewUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int rNo = Integer.parseInt(request.getParameter("rNo"));
        String admId = request.getParameter("admId");
        String review = request.getParameter("review");
        String pId = request.getParameter("pId");

        ReviewVO rvo = new ReviewVO();
        rvo.setrNo(rNo);
        rvo.setAdmId(admId);
        rvo.setReview(review);
        rvo.setpId(pId);

        rdao.reviewUpdate(rvo);
        
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('리뷰가 수정되었습니다.');");
        out.println("opener.window.location.reload();");
        out.println("window.close();");
        out.println("</script>");
        
    }

    private void reviewDelete(HttpServletRequest request) {
        int rNo = Integer.parseInt(request.getParameter("rNo"));
        rdao.reviewDelete(rNo);

        String pid = request.getParameter("pId");
        url = "talkdog/product/productInfo.jsp?pid=" + pid;
    }
   
        // 자가진단 항목 추가
    public void testEnroll(HttpServletRequest request) {

    }

      // 자가진단결과 추가
    public void testresultEnroll(HttpServletRequest request) {

    }


    // 자가진단 항목 개별 수정
    public void testUpdate(HttpServletRequest request) {

    }

    // 자가진단 항목 개별 삭제
    public void testDelete(HttpServletRequest request) {
 
    }

    // 자가진단 항목 조회
    public void testSelect(HttpServletRequest request) {
    
    }

   // 자가진단 결과내용 조회
    public void testResultSelect(HttpServletRequest request) {

    }

    // 자가진단 상세보기
    public void testSelectDetail(HttpServletRequest request) {

    }
   

    // 자가진단 결과 초기화
    public void resultDelete(HttpServletRequest request) {

    }



}