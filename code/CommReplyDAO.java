package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import talkdogg.vo.CommReplyVO;

public class CommReplyDAO {
	private Connection con;
    
    public CommReplyDAO(Connection con) {	// setter/getter 말고 생성자로
		this.con = con;
	}
    private String query; // 멤버 변수 지정
	private PreparedStatement pstmt;
	private ResultSet rs;
	private CommReplyVO crvo;
	
    // 커뮤니티 댓글 등록
    public boolean cmreInsert(CommReplyVO crvo) {
        
        return true; // 등록 성공 시 true 반환
    }

    // 커뮤니티 댓글 전체 목록 조회 + 페이징
    public List<CommReplyVO> cmreSelectAll(double start, int count, int cmNo) {
       
        return null;
    }
    
    // 커뮤니티 내 댓글 개별 목록 조회 
    public List<CommReplyVO> cmreSelect(double start, int count, String cmreNick) {
        
        return null;
    }

    // 커뮤니티 댓글 수정
    public boolean cmreUpdate(CommReplyVO crvo) {
       
        return false; // 수정 실패 시 false 반환
    }

    // 커뮤니티 댓글 삭제
    public boolean cmreDelete(int cmreNo) {	// 삭제할 때는 댓글 번호만 존재
        
        return false; // 삭제 실패 시 false 반환
    }

    // 댓글 수 조회
    public int cmreCount(int cmNo) {
       
        return 0;
    }

}
    
