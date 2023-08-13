package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import talkdog.vo.CommVO;

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
    	query = "INSERT INTO comm VALUES (COMMUNITY_SEQ.NEXTVAL,?,?,?,?,SYSDATE,?,?)";

		try { 
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, cmvo.getCmTitle());
			pstmt.setString(2, cmvo.getCmCont());
			pstmt.setInt(3, cmvo.getCmHeart());
			pstmt.setInt(4, cmvo.getCmHit());
			pstmt.setString(5, cmvo.getAdmId());
			pstmt.setInt(6, cmvo.getCatNo());

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

    // 커뮤니티 글 전체 목록 조회 + 페이징 + 검색
    public List<CommVO> commSelectAll(double amount, int pageNum, String search, String keyword, int catNo) {
    	List<CommVO> cmvoList = new ArrayList<>();
    	cmvo = null;
		try {
			query = " SELECT cc.*, a.adm_nick, cat.category FROM "
					+ " (SELECT ROWNUM AS rnum, c.* FROM "      
					+ " (SELECT * FROM comm ";
			
			if(!search.equals("") && !keyword.equals("")) {	
				query += " WHERE " + search + " LIKE '%" + keyword + "%' ";
				if(catNo != 0) {
					query += " AND category_no = " + catNo;
				}
			} else if(search.equals("") || keyword.equals("")) {
				if(catNo != 0) {
					query += " WHERE category_no = " + catNo;
				}
			}
			
			query += " ORDER BY cm_no DESC) c "
					+ " WHERE ROWNUM <= ? * ?) cc "
					+ " JOIN admin a ON cc.adm_id = a.adm_id "
					+ " JOIN category cat ON cc.category_no = cat.category_no "
					+ " WHERE rnum > ? * ? ";

			pstmt = con.prepareStatement(query);
			pstmt.setDouble(1, amount);
			pstmt.setInt(2, pageNum);
			pstmt.setDouble(3, amount);
			pstmt.setInt(4, (pageNum - 1));
			
			rs = pstmt.executeQuery();
			while (rs.next()) { 		// 조회되는 레코드가 있다면 VO객체를 생성하여 해당 레코드 값을 저장
				cmvo = new CommVO(); 	// 레코드를 저장할 객체
				cmvo.setCmNo(rs.getInt("cm_no"));			
				cmvo.setCmTitle(rs.getString("cm_title"));
				cmvo.setCmCont(rs.getString("cm_cont"));
				cmvo.setCmNick(rs.getString("adm_nick"));
				cmvo.setCmHeart(rs.getInt("cm_heart"));
				cmvo.setCmHit(rs.getInt("cm_hit"));
				cmvo.setCatNo(rs.getInt("category_no"));
				cmvo.setCategory(rs.getString("category"));
				cmvo.setCmDate(rs.getDate("comm_Date"));
				cmvo.setAdmId(rs.getString("adm_id"));
				cmvo.setCmRn(rs.getInt("rnum"));

				cmvoList.add(cmvo); // List 객체에 mvo 데이터 추가
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt, rs); // 사용했던 rs, pstmt 순으로 닫음
		}
		return cmvoList;
    }

    // 커뮤니티 개별 목록 조회	-> 내 글 보기
    public List<CommVO> commSelect(double amount, int pageNum, String search, String keyword, String admId, int catNo) {
    	cmvo = null;		// 지역변수는 초기화 필수
		List<CommVO> cmvoList = new ArrayList<>(); 
		try {	
			query = " SELECT cc.*, a.adm_nick, cat.category FROM "
					+ " (SELECT ROWNUM AS rnum, c.* FROM "
					+ " (SELECT * FROM comm WHERE adm_id = '" + admId + "'";
			if(!search.equals("") && !keyword.equals("")) {	
				query += " AND " + search + " LIKE '%" + keyword + "%' ";
			}
			if(catNo != 0) {
				query += " AND category_no = " + catNo;
			}
			query +=  " ORDER BY cm_no DESC) c "
					+ " WHERE ROWNUM <= ? * ?) cc "
					+ " JOIN admin a ON cc.adm_id = a.adm_id "
					+ " JOIN category cat ON cc.category_no = cat.category_no "
					+ " WHERE rnum > ? * ? ";			
			pstmt = con.prepareStatement(query);	
			
			pstmt.setDouble(1, amount);
			pstmt.setInt(2, pageNum);
			pstmt.setDouble(3, amount);
			pstmt.setInt(4, (pageNum - 1));
			
			rs = pstmt.executeQuery();				

			while(rs.next()) {			// 조회되는 레코드가 있다면 VO객체를 생성하여 해당 레코드 값을 저장
				cmvo = new CommVO();	// 레코드를 저장할 객체
				cmvo.setCmNo(rs.getInt("cm_no"));			
				cmvo.setCmTitle(rs.getString("cm_title"));
				cmvo.setCmCont(rs.getString("cm_cont"));
				cmvo.setCmNick(rs.getString("adm_nick"));
				cmvo.setCmHeart(rs.getInt("cm_heart"));
				cmvo.setCmHit(rs.getInt("cm_hit"));
				cmvo.setCatNo(rs.getInt("category_no"));
				cmvo.setCategory(rs.getString("category"));
				cmvo.setCmDate(rs.getDate("comm_Date"));
				cmvo.setAdmId(rs.getString("adm_id"));
				cmvo.setCmRn(rs.getInt("rnum"));
				cmvoList.add(cmvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
//			DBConn.close(pstmt, rs);	// 사용했던 rs, pstmt 순으로 닫음
		}
		return cmvoList;
    }

    // 커뮤니티 글 상세 조회
    public CommVO commSelect(int cmNo) {
    	cmvo = null; // 지역변수는 초기화 필수
		try {
			query = " SELECT c.*, a.adm_nick, cat.category FROM comm c "
					+ " JOIN admin a ON c.adm_id = a.adm_id "
					+ " JOIN category cat ON c.category_no = cat.category_no "
					+ " WHERE c.cm_no = ? "; 
			pstmt = con.prepareStatement(query); 
			pstmt.setInt(1, cmNo); 
			rs = pstmt.executeQuery(); 

			while (rs.next()) { 		// 조회되는 레코드가 있다면 VO객체를 생성하여 해당 레코드 값을 저장
				cmvo = new CommVO();
				cmvo.setCmNo(rs.getInt("cm_no"));			
				cmvo.setCmTitle(rs.getString("cm_title"));
				cmvo.setCmCont(rs.getString("cm_cont"));
				cmvo.setCmNick(rs.getString("adm_nick"));
				cmvo.setCmHeart(rs.getInt("cm_heart"));
				cmvo.setCmHit(rs.getInt("cm_hit"));
				cmvo.setCatNo(rs.getInt("category_no"));
				cmvo.setCategory(rs.getString("category"));
				cmvo.setCmDate(rs.getDate("comm_Date"));
				cmvo.setAdmId(rs.getString("adm_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt, rs); // 사용했던 rs, pstmt 순으로 닫음
		}
		return cmvo;
    }

    // 커뮤니티 글 수정
    public boolean commUpdate(CommVO cmvo) {
    	query = "UPDATE comm SET cm_title = ?, cm_cont = ? WHERE cm_no = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, cmvo.getCmTitle()); 
			pstmt.setString(2, cmvo.getCmCont()); 
			pstmt.setInt(3, cmvo.getCmNo());

			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
			if (result == 1) // 정상적으로 업데이트 시 true 반환
				return true;

		} catch (SQLException e) { // 예외 처리
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt); // pstmt만 닫음
		}

		return false; // 실패 시 false 반환
    }

    // 커뮤니티 글 삭제
    public boolean commDelete(int cmNo) {
    	query = "DELETE FROM comm WHERE cm_no = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cmNo); 

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
    public void commHit(int cmNo) {
    	try {
			query = "UPDATE comm SET cm_hit = cm_hit + 1 WHERE cm_no = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cmNo);
			
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

    // 공감 수 증가
    public void commHeartPlus(int cmNo) {
    	try {
			query = "UPDATE comm SET cm_heart = cm_heart + 1 WHERE cm_no = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cmNo);
			
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
    
    // 공감 수 감소
//    public void commHeartMinus(int cmNo) {
//    	try {
//			query = "UPDATE comm SET cm_heart = cm_heart - 1 WHERE cm_no = ?";
//			pstmt = con.prepareStatement(query);
//			pstmt.setInt(1, cmNo);
//			
//			rs = pstmt.executeQuery();
//			
//			if (rs.next()) { 
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//		}
//    }

    // 게시물 개수 조회
    public int commCount(String search, String keyword, int catNo) {
    	int count = 0;
		try {
			query = "SELECT COUNT(*) FROM comm ";
			
			if(!search.equals("") && !keyword.equals("")) {	
				query += " WHERE " + search + " LIKE '%" + keyword + "%' ";
				if(catNo != 0) {
					query += " AND category_no = " + catNo;
				}
			} else if(search.equals("") || keyword.equals("")) {
				if(catNo != 0) {
					query += " WHERE category_no = " + catNo;
				}
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

    // 내 글 게시물 개수 조회
    public int commCount(String search, String keyword, int catNo, String admId) {
    	int count = 0;
		try {
			query = "SELECT COUNT(*) FROM comm WHERE adm_id = '" + admId + "'";
			
			if(!search.equals("") && !keyword.equals("")) {	
				query += " AND " + search + " LIKE '%" + keyword + "%' ";
			}
			if(catNo != 0) {
				query += " AND category_no = " + catNo;
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
    
