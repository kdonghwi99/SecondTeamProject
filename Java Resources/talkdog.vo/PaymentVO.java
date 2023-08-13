package talkdog.vo;

public class PaymentVO {
		private String payNo;			//결제 번호
	    private String ordNo;			//주문번호
	    private String admId;		//아이디
	    private int payTotal;		//결제금액
	    private String payAgree;	//카드 승인 번호
	    private String payDate;		//결제 날짜
	    private String payCancelDate;	//취소 날짜

	    //생성자
	    public PaymentVO() {
	    }
//		public PaymentVO(int payNo, String ordNo, String admId, int payTotal, String payAgree, String payDate,
//				String payCancleDate) {
//			this.payNo = payNo;
//			this.ordNo = ordNo;
//			this.admId = admId;
//			this.payTotal = payTotal;
//			this.payAgree = payAgree;
//			this.payDate = payDate;
//			this.payCancelDate = payCancleDate;
//		}

		//setter, getter
		public String getPayNo() {
			return payNo;
		}
		public void setPayNo(String payNo) {
			this.payNo = payNo;
		}
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
		public int getPayTotal() {
			return payTotal;
		}
		public void setPayTotal(int payTotal) {
			this.payTotal = payTotal;
		}
		public String getPayAgree() {
			return payAgree;
		}
		public void setPayAgree(String payAgree) {
			this.payAgree = payAgree;
		}
		public String getPayDate() {
			return payDate;
		}
		public void setPayDate(String payDate) {
			this.payDate = payDate;
		}
		public String getPayCancleDate() {
			return payCancelDate;
		}
		public void setPayCancleDate(String payCancleDate) {
			this.payCancelDate = payCancleDate;
		}
	    
}
