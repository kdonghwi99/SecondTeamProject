package talkdog.controller;

import java.io.IOException;

import talkdog.dao.AdminDAO;
import talkdog.dao.CartDAO;
import talkdog.dao.CommDAO;
import talkdog.dao.CommReplyDAO;
import talkdog.dao.DeliveryDAO;
import talkdog.dao.MasterDAO;
import talkdog.dao.NoticeDAO;
import talkdog.dao.OrderDAO;
import talkdog.dao.PaymentDAO;
import talkdog.dao.ProductDAO;
import talkdog.dao.QnaDAO;
import talkdog.dao.ReviewDAO;
import talkdog.dao.TestDAO;


@WebServlet("*.do")
public class CommController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final double AMOUNT_PER_PAGE = 5.0;	
	private static final double NUM_PER_PAGE = 5.0;		
	private HttpSession session;
	private String url;
	private CommReplyDAO crdao;
	private CommDAO cmdao;
	private NoticeDAO ndao;
	

	public void init(ServletConfig config) throws ServletException {
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	}
	public void noticeList(HttpServletRequest request) {
	}
	public void noticeView(HttpServletRequest request) {
	}
	public void noticeUpdate(HttpServletRequest request) {
	}
	public void noticeDelete(HttpServletRequest request) {
	}	
		
}
