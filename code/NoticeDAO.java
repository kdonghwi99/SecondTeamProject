package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import talkdogg.vo.NoticeVO;

public class NoticeDAO {
	private Connection con;
    
    public NoticeDAO(Connection con) {	// setter/getter 말고 생성자로
		this.con = con;
	}
    private String query; // 멤버 변수 지정
	private PreparedStatement pstmt;
	private ResultSet rs;
	private NoticeVO nvo;
	
    // 공지사항 등록
    public boolean noticeInsert(NoticeVO nvo) {
        
        return true; // 등록 성공 시 true 반환
    }

    // 공지사항 전체 목록 조회 + 페이징 + 검색
    public List<NoticeVO> noticeSelectAll(double start, int count, String searchOption, String keyword, String category) {
        
        return null;
    }

    // 공지사항 상세 조회
    public NoticeVO noticeSelect(int notNo) {
    	return null;
    }

    // 공지사항 수정
    public boolean noticeUpdate(NoticeVO nvo) {
        return false; // 수정 실패 시 false 반환
    }

    // 공지사항 삭제
    public boolean noticeDelete(int notNo) {
        return false; // 삭제 실패 시 false 반환
    }

    // 조회 수 증가
    public void noticeHit(int notNo) {
    }

    // 공지사항 개수 조회
    public int noticeCount(String searchOption, String keyword, String category) {
        // 원하는 조건에 맞게 공지사항 개수를 조회하는 로직 작성
        int totalCount = 0;
        // ...
        return totalCount;
    }
    
}
