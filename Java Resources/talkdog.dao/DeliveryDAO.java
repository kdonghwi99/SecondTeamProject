package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import talkdog.vo.DeliveryVO;
import talkdog.vo.PaymentVO;

public class DeliveryDAO {
	private Connection con;
    public DeliveryDAO(Connection con) {   // setter/getter 말고 생성자로
      this.con = con;
   }
   private String query; // 멤버 변수 지정
   private PreparedStatement pstmt;
   private ResultSet rs;
	
	
    // 배송정보 등록 메서드
    public boolean delInsert(DeliveryVO dvo) {
    	try {
		query = " INSERT INTO delivery " +
				" VALUES(?,?,?,?,?,?,?,?,?)";			//insert 쿼리문
		pstmt = con.prepareStatement(query);
		pstmt.setInt(1, dvo.getDelNo());
		pstmt.setString(2, dvo.getDelName());
		pstmt.setString(3, dvo.getDelAddress1());
		pstmt.setString(4, dvo.getDelAddress2());
		pstmt.setString(5, dvo.getDelAddress3());
		pstmt.setString(6, dvo.getDelPhone());
		pstmt.setString(7, dvo.getDelMemo());
		pstmt.setString(8, dvo.getDelMemo());		//주문번호
		//tmt.setString(9, dvo.get());				//회원 아이디

		int result = pstmt.executeUpdate();
		if (result == 1) {
			return true;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return false;
    }

    // 배송정보 개별 조회
    public DeliveryVO delSelect(String ordNo) {
       	DeliveryVO dvo = null;
    	try {
    			query = " SELECT * FROM delivery WHERE ord_no=? ";
    			pstmt = con.prepareStatement(query);
    			pstmt.setString(1, ordNo);

        		rs = pstmt.executeQuery(); // rs.next 시 다음 값이 있다면 true, 없다면 null 반환
        		while (rs.next()==true) { // 조회된 레코드들이 있다면
        			dvo = new DeliveryVO(); // MemoVO객체를 생성, 아니면 생성X
                    dvo.setDelNo(rs.getInt("delNo"));
                    dvo.setOrdNo(rs.getString("ordNo"));
                    dvo.setDelName(rs.getString("delName"));
                    dvo.setDelAddress1(rs.getString("delAddress1"));
                    dvo.setDelAddress2(rs.getString("delAddress2"));
                    dvo.setDelAddress3(rs.getString("delAddress3"));
                    dvo.setDelPhone(rs.getString("delPhone"));
                    dvo.setDelMemo(rs.getString("delMemo"));
                    }
        	} catch (SQLException e) {
        		e.printStackTrace();
        	} 
        	return dvo;
    }
}
