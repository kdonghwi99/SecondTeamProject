package talkdogg.vo;

import java.io.Serializable;
import java.util.Date;

public class CommReplyVO implements Serializable{
	private static final long serialVersionUID = 1L;
    private int cmreNo;
    private int cmNo;
    private String cmreCont;
    private String cmreNick;
    private Date cmreDate;

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

}

