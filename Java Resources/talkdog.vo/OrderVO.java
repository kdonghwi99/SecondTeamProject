package talkdog.vo;

import java.util.Date;

public class OrderVO {
    private String ordNo;			//주문번호
    private String admId;		//아이디
    private int cartNo;			//장바구니 번호
    private Date ordDate;		//주문 날짜
    private String ordIng;		//주문 처리현황
    private int invoiceNo;		//송장번호

    //생성자
	public OrderVO() {
	}
	
	//setter, getter
	public String getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}
	public String getAdmId() {
		return admId;
	}
	public void setAdmId(String admId) {
		this.admId = admId;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public Date getOrdDate() {
		return ordDate;
	}
	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}
	public String getOrdIng() {
		return ordIng;
	}
	public void setOrdIng(String ordIng) {
		this.ordIng = ordIng;
	}

	public int getInvoiceNo() {
		return invoiceNo;
	}

	public void setInvoiceNo(int invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
    
}
