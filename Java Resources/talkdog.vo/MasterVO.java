package talkdog.vo;

import java.io.Serializable;
import java.util.Date;

public class MasterVO implements Serializable {
	private static final long serialVersionUID = 1L; //정렬화 

	private String masProf;
	private String maspaper; //자격/학력 (문서)
	private String masSveri; //자격증 (문서)
	private String masIntro; //자기소개
	private String masSchool; //학력(작성용)
	private String masCert; //자격증(작성용)
	private String masAddr; //의원 주소
	private String masAuth; //경력
	private Date masRegi; //신청일자
	private String admId; //비교 아이디
	private boolean masConfirm; //확인
	private int masRn; //로우넘버
	
	private AdminVO avo;
	
	public MasterVO() {
	}

	public MasterVO(String masProf, String maspaper, String masSveri, String masIntro, String masSchool, String masCert,
			String masAddr, String masAuth, Date masRegi, String admId, boolean masConfirm, int masRn, AdminVO avo) {
		super();
		this.masProf = masProf;
		this.maspaper = maspaper;
		this.masSveri = masSveri;
		this.masIntro = masIntro;
		this.masSchool = masSchool;
		this.masCert = masCert;
		this.masAddr = masAddr;
		this.masAuth = masAuth;
		this.masRegi = masRegi;
		this.admId = admId;
		this.masConfirm = masConfirm;
		this.masRn = masRn;
		this.avo = avo;
	}

	
	public String getMasProf() {
		return masProf;
	}

	public void setMasProf(String masProf) {
		this.masProf = masProf;
	}

	public String getMaspaper() {
		return maspaper;
	}

	public void setMaspaper(String maspaper) {
		this.maspaper = maspaper;
	}

	public String getMasSveri() {
		return masSveri;
	}

	public void setMasSveri(String masSveri) {
		this.masSveri = masSveri;
	}

	public String getMasIntro() {
		return masIntro;
	}

	public void setMasIntro(String masIntro) {
		this.masIntro = masIntro;
	}

	public String getMasSchool() {
		return masSchool;
	}

	public void setMasSchool(String masSchool) {
		this.masSchool = masSchool;
	}

	public String getMasAddr() {
		return masAddr;
	}

	public void setMasAddr(String masAddr) {
		this.masAddr = masAddr;
	}

	public String getMasAuth() {
		return masAuth;
	}

	public void setMasAuth(String masAuth) {
		this.masAuth = masAuth;
	}

	public Date getMasRegi() {
		return masRegi;
	}

	public void setMasRegi(Date masRegi) {
		this.masRegi = masRegi;
	}

	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}

	public int getMasRn() {
		return masRn;
	}

	public void setMasRn(int masRn) {
		this.masRn = masRn;
	}

	public boolean getMasConfirm() {
		return masConfirm;
	}

	public void setMasConfirm(boolean masConfirm) {
		this.masConfirm = masConfirm;
	}

	public String getMasCert() {
		return masCert;
	}

	public void setMasCert(String masCert) {
		this.masCert = masCert;
	}

	public AdminVO getAvo() {
		return avo;
	}

	public void setAvo(AdminVO avo) {
		this.avo = avo;
	}
	
	
	
}
