package talkdog.vo;

import java.io.Serializable;
import java.util.Date;

public class ReviewVO implements Serializable{

	private static final long serialVersionUID=1L;	//객체 내부직렬화를 위한 것 (안해도 괜찮음)

	private int rNo; //리뷰번호
	private String admId; //회원 아이디
	private String review; //리뷰내용
	private Date rDate; //리뷰날짜
	private String pId; //상품번호
	
	
	
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public String getAdmId() {
		return admId;
	}
	public void setAdmId(String admId) {
		this.admId = admId;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
