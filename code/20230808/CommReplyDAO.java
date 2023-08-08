package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import talkdog.vo.CommReplyVO;

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
    	query = "INSERT INTO commReply VALUES(COMMREPLY_SEQ.NEXTVAL, ?, SYSDATE, ?, ?) ";

		try { 
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, crvo.getCmreCont());
			pstmt.setInt(2, crvo.getCmNo());
			pstmt.setString(3, crvo.getAdmId());

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

    // 커뮤니티 댓글 전체 목록 조회 + 페이징
    public List<CommReplyVO> cmreSelectAll(double amount, int pageNum, int cmNo) {
    	List<CommReplyVO> crvoList = new ArrayList<>();
    	crvo = null;
		try {
			query = " SELECT cr.*, a.adm_nick FROM "
					+ " (SELECT ROWNUM AS rnum, c.* FROM "
					+ " (SELECT * FROM commReply WHERE cm_no = ? ORDER BY cmre_no DESC) c "
					+ " WHERE ROWNUM <= ? * ?) cr "
					+ " JOIN admin a ON cr.adm_id = a.adm_id "
					+ " WHERE rnum > ? * ? ";
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cmNo);
			pstmt.setDouble(2, amount);
			pstmt.setInt(3, pageNum);
			pstmt.setDouble(4, amount);
			pstmt.setInt(5, (pageNum - 1));
			
			rs = pstmt.executeQuery();
			while (rs.next()) { 		// 조회되는 레코드가 있다면 VO객체를 생성하여 해당 레코드 값을 저장
				crvo = new CommReplyVO(); 	// 레코드를 저장할 객체
				crvo.setCmreNo(rs.getInt("cmre_no"));			
				crvo.setCmreCont(rs.getString("cmre_cont"));
				crvo.setCmreDate(rs.getDate("cmre_date"));
				crvo.setCmNo(rs.getInt("cm_no"));
				crvo.setAdmId(rs.getString("adm_id"));
				crvo.setCmreNick(rs.getString("adm_nick"));
				crvo.setCmreRn(rs.getInt("rnum"));

				crvoList.add(crvo); // List 객체에 mvo 데이터 추가
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt, rs); // 사용했던 rs, pstmt 순으로 닫음
		}
		return crvoList;
    }
    
    // 커뮤니티 내 댓글 개별 목록 조회 + 페이징 -> rn 필요해!
    public List<CommReplyVO> cmreSelect(double amount, int pageNum, String cmreNick) {
    	crvo = null;		
		List<CommReplyVO> crvoList = new ArrayList<>(); 
		try {	
			query = " SELECT cr.*, a.adm_nick FROM "
					+ "(SELECT ROWNUM AS rnum, c.* FROM "
					+ "(SELECT * FROM commReply ORDER BY cmre_no DESC) c "
					+ "WHERE ROWNUM <= ? * ?) cr "
					+ "JOIN admin a ON cr.adm_id = a.adm_id "
					+ "WHERE rnum > ? * ? AND adm_nick = ? ";			
			pstmt = con.prepareStatement(query);	
			pstmt.setDouble(1, amount);
			pstmt.setInt(2, pageNum);
			pstmt.setDouble(3, amount);
			pstmt.setInt(4, (pageNum - 1));
			pstmt.setString(5, cmreNick);
			
			rs = pstmt.executeQuery();							
			
			while(rs.next()) {			// 조회되는 레코드가 있다면 VO객체를 생성하여 해당 레코드 값을 저장
				crvo = new CommReplyVO();	// 레코드를 저장할 객체
				crvo.setCmreNo(rs.getInt("cmre_no"));			
				crvo.setCmreCont(rs.getString("cmre_cont"));
				crvo.setCmreDate(rs.getDate("cmre_date"));
				crvo.setCmNo(rs.getInt("cm_no"));
				crvo.setAdmId(rs.getString("adm_id"));
				crvo.setCmreNick(rs.getString("adm_nick"));
				crvo.setCmreRn(rs.getInt("rnum"));
		
				crvoList.add(crvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
//			DBConn.close(pstmt, rs);	// 사용했던 rs, pstmt 순으로 닫음
		}
		return crvoList;
    }

    // 커뮤니티 댓글 수정
    public boolean cmreUpdate(CommReplyVO crvo) {
    	query = "UPDATE commReply SET cmre_cont = ? WHERE cmre_no = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, crvo.getCmreCont()); 
			pstmt.setInt(2, crvo.getCmreNo()); 

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

    // 커뮤니티 댓글 삭제
    public boolean cmreDelete(int cmreNo) {	// 삭제할 때는 댓글 번호만 존재
    	query = "DELETE FROM commReply WHERE cmre_no = ? ";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cmreNo); 

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

    // 댓글 수 조회
    public int cmreCount(int cmNo) {
    	int count = 0;
		try {
			query = "SELECT COUNT(*) FROM commReply WHERE cm_no = ? " + cmNo;
	
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
    