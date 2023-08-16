package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import talkdog.util.DBConn;
import talkdog.vo.ReviewVO;

public class ReviewDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;	
	private String query;	
    // 상품 리뷰 등록
	
	public ReviewDAO() {
		this.con = DBConn.getConnection();
	}
    public ReviewDAO(Connection con) {
        this.con = con;
    }
	
    public boolean reviewEnroll(ReviewVO rvo) {
        try {
            // insert 쿼리문
            query = "INSERT INTO review VALUES (review_seq.NEXTVAL, ?, SYSDATE, ?, ?)";
            
            // DBConn에 싱글톤패턴으로 만들어둔 커넥션 사용
            pstmt = con.prepareStatement(query);          
            pstmt.setString(1, rvo.getReview());
            pstmt.setString(2, rvo.getpId());
            pstmt.setString(3, rvo.getAdmId());
            
            int execute = pstmt.executeUpdate();    // executeUpdate가 잘 되면, 성공 실행 건수 1이 반환됨
            if(execute == 1) {
                return true;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(pstmt);
        }

        // 정상적으로 회원가입 성공 시 true 반환
        // 그렇지 않으면 false 반환
        return false;
    }
    // 상품 리뷰 등록 로직 구현
    // 성공하면 true, 실패하면 false 반환

    // 상품 리뷰 목록 상품별로 조회
    public List<ReviewVO> reviewSelect(String pid){	
		List<ReviewVO> rvoList = new ArrayList<>();
		
		try {
			query = "SELECT * FROM review WHERE p_id=? ORDER BY r_date ASC";

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pid);	// 물음표 바인딩

			rs = pstmt.executeQuery();	// 쿼리실행 -> 받는 값이 있는 read이므로 executeQuery();

			  while (rs.next()) {
	                ReviewVO rvo = new ReviewVO();
	                rvo.setrNo(rs.getInt("r_no"));
	                rvo.setAdmId(rs.getString("adm_id"));
	                rvo.setReview(rs.getString("review"));
	                rvo.setrDate(rs.getDate("r_date"));
	                rvo.setpId(rs.getString("p_id"));
	                rvoList.add(rvo);
	            }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rvoList;
	}
    

    // 상품 리뷰 목록 회원별로 조회
    public List<ReviewVO> memberreview(String userId) {
        List<ReviewVO> rvoList = new ArrayList<>();
        try {
            query = "SELECT * FROM review WHERE adm_id=? ORDER BY r_date ASC";

            pstmt = con.prepareStatement(query);
            pstmt.setString(1, userId);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                ReviewVO rvo = new ReviewVO();
                rvo.setrNo(rs.getInt("r_no"));
                rvo.setAdmId(rs.getString("adm_id"));
                rvo.setReview(rs.getString("review"));
                rvo.setrDate(rs.getDate("r_date"));
                rvo.setpId(rs.getString("p_id"));
                rvoList.add(rvo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rvoList;
    }

 
    
    
    // 상품 리뷰 수정
    public boolean reviewUpdate(ReviewVO rvo) {
    	
        // 상품 리뷰 수정 로직 구현
        // 성공하면 true, 실패하면 false 반환
    	 try {
	            // UPDATE 쿼리문
	            query = "UPDATE review SET review=? WHERE r_no=?";

	            // DBConn에 싱글톤패턴으로 만들어둔 커넥션 사용
	            pstmt = con.prepareStatement(query); //prepareStatement는 쿼리를 미리 준비해뒀으니까 매개변수로 query받음
	            pstmt.setString(1, rvo.getReview());
	            pstmt.setInt(2, rvo.getrNo());
	            

	            int execute = pstmt.executeUpdate();    // executeUpdate가 잘 되면, 성공 실행 건수 1이 반환됨
	            if (execute == 1) {
	                return true;
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBConn.close(pstmt);
	        }
	        return false;
    }

    // 상품 리뷰 삭제
    public boolean reviewDelete(int rNo) {
        // 상품 리뷰 삭제 로직 구현
        // 성공하면 true, 실패하면 false 반환
       	try {
    			// delete 쿼리문
    			query = "DELETE FROM review WHERE r_no=?";
    			
    			pstmt = con.prepareStatement(query);		// prepareStatement는 쿼리를 미리 준비해뒀으니까 매개변수로 query받음
    			
    			pstmt.setInt(1, rNo);

    			int execute = pstmt.executeUpdate(); // executeUpdate가 잘 되면, 성공 실행 건수 1이 반환됨
    			if (execute == 1) {
    				return true;
    			}
    		}catch (SQLException e) {
    			e.printStackTrace();
    		}finally {
    			DBConn.close(pstmt);
    		} 
    		
    		return false;
    }
   
}