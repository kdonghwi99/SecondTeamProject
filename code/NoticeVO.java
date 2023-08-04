package talkdogg.vo;

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

    // 생성자
    public NoticeVO() {
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

}

