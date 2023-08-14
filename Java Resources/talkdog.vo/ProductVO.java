package talkdog.vo;

import java.io.Serializable;
import java.util.Date;

public class ProductVO implements Serializable {
	private static final long serialVersionUID=1L;	//객체 내부직렬화를 위한 것 (안해도 괜찮음)

	private String pName; //상품명
	private int pVol; // 상품수량
	private String pId; // 상품번호
	private String pDetail; //상품설명
	private int pPrice; //상품가격
	private String pCate; //카테고리
	private Date pDate; //등록일
	private String pMimg; // 썸네일
	private String pImg; // 상세사진
	private String pType; // 상품옵션
	private int pHit; //조회수
//	private int quantity; //장바구니에 담은 수량 -> DB엔 없어도 됨

	

//	public int getQuantity() {
//		return quantity;
//	}
//	public void setQuantity(int quantity) {
//		this.quantity = quantity;
//	}
	public int getpHit() {
		return pHit;
	}
	public void setpHit(int pHit) {
		this.pHit = pHit;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpVol() {
		return pVol;
	}
	public void setpVol(int pVol) {
		this.pVol = pVol;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getpDetail() {
		return pDetail;
	}
	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpCate() {
		return pCate;
	}
	public void setpCate(String pCate) {
		this.pCate = pCate;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	public String getpMimg() {
		return pMimg;
	}
	public void setpMimg(String pMimg) {
		this.pMimg = pMimg;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public String getpType() {
		return pType;
	}
	public void setpType(String pType) {
		this.pType = pType;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
