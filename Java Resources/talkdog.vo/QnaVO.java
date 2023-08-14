package talkdog.vo;

import java.io.Serializable;
import java.util.Date;

public class QnaVO implements Serializable{
	 private static final long serialVersionUID=1L;   //객체 내부직렬화를 위한 것 (안해도 괜찮음)
	
	private int qnaNo;				//문의글 번호(시퀀스) 			//시퀀스
	private int qnaRn;				//페이지 정렬할 때 사용할 것	//로우넘
	private String admId;			//작성자 id						//입력받
	private Date qnaDate;			//작성일							//sysdate
	private String qnaAnswer;		//답변현황						//기본값 "답변대기"
	private String qnaCategory;	//카테고리						//입력받	
	private String qnaSecCategory;		//하위 카테고리			//입력받
	private String qnaTitle;			//제목								//입력받
	private String qnaContent;	//내용								//입력받
	private String qnaReply;		//댓글내용						//입력받
	private Date qnaReplyDate;	//댓글작성날짜					//sysdate
	
	
	public QnaVO() {}
	
	public QnaVO(int qnaNo, int qnaRn, String admId, Date qnaDate, String qnaAnswer, String qnaCategory,
			String qnaSecCategory, String qnaTitle, String qnaContent, String qnaReply, Date qnaReplyDate) {
		super();
		this.qnaNo = qnaNo;
		this.qnaRn = qnaRn;
		this.admId = admId;
		this.qnaDate = qnaDate;
		this.qnaAnswer = qnaAnswer;
		this.qnaCategory = qnaCategory;
		this.qnaSecCategory = qnaSecCategory;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaReply = qnaReply;
		this.qnaReplyDate = qnaReplyDate;
	}
	
	//setter, getter 메서드

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getQnaRn() {
		return qnaRn;
	}

	public void setQnaRn(int qnaRn) {
		this.qnaRn = qnaRn;
	}

	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getQnaAnswer() {
		return qnaAnswer;
	}

	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}

	public String getQnaCategory() {
		return qnaCategory;
	}

	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}

	public String getQnaSecCategory() {
		return qnaSecCategory;
	}

	public void setQnaSecCategory(String qnaSecCategory) {
		this.qnaSecCategory = qnaSecCategory;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaReply() {
		return qnaReply;
	}

	public void setQnaReply(String qnaReply) {
		this.qnaReply = qnaReply;
	}

	public Date getQnaReplyDate() {
		return qnaReplyDate;
	}

	public void setQnaReplyDate(Date qnaReplyDate) {
		this.qnaReplyDate = qnaReplyDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
	
	



}
