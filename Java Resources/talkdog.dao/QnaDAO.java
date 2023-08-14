package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import talkdog.vo.QnaVO;

public class QnaDAO {
	
	//이번에는 커넥션 객체를 MemberDAO에서 했던 것처럼 setter가 아니라 '매개변수가 있는 기본생성자'를 통해 사용할 것
	private Connection con;
	private String query; // 멤버 변수 지정
	private PreparedStatement pstmt;
	private ResultSet rs;
	    
	//setter/getter 말고 생성자로! 생성자에게 커넥션 객체를 넘기면, 그 객체를 받아서 DAO의 con에 넣음
	   public QnaDAO(Connection con) {   
	      this.con = con;
	   }
	    
	   //문의글 전체 조회
	   //카테고리 : 주문관련, 배송관련, 커뮤니티, 기타
	   public List<QnaVO> qnaSelectAll(double amount, int pageNum, String category){
		   List<QnaVO> qvoList = new ArrayList<QnaVO>();
		   QnaVO qvo = null;
		   
			try { 
				query = " SELECT * "
						+ "FROM (SELECT ROWNUM AS rnum, q.* "
						+ "         FROM   (SELECT * FROM qna ";
				
				if(category.equals("문의카테고리")) {
					category="";
				}
				if(!category.equals("")) {		//카테고리가 선택되었을 경우
					query += " WHERE qna_category='" + category + "' ";
				}
				
				query += " ORDER BY qna_no DESC) q "
						+ " WHERE  ROWNUM <= ? * ? ) "
						+ "WHERE  rnum > ? * ? ";
				
				pstmt = con.prepareStatement(query);
				pstmt.setDouble(1, amount);
				pstmt.setInt(2, pageNum);
				pstmt.setDouble(3, amount);
				pstmt.setInt(4, (pageNum - 1));

				rs = pstmt.executeQuery();
				while (rs.next()) {				 
					qvo = new QnaVO();
					qvo.setQnaNo(rs.getInt("qna_no"));
					qvo.setQnaRn(rs.getInt("rnum"));
					qvo.setAdmId(rs.getString("adm_id"));
					qvo.setQnaDate(rs.getDate("qna_date"));
					qvo.setQnaAnswer(rs.getString("qna_answer"));
					qvo.setQnaCategory(rs.getString("qna_category"));
					qvo.setQnaSecCategory(rs.getString("qna_sec_category"));
					qvo.setQnaTitle(rs.getString("qna_title"));
					qvo.setQnaContent(rs.getString("qna_content"));
					qvo.setQnaReply(rs.getString("qna_reply"));
					qvo.setQnaReplyDate(rs.getDate("qna_reply_date"));
					
					qvoList.add(qvo);  //List 객체에 추가
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			return qvoList;
	   }
	   
	   
	   //나의 문의글 조회 
	   public List<QnaVO> qnaSelectMine(String sid, double amount, int pageNum, String category){
			
		   List<QnaVO> qvoList = new ArrayList<QnaVO>();	// 멤버객체를 넣을 리스트
		   QnaVO qvo = null;
			
			try {
				query = " SELECT * "
						+ "FROM (SELECT ROWNUM AS rnum, q.* "
						+ "         FROM   (SELECT * FROM qna "
						+ " 					  WHERE adm_id = '" + sid + "' ";
				if(!category.equals("")) {		//카테고리가 선택되었을 경우
					query += " AND qna_category = '" + category + "' ";
				}
				query += " ORDER BY qna_no DESC) q "
							+ " WHERE  ROWNUM <= ? * ? ) "
							+ " WHERE  rnum > ? * ? ";
				
				pstmt = con.prepareStatement(query);
				pstmt.setDouble(1, amount);
				pstmt.setInt(2, pageNum);
				pstmt.setDouble(3, amount);
				pstmt.setInt(4, (pageNum - 1));

				rs = pstmt.executeQuery();
				while (rs.next() == true) {				 
					qvo = new QnaVO();
					qvo.setQnaNo(rs.getInt("qna_no"));
					qvo.setQnaRn(rs.getInt("rnum"));
					qvo.setAdmId(rs.getString("adm_id"));
					qvo.setQnaDate(rs.getDate("qna_date"));
					qvo.setQnaAnswer(rs.getString("qna_answer"));
					qvo.setQnaCategory(rs.getString("qna_category"));
					qvo.setQnaSecCategory(rs.getString("qna_sec_category"));
					qvo.setQnaTitle(rs.getString("qna_title"));
					qvo.setQnaContent(rs.getString("qna_content"));
					qvo.setQnaReply(rs.getString("qna_reply"));
					qvo.setQnaReplyDate(rs.getDate("qna_reply_date"));
					
					qvoList.add(qvo);  //List 객체에 추가
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			return qvoList;
	   }

	   
	   //답변대기 문의글 조회
	   public List<QnaVO> qnaSelectWating(double amount, int pageNum, String category){
		   
		   List<QnaVO> qvoList = new ArrayList<QnaVO>();	// 멤버객체를 넣을 리스트
		   QnaVO qvo = null;
			
			try {
				query = " SELECT * "
						+ " FROM (SELECT ROWNUM AS rnum, q.* "
						+ " FROM   (SELECT * FROM qna "
						+ " WHERE qna_answer = '답변대기' ";
				if(!category.equals("")) {									//카테고리가 선택되었을 경우
					query += " AND qna_category LIKE '%" + category + "%' ";
				}
			query += " ORDER BY qna_no DESC) q "
						+ " WHERE  ROWNUM <= ? * ? ) "
						+ "WHERE  rnum > ? * ? ";
				
				pstmt = con.prepareStatement(query);
				pstmt.setDouble(1, amount);
				pstmt.setInt(2, pageNum);
				pstmt.setDouble(3, amount);
				pstmt.setInt(4, (pageNum - 1));

				rs = pstmt.executeQuery();
				while (rs.next() == true) {				 
					qvo = new QnaVO();
					qvo.setQnaNo(rs.getInt("qna_no"));
					qvo.setQnaRn(rs.getInt("rnum"));
					qvo.setAdmId(rs.getString("adm_id"));
					qvo.setQnaDate(rs.getDate("qna_date"));
					qvo.setQnaAnswer(rs.getString("qna_answer"));
					qvo.setQnaCategory(rs.getString("qna_category"));
					qvo.setQnaSecCategory(rs.getString("qna_sec_category"));
					qvo.setQnaTitle(rs.getString("qna_title"));
					qvo.setQnaContent(rs.getString("qna_content"));
					qvo.setQnaReply(rs.getString("qna_reply"));
					qvo.setQnaReplyDate(rs.getDate("qna_reply_date"));
					
					qvoList.add(qvo);  //List 객체에 추가
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			return qvoList;
	   }
	   
	   
	   //문의글 상세조회
	   public QnaVO qnaSelectOne(int qnaNo){
		   QnaVO qvo = null;
			try {
				//rnum도 함께 select하되, 상세조회화면에서 사용하지 않음
				query = "SELECT ROWNUM as rnum, q.* FROM qna q WHERE qna_no=?";		
				
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, qnaNo);	// 물음표 바인딩
				
				rs = pstmt.executeQuery();	// 쿼리실행 -> 받는 값이 있는 read이므로 executeQuery();
				
				if(rs.next()) {		
					qvo = new QnaVO();		// rs가 있을 때에만 qvo 생성
					qvo.setQnaNo(rs.getInt("qna_no"));
					qvo.setQnaRn(rs.getInt("rnum"));
					qvo.setAdmId(rs.getString("adm_id"));
					qvo.setQnaDate(rs.getDate("qna_date"));
					qvo.setQnaAnswer(rs.getString("qna_answer"));
					qvo.setQnaCategory(rs.getString("qna_category"));
					qvo.setQnaSecCategory(rs.getString("qna_sec_category"));
					qvo.setQnaTitle(rs.getString("qna_title"));
					qvo.setQnaContent(rs.getString("qna_content"));
					qvo.setQnaReply(rs.getString("qna_reply"));
					qvo.setQnaReplyDate(rs.getDate("qna_reply_date"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}		
			return qvo;
	   }
	   
	   
	   //문의글 등록
	   public boolean qnaInsert(QnaVO qvo) {
		   try {
				// insert 쿼리문
				query = "INSERT INTO qna VALUES (qna_seq.NEXTVAL, SYSDATE, '답변대기', ?, ?, ?, ?, null, null, ?)";
			
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, qvo.getQnaCategory());		//카테고리
				pstmt.setString(2, qvo.getQnaSecCategory());//하위카테고리
				pstmt.setString(3, qvo.getQnaTitle());				//제목
				pstmt.setString(4, qvo.getQnaContent());		//내용
				pstmt.setString(5, qvo.getAdmId());				//아이디
				
				int execute = pstmt.executeUpdate();	
				if(execute==1) {
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();		
			}
			return false;
	   }
	   
	  
	   //문의글 수정 - 카테고리, 하위카테고리, 제목, 내용 수정 가능
	   public boolean qnaUpdate(QnaVO qvo) {

		   try {
				// insert 쿼리문
				query = "UPDATE qna SET qna_category=?, qna_sec_category=?, qna_title=?, qna_content=? WHERE qna_no=?";

				pstmt = con.prepareStatement(query); 
				pstmt.setString(1, qvo.getQnaCategory());			//카테고리
				pstmt.setString(2, qvo.getQnaSecCategory());		//하위카테고리
				pstmt.setString(3, qvo.getQnaTitle());					//제목
				pstmt.setString(4, qvo.getQnaContent());			//내용
				pstmt.setInt(5, qvo.getQnaNo());						//문의글번호		
				
				int execute = pstmt.executeUpdate();	
				if(execute==1) {
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			  }
			return false;
	   }
	   
	   
	   
	   //문의글 삭제
	   public boolean qnaRemove(int qnaNo) {
		   try {
				// delete 쿼리문
				query = "DELETE FROM qna WHERE qna_no=?";
				
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, qnaNo);

				int execute = pstmt.executeUpdate(); // executeUpdate가 잘 되면, 성공 실행 건수 1이 반환됨
				if (execute == 1) {
					return true;
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
	   }
	   
	   
	   //문의글 개수(페이징처리) - 일반 조회
	   public int qnaCount(String category) {
		   
		   int cnt = 0;	//글 개수
			try {
				query = " SELECT COUNT(*) FROM qna ";
				if( !category.equals("") ) {
					query += " WHERE qna_category= '" + category + "' ";
				}
				pstmt = con.prepareStatement(query);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {				 
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return cnt;
	   }//END qnaCount()
	   
	   
	   //내가 쓴 문의글 개수
	   public int qnaMCount(String category, String sId) {
		   
		   int cnt = 0;	//글 개수
			try {
				query = " SELECT COUNT(*) FROM qna "
						+ " WHERE adm_id = '" + sId + "'";
				if( !category.equals("") ) {
					query += " AND qna_category= '" + category + "' ";
				}
				pstmt = con.prepareStatement(query);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {				 
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return cnt;
	   }//END qnaCount()
	   
	 
	   
	   //답변대기중인 문의글 개수
	   public int qnaWCount(String category) {
		   
		   int cnt = 0;	//글 개수
			try {
				query = " SELECT COUNT(*) FROM qna "
						+ " WHERE qna_answer ='답변대기' ";
				if( !category.equals("") ) {
					query += " AND qna_category= '" + category + "' ";
				}
				pstmt = con.prepareStatement(query);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {				 
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return cnt;
	   }//END qnaWCount()
	   
	   
	   
	   
	   //댓글 등록, 수정, 삭제
	   //qnaReply의 값이 들어있으면 답변처리현황이 '답변완료'로 바껴야 함
	   //qnaReply의 값이 들어있지 않으면 답변처리현황이 '답변대기'로 바뀌고 replyDate도 빈 칸으로 바뀌어야 함
	   
	   public boolean replyUpdate(int qnaNo, String qnaReply) {
		   try {
			   if(qnaReply.equals("")) {					 //qnaReply에 값이 없으면
				   query = "UPDATE qna SET qna_answer='답변대기', qna_reply=null, qna_reply_date=null WHERE qna_no=?";
				   pstmt = con.prepareStatement(query);
				   pstmt.setInt(1, qnaNo);					//문의글번호		
			   
			   }else if(!qnaReply.equals("")) {		 //qnaReply에 값이 있으면
				   query = "UPDATE qna SET qna_answer='답변완료', qna_reply=?, qna_reply_date=sysdate WHERE qna_no=?";
				   pstmt = con.prepareStatement(query); 	//prepareStatement는 쿼리를 미리 준비해뒀으니까 매개변수로 query받음
					pstmt.setString(1, qnaReply);			//댓글내용
					pstmt.setInt(2, qnaNo);					//문의글번호		
			   }				
				int execute = pstmt.executeUpdate();	
				if(execute==1) {
					return true;
				}	
			} catch (SQLException e) {
				e.printStackTrace();
			  }
			return false;
	   }//END replyUpdate()
	   

}
