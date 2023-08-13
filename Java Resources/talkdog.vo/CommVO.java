package talkdog.vo;

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
    private int catNo;
    private String category;
    private Date cmDate;
    private int cmRn;
    private String admId;
    
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

	public String getCmCont() {
		return cmCont;
	}

	public void setCmCont(String cmCont) {
		this.cmCont = cmCont;
	}

	public String getCmNick() {
		return cmNick;
	}

	public void setCmNick(String cmNick) {
		this.cmNick = cmNick;
	}

	public int getCmHeart() {
		return cmHeart;
	}

	public void setCmHeart(int cmHeart) {
		this.cmHeart = cmHeart;
	}

	public int getCmHit() {
		return cmHit;
	}

	public void setCmHit(int cmHit) {
		this.cmHit = cmHit;
	}

	public int getCatNo() {
		return catNo;
	}

	public void setCatNo(int catNo) {
		this.catNo = catNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getCmDate() {
		return cmDate;
	}

	public void setCmDate(Date cmDate) {
		this.cmDate = cmDate;
	}

	public int getCmRn() {
		return cmRn;
	}

	public void setCmRn(int cmRn) {
		this.cmRn = cmRn;
	}

	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}

}
