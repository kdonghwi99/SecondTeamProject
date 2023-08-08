package talkdog.vo;

import java.io.Serializable;
import java.util.Date;

public class CommReplyVO implements Serializable{
	private static final long serialVersionUID = 1L;
    private int cmreNo;
    private int cmNo;
    private String cmreCont;
    private String cmreNick;
    private Date cmreDate;
    private String admId;
    private int cmreRn;

    // 생성자
    public CommReplyVO() {
    }

    // Getter 및 Setter 메서드들

    public int getCmreNo() {
        return cmreNo;
    }

    public void setCmreNo(int cmreNo) {
        this.cmreNo = cmreNo;
    }

	public int getCmNo() {
		return cmNo;
	}

	public void setCmNo(int cmNo) {
		this.cmNo = cmNo;
	}

	public String getCmreCont() {
		return cmreCont;
	}

	public void setCmreCont(String cmreCont) {
		this.cmreCont = cmreCont;
	}

	public String getCmreNick() {
		return cmreNick;
	}

	public void setCmreNick(String cmreNick) {
		this.cmreNick = cmreNick;
	}

	public Date getCmreDate() {
		return cmreDate;
	}

	public void setCmreDate(Date cmreDate) {
		this.cmreDate = cmreDate;
	}

	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}

	public int getCmreRn() {
		return cmreRn;
	}

	public void setCmreRn(int cmreRn) {
		this.cmreRn = cmreRn;
	}
	
	

}
