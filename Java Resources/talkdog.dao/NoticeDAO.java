package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import talkdog.vo.CommVO;
import talkdog.vo.NoticeVO;

public class NoticeDAO {
	private Connection con;
    
    public NoticeDAO(Connection con) {	// setter/getter 말고 생성자로
		this.con = con;
	}
    private String query; // 멤버 변수 지정
	private PreparedStatement pstmt;
	private ResultSet rs;
//	private NoticeVO nvo;
	
    // 공지사항 등록
    public boolean noticeInsert(NoticeVO nvo) {
    	query = "INSERT INTO notice values(NOTICE_SEQ.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";

		try { 
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, nvo.getNotCategory());
			pstmt.setString(2, nvo.getNotTitle());
			pstmt.setString(3, nvo.getNotCont());
			pstmt.setInt(4, nvo.getNotHit());
			pstmt.setString(5, nvo.getNotImage());

			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
			if (result == 1) // 정상적으로 회원가입 성공 시 true 반환
				return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt); // con을 생성하지 않았기 때문에 pstmt만 닫음
		}
		return false; // 그렇지 않으면 false 반환
    }

    // 공지사항 전체 목록 조회 + 페이징 + 검색
    public List<NoticeVO> noticeSelectAll(double amount, int pageNum, String search, String keyword, String category) {
    	List<NoticeVO> nvoList = new ArrayList<>();
    	NoticeVO nvo = null;
		try {
			query = " SELECT * FROM "
					+ " (SELECT ROWNUM AS rnum, n.* FROM "
					+ " (SELECT * FROM notice WHERE not_category='" + category + "' ";
			
			 if(!search.equals("") && !keyword.equals("")) {
				 query += " AND " + search + " LIKE '%" + keyword + "%' "; }
			 
			query +=  " ORDER BY not_no DESC) n "
					+ " WHERE ROWNUM <= ? * ?) "
					+ " WHERE rnum > ? * ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setDouble(1, amount);
			pstmt.setInt(2, pageNum);
			pstmt.setDouble(3, amount);
			pstmt.setInt(4, (pageNum - 1));
			
			rs = pstmt.executeQuery();
			while (rs.next()) { 		// 조회되는 레코드가 있다면 VO객체를 생성하여 해당 레코드 값을 저장
				nvo = new NoticeVO(); 	// 레코드를 저장할 객체
				nvo.setNotRn(rs.getInt("rnum"));
				nvo.setNotNo(rs.getInt("not_no"));			
				nvo.setNotCategory(rs.getString("not_category"));
				nvo.setNotTitle(rs.getString("not_title"));
				nvo.setNotCont(rs.getString("not_cont"));
				nvo.setNotHit(rs.getInt("not_hit"));
				nvo.setNotImage(rs.getString("not_image"));
				nvo.setNotDate(rs.getDate("not_date"));

				nvoList.add(nvo); // nvoList 객체에 nvo 데이터 추가
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt, rs); // 사용했던 rs, pstmt 순으로 닫음
		}
		return nvoList;
    }

    // 공지사항 상세 조회
    public NoticeVO noticeSelect(int notNo) {
    	NoticeVO nvo = null; // 지역변수는 초기화 필수
		try {
			query = " SELECT * FROM notice WHERE not_no = ? "; 
			pstmt = con.prepareStatement(query); 
			pstmt.setInt(1, notNo); 
			rs = pstmt.executeQuery(); 

			while (rs.next()) { 		// 조회되는 레코드가 있다면 VO객체를 생성하여 해당 레코드 값을 저장
				nvo = new NoticeVO();
				nvo.setNotNo(rs.getInt("not_no"));			
				nvo.setNotCategory(rs.getString("not_category"));
				nvo.setNotTitle(rs.getString("not_title"));
				nvo.setNotCont(rs.getString("not_cont"));
				nvo.setNotHit(rs.getInt("not_hit"));
				nvo.setNotImage(rs.getString("not_image"));
				nvo.setNotDate(rs.getDate("not_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt, rs); // 사용했던 rs, pstmt 순으로 닫음
		}
		return nvo;
    }

    // 공지사항 수정
    public boolean noticeUpdate(NoticeVO nvo) {
    	query = "UPDATE notice SET not_category = ?, not_title = ?, not_cont = ? WHERE not_no = ? ";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, nvo.getNotCategory()); 
			pstmt.setString(2, nvo.getNotTitle()); 
			pstmt.setString(3, nvo.getNotCont()); 
			pstmt.setInt(4, nvo.getNotNo());

			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
			if (result == 1) // 정상적으로 업데이트 시 true 반환
				return true;

		} catch (SQLException e) { // 예외 처리
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt); // pstmt만 닫음
		}
		System.out.println(nvo.getNotCategory());
		System.out.println(nvo.getNotTitle());
		System.out.println(nvo.getNotCont());
		System.out.println(nvo.getNotNo());
		return false; // 실패 시 false 반환
    }

    // 공지사항 삭제
    public boolean noticeDelete(int notNo) {
    	query = "DELETE FROM notice WHERE not_no = ? ";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, notNo); 

			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
			if (result == 1) // 정상적으로 삭제 성공 시 true 반환
				return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt); // pstmt 닫음
		}
		return false; // 실패 시 false 반환
    }

    // 조회 수 증가
    public void noticeHit(int notNo) {
    	try {
			query = "UPDATE notice SET not_hit = not_hit + 1 WHERE not_no = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, notNo);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) { 
//				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt, rs); // 사용했던 rs, pstmt 순으로 닫음
		}
    }

    // 공지사항 개수 조회
    public int noticeCount(String search, String keyword, String category) {
    	int count = 0;
		try {
			query = "SELECT COUNT(*) FROM notice WHERE not_category = '" + category + "'";
			if (!search.equals("") && !keyword.equals("")) {
				query += " AND " + search + " LIKE '%" + keyword + "%'";
			}
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { 
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt, rs); // 사용했던 rs, pstmt 순으로 닫음
		}
		return count;
    }
    
}
