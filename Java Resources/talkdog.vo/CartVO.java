package talkdog.vo;

import java.io.Serializable;

public class CartVO implements Serializable{
	private static final long serialVersionUID=1L; 
	
	private int cartNo;		//장바구니 번호 (수정, 삭제 시 사용)
	private int cartRn;		//장바구니 로우넘 (페이징, 정렬)
	private String pId;		//상품번호
	private String admId;	//장바구니에 넣은 회원아이디
	private int cartQuan;		//장바구니에 넣은 수량
	private String cartOpt;	//장바구니에 넣은 상품 옵션
	
	public CartVO() {}
	
	public CartVO(int cartNo, int cartRn, String pId, String admId, int cartQuan, String cartOpt) {
		super();
		this.cartNo = cartNo;
		this.cartRn = cartRn;
		this.pId = pId;
		this.admId = admId;
		this.cartQuan = cartQuan;
		this.cartOpt = cartOpt;
	}


	//setter, getter
	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getCartRn() {
		return cartRn;
	}

	public void setCartRn(int cartRn) {
		this.cartRn = cartRn;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}

	public int getCartQuan() {
		return cartQuan;
	}

	public void setCartQuan(int cartQuan) {
		this.cartQuan = cartQuan;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getCartOpt() {
		return cartOpt;
	}

	public void setCartOpt(String cartOpt) {
		this.cartOpt = cartOpt;
	}


	
}
