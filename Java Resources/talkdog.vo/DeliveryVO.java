package talkdog.vo;

public class DeliveryVO {
    private int delNo;			//배송 내역 번호
    private String ordNo;			//주문번호
    private String delName;		//수령인
    private String delAddress1;	//우편번호
    private String delAddress2;	//도로명 주소
    private String delAddress3; //상세주소
    private String delPhone;	//연락처
    private String delMemo;		//배송 메모
    
    //생성자
	public DeliveryVO() {
	}
	
	//setter, getter 메서드
	public int getDelNo() {
		return delNo;
	}

	public void setDelNo(int delNo) {
		this.delNo = delNo;
	}

	public String getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}

	public String getDelName() {
		return delName;
	}

	public void setDelName(String delName) {
		this.delName = delName;
	}

	public String getDelAddress1() {
		return delAddress1;
	}

	public void setDelAddress1(String delAddress1) {
		this.delAddress1 = delAddress1;
	}

	public String getDelAddress2() {
		return delAddress2;
	}

	public void setDelAddress2(String delAddress2) {
		this.delAddress2 = delAddress2;
	}

	public String getDelAddress3() {
		return delAddress3;
	}

	public void setDelAddress3(String delAddress3) {
		this.delAddress3 = delAddress3;
	}

	public String getDelPhone() {
		return delPhone;
	}

	public void setDelPhone(String delPhone) {
		this.delPhone = delPhone;
	}

	public String getDelMemo() {
		return delMemo;
	}

	public void setDelMemo(String delMemo) {
		this.delMemo = delMemo;
	}
    
	
	
}
    

