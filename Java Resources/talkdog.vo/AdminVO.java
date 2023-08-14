package talkdog.vo;

import java.io.Serializable;
import java.util.Date;

public class AdminVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	private Date admBirth;
	private String admName;
	private String admNick;
	private String admMail;
	private String admId;
	private String admPw;
	private String admAdd1;
	private String admAdd2;
	private String admAdd3;
	private String admPhone;
	private String admEmail;
	private String admPath;
	private boolean admType;
	private Date admRegi;
	private int admRn;

	public AdminVO() {
		
	}

	public AdminVO(Date admBirth, String admName, String admNick, String admId, String admPw, String admAdd1,
			String admAdd2, String admAdd3, String admPhone, String admEmail, String admPath, boolean admType,
			Date admRegi, int admRn, String admMail) {
		super();
		this.admBirth = admBirth;
		this.admName = admName;
		this.admNick = admNick;
		this.admId = admId;
		this.admPw = admPw;
		this.admAdd1 = admAdd1;
		this.admAdd2 = admAdd2;
		this.admAdd3 = admAdd3;
		this.admPhone = admPhone;
		this.admEmail = admEmail;
		this.admPath = admPath;
		this.admType = admType;
		this.admRegi = admRegi;
		this.admRn = admRn;
		this.admMail = admMail;
	}

	public Date getAdmBirth() {
		return admBirth;
	}

	public void setAdmBirth(Date admBirth) {
		this.admBirth = admBirth;
	}

	public String getAdmName() {
		return admName;
	}

	public void setAdmName(String admName) {
		this.admName = admName;
	}

	public String getAdmNick() {
		return admNick;
	}

	public void setAdmNick(String admNick) {
		this.admNick = admNick;
	}

	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}

	public String getAdmPw() {
		return admPw;
	}

	public void setAdmPw(String admPw) {
		this.admPw = admPw;
	}

	public String getAdmAdd1() {
		return admAdd1;
	}

	public void setAdmAdd1(String admAdd1) {
		this.admAdd1 = admAdd1;
	}

	public String getAdmAdd2() {
		return admAdd2;
	}

	public void setAdmAdd2(String admAdd2) {
		this.admAdd2 = admAdd2;
	}

	public String getAdmAdd3() {
		return admAdd3;
	}

	public void setAdmAdd3(String admAdd3) {
		this.admAdd3 = admAdd3;
	}

	public String getAdmPhone() {
		return admPhone;
	}

	public void setAdmPhone(String admPhone) {
		this.admPhone = admPhone;
	}

	public String getAdmEmail() {
		return admEmail;
	}

	public void setAdmEmail(String admEmail) {
		this.admEmail = admEmail;
	}

	public String getAdmPath() {
		return admPath;
	}

	public void setAdmPath(String admPath) {
		this.admPath = admPath;
	}

	public boolean getAdmType() {
		return admType;
	}

	public void setAdmType(boolean admType) {
		this.admType = admType;
	}

	public Date getAdmRegi() {
		return admRegi;
	}

	public void setAdmRegi(Date admRegi) {
		this.admRegi = admRegi;
	}

	public int getAdmRn() {
		return admRn;
	}

	public void setAdmRn(int admRn) {
		this.admRn = admRn;
	}

	public String getAdmMail() {
		return admMail;
	}

	public void setAdmMail(String admMail) {
		this.admMail = admMail;
	}
	
	
	
	
}