package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import talkdog.vo.PaymentVO;

public class PaymentDAO {
   private String query; // 쿼리문 저장
   private PreparedStatement pstmt;
   private ResultSet rs; //select쿼리 저장
   
	private Connection con;
    public PaymentDAO(Connection con) {   // setter/getter 말고 생성자로
      this.con = con;
   }
	
	
    // 결제내역 등록 메서드
    public boolean payInsert(PaymentVO payvo) {
		try {
			query = " INSERT INTO payment " +
					" VALUES(?,?,?,?,?,?,?)";			//insert 쿼리문
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, payvo.getAdmId());
			pstmt.setString(2, payvo.getPayAgree());
			pstmt.setInt(3, payvo.getPayTotal());
			pstmt.setString(4, payvo.getOrdNo());
			pstmt.setString(5, payvo.getPayDate());
			pstmt.setString(6, payvo.getPayCancleDate());
			pstmt.setString(7, payvo.getAdmId());

			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	
    	return false;
    }

    // 결제내역 조회 메서드
    public PaymentVO paySelect(String ordNo) { 		//조회할 주문번호
    	PaymentVO payvo = null;
       	try {
    			query = " SELECT * FROM payment WHERE ord_no=? ";
    			pstmt = con.prepareStatement(query);
    			pstmt.setString(1, ordNo);

        		rs = pstmt.executeQuery(); // rs.next 시 다음 값이 있다면 true, 없다면 null 반환
        		while (rs.next()==true) { // 조회된 레코드들이 있다면
        			payvo = new PaymentVO(); // MemoVO객체를 생성, 아니면 생성X
                    payvo.setAdmId(rs.getString("admId"));
                    payvo.setPayAgree(rs.getString("payAgree"));
                    payvo.setPayTotal(rs.getInt("payTotal"));
                    payvo.setOrdNo(rs.getString("ordNo"));
                    payvo.setPayDate(rs.getString("payDate"));
                    payvo.setPayCancleDate(rs.getString("payCancleDate"));
        		}
        	} catch (SQLException e) {
        		e.printStackTrace();
        	} 
        	return payvo;
    }
    
	// 결제내역 수정 메서드
    public boolean payUpdate(PaymentVO payvo) {
        try {
            query = " UPDATE payment " +
                           " SET pay_cancledate = ? " +
                           " WHERE pay_no = ? ";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, payvo.getPayCancleDate());
            pstmt.setString(2, payvo.getPayNo());

            int result = pstmt.executeUpdate();
            if (result == 1) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
	}
}
