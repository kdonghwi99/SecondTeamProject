package talkdog.vo;

import java.io.Serializable;
import java.util.Date;

public class NoticeVO implements Serializable {
	private static final long serialVersionUID = 1L;
    private int notNo;
    private String notCategory;
    private String notTitle;
    private String notCont;
    private int notHit;
    private String notImage;
    private Date notDate;
    private int notRn;
    private String admId;

    // 생성자
    public NoticeVO() {
    }

    public NoticeVO(int notNo, String notCategory, String notTitle, String notCont, int notHit, String notImage,
			Date notDate, int notRn, String admId) {
		super();
		this.notNo = notNo;
		this.notCategory = notCategory;
		this.notTitle = notTitle;
		this.notCont = notCont;
		this.notHit = notHit;
		this.notImage = notImage;
		this.notDate = notDate;
		this.notRn = notRn;
		this.admId = admId;
	}

	// Getter 및 Setter 메서드들

    public int getNotNo() {
        return notNo;
    }

    public void setNotNo(int notNo) {
        this.notNo = notNo;
    }

    public String getNotCategory() {
        return notCategory;
    }

    public void setNotCategory(String notCategory) {
        this.notCategory = notCategory;
    }

	public String getNotTitle() {
		return notTitle;
	}

	public void setNotTitle(String notTitle) {
		this.notTitle = notTitle;
	}

	public String getNotCont() {
		return notCont;
	}

	public void setNotCont(String notCont) {
		this.notCont = notCont;
	}

	public int getNotHit() {
		return notHit;
	}

	public void setNotHit(int notHit) {
		this.notHit = notHit;
	}

	public String getNotImage() {
		return notImage;
	}

	public void setNotImage(String notImage) {
		this.notImage = notImage;
	}

	public Date getNotDate() {
		return notDate;
	}

	public void setNotDate(Date notDate) {
		this.notDate = notDate;
	}

	public int getNotRn() {
		return notRn;
	}

	public void setNotRn(int notRn) {
		this.notRn = notRn;
	}

	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}

    
}
