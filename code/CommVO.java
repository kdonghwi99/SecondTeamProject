package talkdogg.vo;

import java.io.Serializable;
import java.util.Date;

public class CommVO implements Serializable{
	private static final long serialVersionUID = 1L;
    private int cmNo;
    private String cmTitle;
    private String cmCont;
    private String cmNick;
    private int cmHeart;
    private int cmHit;
    private int cmReply;
    private int catNo;
    private String category;
    private Date cmDate;
    private int cmRn;
    
    // 생성자
    public CommVO() {
    }

    // Getter 및 Setter 메서드들

    public int getCmNo() {
        return cmNo;
    }

    public void setCmNo(int cmNo) {
        this.cmNo = cmNo;
    }

    public String getCmTitle() {
        return cmTitle;
    }

    public void setCmTitle(String cmTitle) {
        this.cmTitle = cmTitle;
    }

}


