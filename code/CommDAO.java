package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import talkdogg.vo.CommVO;

public class CommDAO {
	private Connection con;
    
    public CommDAO(Connection con) {	// setter/getter 말고 생성자로
		this.con = con;
	}
    private String query; // 멤버 변수 지정
	private PreparedStatement pstmt;
	private ResultSet rs;
	private CommVO cmvo;
	
    // 커뮤니티 글 등록
    public boolean commInsert(CommVO cmvo) {
        
        return true; // 등록 성공 시 true 반환
    }

    // 커뮤니티 글 전체 목록 조회 + 페이징 + 검색
    public List<CommVO> commSelectAll(double start, int count, String search, String keyword, String category) {
       
        return null;
    }

    // 커뮤니티 개별 목록 조회
    public List<CommVO> commSelect(double start, int count, String cmNick) {
        
        return null;
    }

    // 커뮤니티 글 상세 조회
    public CommVO commSelect(int cmNo) {
        return null;
    }

    // 커뮤니티 글 수정
    public boolean commUpdate(CommVO cmvo) {
       
        return false; // 수정 실패 시 false 반환
    }

    // 커뮤니티 글 삭제
    public boolean commDelete(int cmNo) {
        
        
        return false; // 삭제 실패 시 false 반환
    }

    // 조회 수 증가
    public void commHit(int cmNo) {
        
    }

    // 공감 수 증가
    public void commHeart(int cmNo) {
       
    }

    // 게시물 개수 조회
    public int commCount(String searchOption, String keyword, String category) {
       
        return 0;
    }

}
    
